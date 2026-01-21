import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
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
