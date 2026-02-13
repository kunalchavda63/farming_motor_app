import 'dart:async';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late Size size;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  Timer? _timer;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    setStatusBarLightStyle();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutBack),
      ),
    );

    // Start animation
    _animationController.forward();

    // Navigate after 2 seconds
    _timer = Timer(const Duration(seconds: 2), () {
      // if (mounted) {
      //   getIt<AppRouter>().pushReplacement<void>(const Onboarding());
      // }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomContainer(
        child: Stack(
          children: [
            // Background with subtle animation
            SizedBox(
              height: size.height,
              width: size.width,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.white,
                          AppColors.hexE6e6.withOAlpha(0.30),
                          AppColors.white,
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Main content with fade and scale animation
            Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo with shadow and border
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.hex2e47.withOAlpha(0.1),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: const CustomImageView(
                          path: AssetImages.imgOfficeLogo,
                          height: 120,
                          width: 120,
                        ),
                      ),

                      const SizedBox(height: 24),

                      // App name with elegant styling
                      CustomText(
                        data: AppStrings.smartPumpControl,
                        style: BaseStyle.s24800.w(500)
                            .c(AppColors.hex2e47)
                            .family(FontFamily.montserrat),
                      ),

                      const SizedBox(height: 16),

                      // Tagline
                      CustomText(
                        data: 'Smart Farming, Simple Life',
                        style: BaseStyle.s14w400
                            .c(AppColors.hex2e47.withOAlpha(0.7))
                            .family(FontFamily.montserrat),
                      ),

                      const SizedBox(height: 48),

                      // Professional loading indicator
                      Column(
                        children: [
                          // Custom progress indicator
                          SizedBox(
                            height: 4,
                            width: 200,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: TweenAnimationBuilder<double>(
                                tween: Tween<double>(begin: 0, end: 1),
                                duration: const Duration(seconds: 2),
                                curve: Curves.easeInOut,
                                builder: (context, value, child) {
                                  return LinearProgressIndicator(
                                    value: value,
                                    backgroundColor: AppColors.hexE6e6,
                                    valueColor: const AlwaysStoppedAnimation<Color>(
                                      AppColors.hex0Ab4,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Loading text with pulse animation
                          TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.6, end: 1.0),
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                            builder: (context, value, child) {
                              return Opacity(
                                opacity: value,
                                child: child,
                              );
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                CustomText(
                                  data: 'Loading...',
                                  style: BaseStyle.s14w500
                                      .c(AppColors.hex2e47.withOAlpha(0.8))
                                      .family(FontFamily.montserrat),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Version number at bottom
            Positioned(
              bottom: 32,
              left: 0,
              right: 0,
              child: Center(
                child: CustomText(
                  data: 'Version 1.0.0',
                  style: BaseStyle.s14w400
                      .c(AppColors.hex2e47.withOAlpha(0.5))
                      .family(FontFamily.montserrat),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}