import 'dart:async';

import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/features/auth/login_screen.dart';
import 'package:farming_motor_app/features/screens/screens.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  bool isLoading = true;
  bool isAuth = false;
  bool isFirstPumpCreated = false;
  final LocalPreferences prefs = LocalPreferences();

  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  void _checkAuth() {
    Timer(const Duration(seconds: 2), () {
      // ✅ After 2 seconds, check auth
      isAuth = prefs.isAuth;
      isFirstPumpCreated = prefs.isFirstPumpCreated;

      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: AppColors.white,
        body: Center(child: CircularProgressIndicator(
          color: AppColors.hex2e47,
          strokeWidth: 2,
        )),
      );
    }

    return !isAuth
        ? const LoginScreen()
        : const Screens();
  }
}