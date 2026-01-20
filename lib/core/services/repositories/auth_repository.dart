


import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/models/src/create_user_model/create_user_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/network/base/abstract_dio_manager.dart';
import 'package:farming_motor_app/core/services/network/constants/app_endpoint.dart';


LocalPreferences _prefs = LocalPreferences();
HttpMethod _api = HttpMethod();
class AuthRepository {

final Dio _dio = Dio();
  Future<ApiResponse<Map<String, dynamic>>> login({
    required String mobileNumber,
    required String password,
  }) async {
    try {
      final res = await _dio.post<Map<String,dynamic>>(
        ApiEndPoints.login,
        data: {
          'mobileNumber': mobileNumber,
          'password': password,
        },
        options: Options(
          headers: {'Content-Type': 'application/json'},
        ),
      );

      return ApiResponse<Map<String, dynamic>>(
        data: res.data as Map<String, dynamic>, // ✅ Map only
        success: true,
        statusCode: res.statusCode,
      );
    } on DioException catch (e) {
      return ApiResponse<Map<String, dynamic>>(
        success: false,
        message: e.toString(),
      );
    }
  }


  Future<ApiResponse<Map<String,dynamic>>> createUser({
    required CreateUserModel user,

  }) async {
    return _api.post<Map<String,dynamic>>(
      ApiEndPoints.createUser,
      user.toJson(),
      token: _prefs.isAdminToken,
      fromJson: (json) => json as Map<String,dynamic>
    );
  }




}
