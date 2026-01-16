import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/screens/provider/bottom_nav_provider.dart';
import 'package:farming_motor_app/features/screens/provider/pump_list_provider.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:workmanager/workmanager.dart';
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final String? pumpId = inputData?['pumpId'] as String?;
    if (pumpId == null) return Future.value(false);

    final prefs = LocalPreferences();
    await prefs.init();

    if (task == 'pumpOnTask') {
      await prefs.setPumpState(pumpId: pumpId, isOn: true);
      await prefs.addPumpLog(pumpId: pumpId, action: 'ON');
    }

    if (task == 'pumpOffTask') {
      await prefs.setPumpState(pumpId: pumpId, isOn: false);
      await prefs.addPumpLog(pumpId: pumpId, action: 'OFF');
    }

    return Future.value(true);
  });
}



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(isAndroid || isIos) {await Workmanager().initialize(callbackDispatcher);}
  if(isWindows)await windowManager.ensureInitialized();
  const WindowOptions windowOptions = WindowOptions(
    size: Size(1920,1080),
    minimumSize: Size(420,700),
    maximumSize: Size(1920,1080),

    center: true,
    title: 'Farming Motor app'
  );
  if(isWindows) {
    windowManager.waitUntilReadyToShow(windowOptions,() async{
    await windowManager.show();
    await windowManager.focus();
  });
  }

  await setupServiceLocator();
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp

    ]
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context,child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => BottomNavProvider()),

            ChangeNotifierProvider(
              create: (_) => PumpListProvider()
                ..addPump(
                  PumpDetailModel(
                    pumpId: 'kc01',
                    pumpName: 'kc0111',
                    phaseType: PumpPhaseType.threePhase.toString(),
                    hp: 200,
                    voltage: 220,
                    outletSize: 100,
                    maxHead: 200,
                    lpm: 20,
                    lastRunningTime: DateTime.now(),
                    logs: [],
                  ),
                ),
            ),
          ],
          child: MaterialApp.router(

            routerConfig: goRouterConfig,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );

  }
}
