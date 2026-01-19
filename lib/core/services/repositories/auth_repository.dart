


import 'package:farming_motor_app/core/models/src/create_user_model/create_user_model.dart';
import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/network/base/abstract_dio_manager.dart';
import 'package:farming_motor_app/core/services/network/constants/app_endpoint.dart';


LocalPreferences _prefs = LocalPreferences();
DioMethod _api = DioMethod();
class AuthRepository {
  Future<ApiResponse<LoginModel>> login({
    required String mobileNumber,
    required String password,
  }) async {
    return _api.post<LoginModel>(
      ApiEndPoints.login,
      {
        'mobileNumber': mobileNumber,
        'password': password,
      },
         fromJson:  (json) =>
          LoginModel.fromJson(
            json as Map<String, dynamic>, // ✅ FIX
          ),
    );
  }
  Future<ApiResponse<Map<String,dynamic>>> createUser({
    required CreateUserModel user,
  }) async {
    return _api.post<Map<String,dynamic>>(
      ApiEndPoints.createUser,
      user.toJson(),
      token: _prefs.token,
      fromJson: (json) => json as Map<String,dynamic>
    );
  }




}
