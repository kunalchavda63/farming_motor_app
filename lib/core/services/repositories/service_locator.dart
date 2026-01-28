import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/src/app_router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;
LocalPreferences prefs = LocalPreferences();







Future<void> setupServiceLocator() async {
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerLazySingleton<AppRouter>(() => AppRouter());
  getIt.registerLazySingleton<AppStrings>(() => AppStrings());
  getIt.registerLazySingleton<AppColors>(() => AppColors());

   await prefs.init();
   logger.i('Admin Token : ${prefs.isAdminToken} \n Customer token : ${prefs.isCustomerToken} \n isAuth : ${prefs.isAuth}  \n User : ${prefs.getUser()}');

  WidgetsBinding.instance.addPostFrameCallback((_) {
    FocusManager.instance.primaryFocus?.unfocus();
  });
}

