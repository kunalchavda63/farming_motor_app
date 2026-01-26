import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:farming_motor_app/core/models/src/user_model/user_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/network/base/abstract_dio_manager.dart';
import 'package:farming_motor_app/core/services/network/constants/app_endpoint.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/logger/logger.dart';

final api = HttpMethod();
final prefs = LocalPreferences();
Future<ApiResponse<List<UserModel>>> fetchUserList() {
  return api.get<List<UserModel>>(

    ApiEndPoints.customerList,
    token: prefs.isAdminToken,
    fromJson: (json) {
      final  list = json['data'] as List; // 👈 IMPORTANT
      logger.d('User count: ${list.length}');
      return list
          .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList();
    },
  );
}


Future<ApiResponse<Map<String,dynamic>>> addPump(PumpDetailModel pumpDetails) {
  return api.post(
    ApiEndPoints.addDevice,
    pumpDetails.toJson(),
    token: prefs.isAdminToken,
    fromJson: (json) {
      return json as Map<String,dynamic>;
    }
  );
}


