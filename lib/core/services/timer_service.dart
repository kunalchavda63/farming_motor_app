import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/features/screens/provider/customer_service.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    if (task == 'pumpAutoOff') {
      final serial = inputData?['serial'] ?? '';
      final pumpId = inputData?['pumpId'] ?? '';

      // 🔴 Pump OFF API call
      await pumpControl(
        serialNumber: serial.toString(),
        pumpId: pumpId.toString(),
        action: 0,
      );

      // 🔴 Save state OFF
      final prefs = LocalPreferences();
      await prefs.setPumpState(
        serial: serial.toString(),
        pumpId: pumpId.toString(),
        value: false,
      );
    }
    return Future.value(true);
  });
}