import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/api_state.dart';
import 'package:farming_motor_app/core/models/src/pump_log_model/pump_log_model.dart';
import 'package:farming_motor_app/core/services/network/base/app_dio_manager.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/screens/provider/customer_service.dart';

class CustomerProvider extends ChangeNotifier{
  ApiState<List<PumpDetailModel>> pumpListState  = ApiState.initial();
  ApiState<Map<String,dynamic>> pumpControlState = ApiState.initial();
  Map<String, ApiState<List<PumpLogModel>>> pumpLogsMap = {};




  Future<void> loadPumps() async{
    pumpListState = ApiState.loading();
    notifyListeners();

    try {
      final response = await fetchPumpList();
      if(response.success && response.data != null){
        pumpListState = ApiState.success(response.data!);
      }
      else{
        pumpListState = ApiState.error(response.message ?? 'failed to load Pump Lists');
      }
    }
    on DioException catch(e) {
      pumpListState = ApiState.error(e.toString());
    }

    notifyListeners();
  }


  Future<void> loadPumpLogs({
    required String serialNumber,
    required String pumpId,
  }) async {
    final key = '$serialNumber-$pumpId';

    pumpLogsMap[key] = ApiState.loading();
    notifyListeners();

    try {
      final response = await fetchPumpLogs(serialNumber, pumpId);

      if (response.success && response.data != null) {
        pumpLogsMap[key] = ApiState.success(response.data!);
      } else {
        pumpLogsMap[key] = ApiState.error(
          response.message ?? 'Failed to load pump logs',
        );
      }
    } on DioException catch (e) {
      pumpLogsMap[key] = ApiState.error(
        DioErrorHandler.getMessage(e), // ✅ proper message
      );
    }

    notifyListeners();
  }

  Future<void> togglePump({
    required String serialNumber,
    required String pumpId,
    required int action,
    required int time
  }) async {

    pumpControlState = ApiState.loading();
    notifyListeners();

    try {
      final response = await pumpControl(
        serialNumber: serialNumber,
        pumpId: pumpId,
        action: action,
        time: time
      );

      logger.d(response.message);

      // ✅ CORRECT CONDITION
      if (response.success == 'Success') {
        logger.d('Success');
        pumpControlState = ApiState.success(response.message as Map<String, dynamic>);
      } else {
        pumpControlState = ApiState.error(
          response.message ?? 'Pump command failed',
        );
      }

    } on DioException catch (e) {
      pumpControlState = ApiState.error(e.message ?? 'Network error');
    }

    notifyListeners();
  }

  void refreshSwitchState() {
    notifyListeners();
  }
}

