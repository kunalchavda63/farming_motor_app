import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/src/app_router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/export_screens.dart';
import 'package:flutter/foundation.dart';

class Onboarding extends StatefulWidget {
   const Onboarding({super.key,this.user});
  final UserModel? user;

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
    final user = prefs.getUser();

    if (!mounted) return;

    if (!isAuth || user == null) {
      getIt<AppRouter>().pushReplacement<void>(
        const LoginScreen(),
      );
      return;
    }

    final role = user.role.toLowerCase();

    // 🔐 ADMIN (Windows + Web)
    if (role == 'admin' &&
        (kIsWeb || isWindows) &&
        prefs.isAdminToken != null &&
        prefs.isAdminToken!.isNotEmpty) {

      getIt<AppRouter>().pushReplacement<void>(
        Admin(userModel: user),
      );
    }

    // 🔐 CUSTOMER (Android + Web)
    else if (role == 'customer' &&
        (kIsWeb || isAndroid) &&
        prefs.isCustomerToken != null &&
        prefs.isCustomerToken!.isNotEmpty) {

      getIt<AppRouter>().pushReplacement<void>(
        Screens(userModel: user),
      );
    }

    // ❌ INVALID ACCESS
    else {
      showErrorToast(
        'Sorry, this ID has no access on this device',
        context,
      );
      await prefs.clear();
      getIt<AppRouter>().pushReplacement<void>(
        const LoginScreen(),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: AppColors.hex2e47,

        ),
      ),
    );
  }
}
