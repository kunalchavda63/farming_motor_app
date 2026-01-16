import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _firstNameControllerFocus = FocusNode();
  final FocusNode _lastNameControllerFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _addressControllerFocus = FocusNode();
  final FocusNode _mobileNumberControllerFocus = FocusNode();

  @override
  void dispose() {
    logger.d('Disposing Starting');
    _firstNameController.dispose();
    _lastNameController.dispose();
    _firstNameControllerFocus.dispose();
    _lastNameControllerFocus.dispose();
    _emailController.dispose();
    _emailFocus.dispose();
    _mobileNumberController.dispose();
    _mobileNumberControllerFocus.dispose();
    _addressController.dispose();
    _addressControllerFocus.dispose();

    logger.i('Disposing Completed');

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mCtx = MediaQuery.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white.withOAlpha(0.90),
      body: Form(
        key: _key,
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: const ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        child: Opacity(
                          opacity: 0.9,
                          child: CustomImageView(
                            path: AssetImages.imgWaterPump,
                            fit: BoxFit
                                .cover, // optional: make it cover full width
                          ),
                        ),
                      ),
                    ).padBottom(40.r), // ✅ padding applied outside SizedBox
                    _buildBoth(),
                  ],
                ),
              );
            } else if (constraints.maxWidth > 600) {
              return Stack(
                children: [
                  SizedBox(height: mCtx.size.height, width: mCtx.size.width),
                  const Positioned.fill(
                    child: CustomImageView(
                      path: AssetImages.imgBgBig,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: mCtx.size.width * 0.1,
                    right: mCtx.size.width * 0.1,
                    top: mCtx.size.width * 0.1,
                    bottom: mCtx.size.width * 0.1,
                    child: CustomContainer(
                      alignment: Alignment.center,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.black10, width: 5),
                      color: AppColors.white50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: CustomContainer(
                                borderRadius: BorderRadius.circular(20),
                                alignment: Alignment.center,
                                color: AppColors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildBoth().padH(12),
                                    CustomButton(
                                      border: Border.all(),
                                      onTap: () async {
                                        if (_key.currentState!.validate()) {
                                          // await prefs.setAuth(true);
                                          logger.d('User Is Authenticated');
                                          context.pushReplacement(
                                            RoutesEnum.onboarding.path,
                                          );
                                        } else {
                                          logger.e(
                                            'Please Fill the Valid Form',
                                          );
                                        }
                                      },

                                      color: AppColors.black10,
                                      label: AppStrings.createAccount,
                                    ).padH(30),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: CustomContainer(
                              foregroundDecoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    'https://plus.unsplash.com/premium_photo-1663945778994-11b3201882a0?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
      bottomNavigationBar: (isWindows)
          ? null
          : CustomButton(
                  label: AppStrings.logIn,
                  onTap: () async {
                    if (_key.currentState!.validate()) {
                      // await prefs.setAuth(true);
                      logger.d('User Is Authenticated');
                      context.pushReplacement(RoutesEnum.onboarding.path);
                    }
                  },
                  color: AppColors.black.withOAlpha(0.18),
                  border: Border.all(color: AppColors.hex2e47),
                )
                .padH(12.r)
                .padBottom(MediaQuery.of(context).viewPadding.bottom + 40.r),
    );
  }

  Widget _buildBoth() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          data: AppStrings.createAnAccount,
          style: BaseStyle.s24800
              .w(400)
              .c(AppColors.black)
              .family(FontFamily.montserrat),
        ).padBottom(17),
        Row(
          children: [
            Expanded(
              child: BuildTextField(
                label: "${AppStrings.firstName}*",
                controller: _firstNameController,
                focusNode: _firstNameControllerFocus,
                validator: Validators.validateName,
              ),
            ),
            SizedBox(width: mCtx.size.width * 0.01),
            Expanded(
              child: BuildTextField(
                label: AppStrings.lastName,
                controller: _lastNameController,
                focusNode: _lastNameControllerFocus,
                validator:(val){
                  if(val!.isNotEmpty){
                    Validators.validateName;
                  }else{
                    return null;
                  }
                },

              ),
            ),
          ],
        ).padBottom(20),
        BuildTextField(
          validator: (val){
           if(val!.isNotEmpty){
             return Validators.validateEmail(val);
           }
           else {
             return '';
           }
          },
          textInputType: TextInputType.emailAddress,
          label: AppStrings.email,
          controller: _emailController,
          focusNode: _emailFocus,
        ).padBottom(14),

        BuildTextField(
            validator: Validators.validateMobile,
            textInputType: TextInputType.phone,
            label: '${AppStrings.mobileNumber}*',
            controller: _mobileNumberController,
            focusNode:_mobileNumberControllerFocus,
        ).padBottom(14),
        BuildTextField(
          validator: Validators.validateMobile,
          textInputType: TextInputType.streetAddress,
          label: AppStrings.address,
          controller: _addressController,
          focusNode:_addressControllerFocus,
        ).padBottom(24),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              data: AppStrings.alreadyHaveAnAccount,
              style: BaseStyle.s14w400
                  .c(AppColors.black)
                  .family(FontFamily.montserrat),
            ).padBottom(30.r).padRight(7.r),
            GestureDetector(
              onTap: () {
                logger.d('SignUp Screen : Moving');
                context.pop();
              },
              child: CustomText(
                data: AppStrings.logIn,
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
