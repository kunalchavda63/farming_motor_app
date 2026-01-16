import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/features/auth/forgot_password_screen.dart';
import 'package:farming_motor_app/features/auth/login_screen.dart';
import 'package:farming_motor_app/features/auth/onboarding.dart';
import 'package:farming_motor_app/features/auth/otp_verification.dart';
import 'package:farming_motor_app/features/auth/reset_password_screen.dart';
import 'package:farming_motor_app/features/auth/sign_up_screen.dart';
import 'package:farming_motor_app/features/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => navigatorKey.currentState!;

  void pop<T>([T? result]) {
    return _navigator.pop();
  }

  Future<T?> push<T>(Widget page) {
    return _navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushReplacement<T>(Widget page) {
    return _navigator.pushReplacement<T, dynamic>(
      MaterialPageRoute(builder: (_) => page),
    );
  }

  Future<T?> pushAndRemoveUntil<T>(Widget page) {
    return _navigator.pushAndRemoveUntil<T>(
      MaterialPageRoute(builder: (_) => page),
      (route) => false,
    );
  }

  Future<T?> pushNamed<T>(String routeName, {Object? argument}) {
    return _navigator.pushNamed<T>(routeName, arguments: argument);
  }
}


final goRouterConfig = GoRouter(
  initialLocation: RoutesEnum.splash.path,
  debugLogDiagnostics: true,
    navigatorKey: getIt<AppRouter>().navigatorKey,
    routes: [
      goRoute(RoutesEnum.splash.path,const SplashScreen()),
      goRoute(RoutesEnum.login.path,const LoginScreen()),
      goRoute(RoutesEnum.signup.path,const SignUpScreen()),
      goRoute(RoutesEnum.forgot.path,const ForgotScreen()),
      goRoute(RoutesEnum.otp.path,const OtpVerification()),
      goRoute(RoutesEnum.reset.path,const ResetPasswordScreen()),
      goRoute(RoutesEnum.onboarding.path,const Onboarding()),



    ]
);

GoRoute goRoute(String path,Widget pathScreen, {final data}){
  return GoRoute(
      name: path,
      path: path,
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          child: pathScreen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // from right
            const end = Offset.zero;
            final tween = Tween(begin: begin, end: end)
                .chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      }

  );
}