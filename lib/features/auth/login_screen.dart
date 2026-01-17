import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  LocalPreferences prefs = LocalPreferences();
  late MediaQueryData mCtx;
  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    mCtx = MediaQuery.of(context);
    setStatusBarLightStyle();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        extendBody: true,
        body: Form(
          key: _key,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 800) {
                // For Mobile Layout

                return SingleChildScrollView(
                  child: SizedBox(
                    height:
                        mCtx.size.height +
                        mCtx.viewInsets.bottom +
                        mCtx.viewPadding.bottom,
                    width: mCtx.size.width,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: mCtx.size.height,
                          width: mCtx.size.width,
                        ),

                        Opacity(
                          opacity: 0.85,
                          child: CustomImageView(
                            path: AssetImages.imgGreenWhite,
                            fit: BoxFit.cover,
                            height: mCtx.size.height,
                            width: mCtx.size.width,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const CustomImageView(
                              path: AssetImages.imgLogo,
                              height: 200,
                              width: 200,
                            ), // ✅ padding applied outside SizedBox
                            _buildBoth(),
                          ],
                        ),
                        Positioned(
                          bottom: mCtx.viewPadding.bottom + 35,
                          right: 20,
                          left: 20,
                          child: CustomButton(
                            border: Border.all(),
                            onTap: () async {
                              if (_key.currentState!.validate()) {
                                await prefs.setAuth(true);
                                logger.d('User Is Authenticated');
                                context.push(RoutesEnum.onboarding.path);
                              } else {
                                logger.e('Please Fill the Valid Form');
                              }
                            },
                            color: AppColors.black.withOAlpha(0.20),
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(2, 2),
                                blurRadius: 20,
                                color: AppColors.white.withOAlpha(0.1),
                              ),
                            ],
                            label: AppStrings.logIn,
                            textColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
              // For Laptop Layout
              else if (constraints.maxWidth > 800) {
                return Stack(
                  children: [
                    SizedBox(height: mCtx.size.height, width: mCtx.size.width),
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: CustomImageView(
                        path: AssetImages.imgBgBig,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          final double maxWidth = constraints.maxWidth;
                          final double maxHeight = constraints.maxHeight;

                          final bool isTablet = maxWidth > 600;

                          return Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isTablet ? 600 : maxWidth * 0.9,
                                maxHeight: maxHeight * 0.8,
                              ),
                              child: CustomContainer(
                                alignment: Alignment.center,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: AppColors.black10,
                                  width: isTablet ? 4 : 2,
                                ),

                                color: AppColors.white50,
                                padding:  const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5
                                ),
                                child: CustomContainer(

                                  alignment: Alignment.center,
                                  borderRadius:  BorderRadius.circular(
                                    10
                                  ),
                                  color: AppColors.white50,

                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if(isWindows) const Align(
                                          alignment: AlignmentDirectional.topStart,
                                          child: CustomImageView(path: AssetImages.imgLogo,height: 100,width: 100,)).padBottom(10).padLeft(30),
                                      _buildBoth().padH(isTablet ? 32 : 16),

                                      const SizedBox(height: 20),

                                      CustomButton(
                                        border: Border.all(),
                                        onTap: () async {
                                          if (_key.currentState!.validate()) {
                                            await prefs.setAuth(true);
                                            logger.d('User Is Authenticated');
                                            context.go(
                                              RoutesEnum.onboarding.path,
                                            );
                                          } else {
                                            logger.e(
                                              'Please Fill the Valid Form',
                                            );
                                          }
                                        },
                                        color: AppColors.black10,
                                        label: AppStrings.logIn,
                                      ).padH(isTablet ? 48 : 24),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBoth() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [



        CustomText(
          data: AppStrings.welcome,
          style: BaseStyle.s24800
              .w(400)
              .c(AppColors.black)
              .family(FontFamily.montserrat),
        ).padBottom(7),
        CustomText(
          data: AppStrings.signIntoContinue,
          style: BaseStyle.s14w400.c(AppColors.black),
        ).padBottom(30.r),
        BuildTextField(
          validator: Validators.validateEmail,
          label: AppStrings.email,
          controller: _emailController,
          focusNode: _emailFocus,
        ).padBottom(30),
        BuildTextField(
          validator: Validators.validatePassword,
          label: AppStrings.password,
          controller: _passwordController,
          focusNode: _passwordFocus,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          isPassword: true,
        ).padBottom(30.r),
        if (isWindows)
          Center(
            child: GestureDetector(
              onTap: () {
                context.push(RoutesEnum.forgot.path);
              },
              child: CustomText(
                data: '${AppStrings.forgotPassword} ?',
                style: BaseStyle.s14w400.c(AppColors.black),
              ).padBottom(30.r),
            ),
          ),
        if (isWindows || isMacOs)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                data: AppStrings.doNotHaveAnAccount,
                style: BaseStyle.s14w400
                    .c(AppColors.black)
                    .family(FontFamily.montserrat),
              ).padBottom(30.r).padRight(7.r),
              GestureDetector(
                onTap: () {
                  logger.d('SignUp Screen : Moving');
                  context.push(RoutesEnum.signup.path);
                },
                child: CustomText(
                  data: AppStrings.signUp,
                  style: BaseStyle.s14w400.c(AppColors.hex2e47),
                  softWrap: true,
                ).padBottom(30.r),
              ),
            ],
          ),
      ],
    ).padH(12);
  }
}
