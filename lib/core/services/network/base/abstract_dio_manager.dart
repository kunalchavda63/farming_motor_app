import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/logger/logger.dart';

class ApiResponse<T> {

  ApiResponse({
    this.data,
    this.message,
    required this.success,
    this.statusCode,
  });

  factory ApiResponse.success(T data) {
    return ApiResponse<T>(data: data, success: true);
  }

  factory ApiResponse.error(String message) {
    return ApiResponse<T>(message: message, success: false);
  }
  final T? data;
  final String? message;
  final bool success;
  final int? statusCode;
}

class HttpMethod {
  factory HttpMethod() => _instance;
  HttpMethod._internal();
  static final HttpMethod _instance = HttpMethod._internal();

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://buildcaresolution.in/waterpump/',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  Options _options(String? token) {
    return Options(
      headers: {
        if (token != null) 'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',

      },
    );
  }

  /// ---------------- GET ----------------
  Future<ApiResponse<T>> get<T>(
      String endpoint, {
        String? token,
        required T Function(dynamic json) fromJson,
      }) async {
    try {
      final response = await _dio.get<Map<String,dynamic>>(
        endpoint,
        options: Options(
          headers: token != null
              ? {
            'Authorization': 'Bearer $token',
            'Content-Type': 'application/json',
            'Accept': 'application/json',

          }
              : null,
        ),
      );

      logger.d(response.data);

      if (response.statusCode == 200) {
        return ApiResponse.success(fromJson(response.data));
      } else {
        return ApiResponse.error('GET failed: ${response.statusCode}');
      }
    } on DioException catch (e, s) {
      logger.e(e, stackTrace: s);
      return ApiResponse.error(e.toString());
    }
  }


  /// ---------------- POST ----------------
  Future<ApiResponse<T>> post<T>(
      String endpoint,
      dynamic body, {
        String? token,
        required T Function(dynamic json) fromJson,
      }) async {
    try {
      final response = await _dio.post<T>(
        endpoint,
        data: body,
        options: _options(token),
      );
      logger.d(response);

      return ApiResponse.success(fromJson(response.data));
    } on DioException catch (e) {
      return ApiResponse.error(e.toString());
    }
  }

  /// ---------------- PUT (UPDATE) ----------------
  Future<ApiResponse<T>> put<T>(
      String endpoint,
      dynamic body, {
        String? token,
        required T Function(dynamic json) fromJson,
      }) async {
    try {
      final response = await _dio.put<T>(
        endpoint,
        data: body,
        options: _options(token),
      );

      return ApiResponse.success(fromJson(response.data));
    }on DioException  catch (e) {
      return ApiResponse.error(e.toString());
    }
  }
}

