import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/services/timer_service.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/provider/admin_provider/admin_provider.dart';
import 'package:farming_motor_app/features/export_screens.dart';
import 'package:farming_motor_app/features/screens/provider/bottom_nav_provider.dart';
import 'package:farming_motor_app/features/screens/provider/customer_provider/customer_provider.dart';
import 'package:farming_motor_app/features/screens/provider/language_provider/language_provider.dart';
import 'package:farming_motor_app/l10n/loc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:workmanager/workmanager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && isAndroid) await Workmanager().initialize(callbackDispatcher);

  if (isWindows) await windowManager.ensureInitialized();
  const WindowOptions windowOptions = WindowOptions(
    size: Size(1920, 1080),
    minimumSize: Size(900, 400),
    maximumSize: Size(1920, 1080),
    center: true,
    title: AppStrings.farmingMotorApp,
  );

  if (isWindows) {
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  await setupServiceLocator();
  if(isAndroid || isIos) {
    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  }

  runApp(
      const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
        ChangeNotifierProvider(create: (_) => AdminProvider()),
        ChangeNotifierProvider(create: (_) => CustomerProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()..loadLanguage()),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
            designSize: const Size(375, 812),
            builder: (context, child) {
              return MaterialApp(
                locale: context.watch<LanguageProvider>().locale,
                supportedLocales: const [
                  Locale('en'),
                  Locale('hi'),
                  Locale('gu'),
                ],
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: const SplashScreen(),
                navigatorKey: getIt<AppRouter>().navigatorKey,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}