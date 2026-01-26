import 'dart:io';
import 'package:dio/dio.dart';

class DioErrorHandler {
  static String getMessage(DioException e) {
    // 🌐 No Internet
    if (e.error is SocketException) {
      return 'Internet connection failed. Please check your network.';
    }

    // ⏳ Timeout
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Request timeout. Please try again.';
    }

    // 📦 Server response error
    if (e.response != null) {
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;

      final apiMessage =
      data is Map<String, dynamic> ? data['message'] : null;

      switch (statusCode) {
        case 400:
          return apiMessage.toString();
        case 401:
          return apiMessage.toString();
        case 403:
          return apiMessage.toString();
        case 404:
          return apiMessage.toString();
        case 500:
          return 'Server error. Please try later.';
        default:
          return 'Something went wrong.';
      }
    }

    return 'Unexpected error occurred.';
  }
}
