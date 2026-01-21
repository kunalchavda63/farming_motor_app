import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/api_state.dart';
import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:farming_motor_app/features/screens/provider/customer_service.dart';

class CustomerProvider extends ChangeNotifier{
  ApiState<List<PumpDetailModel>> pumpListState  = ApiState.loading();

  Future<void> loadPumps() async{
    pumpListState = ApiState.loading();
    notifyListeners();

    try {
      final response = await fetchPumpList();
      await Future<void>.delayed(const Duration(milliseconds: 800));
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



}