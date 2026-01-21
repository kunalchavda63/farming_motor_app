import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/auth.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthRepository _repo = AuthRepository();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _mobileControllerFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  LocalPreferences prefs = LocalPreferences();
  late MediaQueryData mCtx;
  bool _isLoading = false;

  @override
  void dispose() {
    _mobileController.dispose();
    _mobileControllerFocus.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
  
  void _login() async {
    if (!_key.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await _repo.login(
        mobileNumber: _mobileController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (response.success && response.data != null) {
        final data = response.data!;

        final token = data['token'];
        final user = data['user'] as Map<String, dynamic>;
        final String role = user['role'] as String;


        if(role.toLowerCase() == 'admin') {
          await prefs.setAdminToken(token.toString());
          logger.d('Admin Token Stored');
        } else{
          await prefs.setCustomerToken(token.toString());
          logger.d('Customer token stored');
        }

          await prefs.setUser(User.fromJson(user)); // 👈 Map store
          await prefs.setAuth(true);

          logger.i('Login Success Role: ${user['role']}');

          if (!mounted) return;

          getIt<AppRouter>().pushReplacement<void>(
            Onboarding(user: User.fromJson(user)), // 👈 pass Map
          );
        }
       else {
        showErrorToast(response.message ?? 'Login failed');
      }
    } on DioException  catch (e) {
      logger.e(e);
      showErrorToast(AppStrings.someThinkWentWrong);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
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
        backgroundColor: AppColors.white,
        extendBody: true,
        body: Form(
          key: _key,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                // For Mobile Layout

                return SingleChildScrollView(
                  child: SizedBox(
                    height: mCtx.size.height,
                    width: mCtx.size.width,
                    child: Stack(
                      children: [
                        SizedBox(
                          height: mCtx.size.height,
                          width: mCtx.size.width,
                        ),

                        Opacity(
                          opacity: 0.65,
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
                              path: AssetImages.imgOfficeLogo,
                              height: 200,
                            ).padH(50), // ✅ padding applied outside SizedBox
                            _buildBoth(),
                          ],
                        ),
                        Positioned(
                          bottom: mCtx.viewPadding.bottom + 35,
                          right: 20,
                          left: 20,
                          child: CustomButton(
                            isLoading: _isLoading,
                            border: Border.all(),
                            onTap: _isLoading ? null : _login,

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
              else if (constraints.maxWidth > 600) {
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
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 5,
                                ),
                                child: CustomContainer(
                                  alignment: Alignment.center,
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.white50,

                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      if (isWindows)
                                        const Align(
                                          alignment:
                                              AlignmentDirectional.topStart,
                                          child: CustomImageView(
                                            path: AssetImages.imgOfficeLogo,
                                            height: 100,
                                            width: 300,
                                          ),
                                        ).padBottom(10).padLeft(30),
                                      _buildBoth().padH(isTablet ? 32 : 16),

                                      const SizedBox(height: 20),

                                      CustomButton(
                                        border: Border.all(),
                                        onTap: _isLoading ? null : _login,
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
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10)
          ],
          validator: Validators.validateMobile,
          label: AppStrings.mobileNumber,
          controller: _mobileController,
          focusNode: _mobileControllerFocus,
          textInputType: TextInputType.number,
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
                getIt<AppRouter>().push<void>(const ForgotScreen());
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
                  getIt<AppRouter>().push<void>(const SignUpScreen());
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
