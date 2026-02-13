import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/auth.dart';
import 'package:farming_motor_app/features/screens/provider/language_provider/language_provider.dart';
import 'package:farming_motor_app/l10n/loc.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey _languageKey = GlobalKey();
  LocalPreferences prefs = LocalPreferences();
  late MediaQueryData mCtx;
  bool _isLoading = false;
  late AppLocalizations loc;

  @override
  void dispose() {
    logger.d('Exit');
    _mobileController.dispose();
    _mobileControllerFocus.dispose();
    _passwordController.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    logger.d('Appplication Reach out on login Screen');
  }
  
  void _login() async {
    logger.d('OnTapped');
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
        } else{

        }

          await prefs.setUser(UserModel.fromJson(user)); // 👈 Map store
          await prefs.setAuth(true);

          logger.i('Login Success Role: ${user['role']}');
          showSuccessToast('Login Success', context);
          

          if (!mounted) return;

        final roleLower = role.toLowerCase();

        if (roleLower == 'admin' && isWindows) {
          await prefs.setAdminToken(token.toString());
          logger.d('Admin Token Stored');

          getIt<AppRouter>().pushReplacement<void>(
            Onboarding(user: UserModel.fromJson(user)),
          );

        } else if (roleLower == 'customer' && isAndroid) {
          await prefs.setCustomerToken(token.toString());
          logger.d('Customer token stored');
          // ✅ Customer + Android
          getIt<AppRouter>().pushReplacement<void>(
            Onboarding(user: UserModel.fromJson(user)),
          );

        } else {
          showErrorToast('Access not allowed for this device',context);
        }
        }
       else {
        showErrorToast(response.message ?? 'Login failed',context);
      }
    } on DioException  catch (e) {
      logger.e(e);
      showErrorToast(AppStrings.someThinkWentWrong,context);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }



  @override
  void didChangeDependencies() {
    mCtx = MediaQuery.of(context);
    setStatusBarLightStyle();
    loc = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.transparent,
        statusBarIconBrightness: Brightness.dark,
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
                          child: Column(
                            children: [
                              CustomButton(
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
                                label: loc.logIn,
                                textColor: AppColors.white,
                              ).padBottom(4),
                              Center(
                                child: CustomText(data: 'Powered by build care solutions',style: BaseStyle.s8w700.c(AppColors.hex5474.withOAlpha(0.70)).family(FontFamily.poppins).letter(3),),
                              )
                            ],
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
                                       Center(
                                        child: CustomText(data: 'Powered by buildcare solutions',style: BaseStyle.s11w700.c(AppColors.black.withOAlpha(0.40)).family(FontFamily.montserrat),),
                                      ).padTop(20)
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
        Row(
          children: [
            CustomText(
              data: loc.welcome,
              style: BaseStyle.s24800
                  .w(400)
                  .c(AppColors.black)
                  .family(FontFamily.montserrat),
            ).padBottom(7),
            const Expanded(child: SizedBox()),
            CustomContainer(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10
              ),
              borderRadius: BorderRadius.circular(20),
              color: AppColors.white,
              child: InkWell(
                onTap: () async{
                  final selected = await context.showCustomPopupMenu(
                    anchorKey: _languageKey,
                    ctx: context,
                    items: const [
                      PopUpModel(id: 'en', data: 'English', value: 'en'),
                      PopUpModel(id: 'hi', data: 'हिंदी', value: 'hi'),
                      PopUpModel(id: 'gu', data: 'ગુજરાતી', value: 'gu'),
                    ],
                  );
                  if(selected != null){
                    context.read<LanguageProvider>().setLanguage(selected);
                  }

                },
                key: _languageKey,
                child:CustomText(data: _getLanguageName(context.watch<LanguageProvider>().locale.toString())) ,
              ),
            )
          ],
        ),
        CustomText(
          data: loc.signIntoContinue,
          style: BaseStyle.s14w400.c(AppColors.black),
        ).padBottom(30.r),
        BuildTextField(
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10)
          ],
          validator: Validators.validateMobile,
          label: loc.mobileNumber,
          controller: _mobileController,
          focusNode: _mobileControllerFocus,
          textInputType: TextInputType.number,
        ).padBottom(30),
        BuildTextField(
          validator: Validators.validatePassword,
          label: loc.password,
          controller: _passwordController,
          focusNode: _passwordFocus,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          isPassword: true,
        ).padBottom(30.r),
        

      ],
    ).padH(12);
  }
  String _getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'hi':
        return 'हिंदी';
      case 'gu':
        return 'ગુજરાતી';
      default:
        return 'English';
    }
  }

  }
