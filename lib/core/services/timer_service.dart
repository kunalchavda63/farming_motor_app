import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/screens/provider/customer_service.dart';
import 'package:workmanager/workmanager.dart';

 const String pumpAutoOffTask = 'pumpAutoOff';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // 1. સૌથી પહેલા prefs ને init કરો, નહીંતર ટોકન null આવશે
    final prefs = LocalPreferences();
    await prefs.init();

    if (task == pumpAutoOffTask) {
      final serial = inputData?['serial'] as String?;
      final pumpId = inputData?['pumpId'] as String?;

      // 2. પ્રેફરન્સમાંથી ટોકન લો
      final token = prefs.isCustomerToken;

      try {
        // 3. API કોલ - અહીં ટોકન મોકલવો ફરજિયાત છે
        final response = await pumpControl(
          serialNumber: serial ?? '',
          pumpId: pumpId ?? '',
          action: 0, // OFF
          time: 0,
          token: token, // આ ટોકન હવે background માં કામ કરશે
        );

        // 4. રિસ્પોન્સ ચેક કરો (તમારા API મુજબ status: "Success")
        if (response.success == 'Success' || response.data?['status'] == 'Success') {
          logger.d('Background: Pump turned OFF successfully');

          await prefs.setPumpState(
            serial: serial ?? '',
                 pumpId: pumpId ?? '',
            value: false,
          );
          await prefs.clearPumpTimer(serial: serial ?? '', pumpId: pumpId ?? '');
        } else {
          logger.e('Background: API reached but failed: ${response.message}');
        }
      } on DioException catch (e) {
        logger.e('Workmanager Critical Error: $e');
        return Future.value(false);
      }
    }
    return Future.value(true);
  });
}



Future<void> startPumpTimer({
  required int minutes,
  required String serial,
  required String pumpId,
}) async {
  final prefs = LocalPreferences();

  await prefs.savePumpTimer(
    serial: serial,
    pumpId: pumpId,
    minutes: minutes,
  );

  await prefs.setPumpState(
    serial: serial,
    pumpId: pumpId,
    value: true,

  );

  await Workmanager().registerOneOffTask(
    'pump_auto_off_${serial}_$pumpId',
    pumpAutoOffTask,
    initialDelay: Duration(minutes: minutes),
    inputData: {
      'serial': serial,
      'pumpId': pumpId,
    },
  );
}

Future<void> stopPumpTimer({
  required String serial,
  required String pumpId,
}) async {
  final prefs = LocalPreferences();

  await Workmanager()
      .cancelByUniqueName('pump_auto_off_${serial}_$pumpId');

  await prefs.clearPumpTimer(serial: serial, pumpId: pumpId);
  await pumpControl(serialNumber: serial, pumpId: pumpId, action: 0);
  await prefs.setPumpState(
    serial: serial,
    pumpId: pumpId,
    value: false,
  );
}
