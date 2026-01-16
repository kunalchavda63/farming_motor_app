import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/src/app_router.dart';
import 'package:farming_motor_app/core/utilities/src/strings.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;







Future<void> setupServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<AppStrings>(() => AppStrings());
  getIt.registerLazySingleton<AppColors>(() => AppColors());

  await LocalPreferences().init();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    FocusManager.instance.primaryFocus?.unfocus();
  });
}

