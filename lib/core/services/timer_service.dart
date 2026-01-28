import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/logger/logger.dart';
import 'package:farming_motor_app/features/screens/provider/customer_service.dart';
import 'package:workmanager/workmanager.dart';

 const String pumpAutoOffTask = 'pumpAutoOff';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == pumpAutoOffTask) {
      final serial = inputData?['serial'] as String?;
      final pumpId = inputData?['pumpId'] as String?;

      // 1. મહત્વનું: API કોલ કરો જેથી પંપ ખરેખર બંધ થાય
      // અહીં સીધો Dio અથવા તમારી સર્વિસ વાપરો (Provider નહીં ચાલે)
      try {
        await pumpControl(
          serialNumber: serial ?? '',
          pumpId: pumpId ?? '',
          action: 0, // OFF
          time: 0,
        );
      } catch (e) {
        logger.e('Background API Error: $e');
      }

      // 2. લોકલ સ્ટેટ અપડેટ કરો
      final prefs = LocalPreferences();
      await prefs.init(); // ફરીથી init કરવું જરૂરી છે બેકગ્રાઉન્ડમાં

      await prefs.setPumpState(
        serial: serial ?? '',
        pumpId: pumpId ?? '',
        value: false,
      );
      await prefs.clearPumpTimer(serial: serial ?? '', pumpId: pumpId ?? '');
    }
    return true;
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

  await prefs.setPumpState(
    serial: serial,
    pumpId: pumpId,
    value: false,
  );
}
