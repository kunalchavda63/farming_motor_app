import 'package:farming_motor_app/core/models/models.dart';
import 'package:farming_motor_app/core/models/src/pump_log_model/pump_log_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/network/base/abstract_dio_manager.dart';
import 'package:farming_motor_app/core/services/network/constants/app_endpoint.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/logger/logger.dart';

final api = HttpMethod();
final prefs = LocalPreferences();
Future<ApiResponse<List<PumpDetailModel>>> fetchPumpList() {
  return api.get<List<PumpDetailModel>>(
    ApiEndPoints.myPumps,
    token: prefs.isCustomerToken,
    fromJson: (json) {
      final  list = json['data'] as List; // 👈 IMPORTANT
      logger.d('User count: ${list.length}');
      return list
          .map((e) => PumpDetailModel.fromJson(e as Map<String, dynamic>))
          .toList();
    },
  );
}


Future<ApiResponse<List<PumpLogModel>>> fetchPumpLogs(String serialNumber,String pumpId) {
  return api.get<List<PumpLogModel>>(
    '${ApiEndPoints.pumpLogs}?serialNumber=$serialNumber&pumpID=$pumpId',
    token: prefs.isCustomerToken,
    fromJson: (json) {
      final  list = json['data'] as List; // 👈 IMPORTANT
      logger.d('Total Logs count: ${list.length}');
      return list
          .map((e) => PumpLogModel.fromJson(e as Map<String, dynamic>))
          .toList();
    },
  );
}


Future<ApiResponse<Map<String,dynamic>>> pumpControl({
  required String serialNumber,
  required String pumpId,
  required int action
}) {
  final body =
    {
      'serialNumber': serialNumber,
      'pumpID': pumpId,
      'action': action,
      'time': 0
  };
  return api.post<Map<String,dynamic>>(
    ApiEndPoints.pumpControl,
    body,
    token: prefs.isCustomerToken,
    fromJson: (json)=> json as Map<String,dynamic>,
  );
}
