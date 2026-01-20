import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/src/app_router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/admin.dart';
import 'package:farming_motor_app/features/auth/login_screen.dart';
import 'package:farming_motor_app/features/screens/screens.dart';

class Onboarding extends StatefulWidget {
   Onboarding({super.key,this.user});
  User? user;

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final LocalPreferences prefs = LocalPreferences();

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));

    final bool isAuth = prefs.isAuth;
    // final bool isFirstPumpCreated = prefs.isFirstPumpCreated;
    final user = prefs.getUser();

    logger.d('Auth: $isAuth');
    logger.d('Admin Token ${prefs.isAdminToken}');
    logger.d('Customer Token ${prefs.isCustomerToken}');
    // logger.d('Pump Created: $isFirstPumpCreated');

    if (!mounted) return;

    if (isAuth && user!=null) {
      if(isWindows){
        getIt<AppRouter>().push<void>(Admin(userModel: user));

      }
      else{
        getIt<AppRouter>().push<void>( Screens(userModel: user));

      }


    } else {
      getIt<AppRouter>().push<void>(const LoginScreen());

    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.hex2e47,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
