import 'package:farming_motor_app/core/app_ui/app_ui.dart';
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
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _fullNameControllerFocus = FocusNode();
  final FocusNode _mobileNumberControllerFocus = FocusNode();
  final FocusNode _confirmPasswordControllerFocus = FocusNode();

  @override
  void dispose() {
    logger.d('Disposing Starting');
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _mobileNumberController.dispose();
    _confirmPasswordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _fullNameControllerFocus.dispose();
    _mobileNumberControllerFocus.dispose();
    _confirmPasswordControllerFocus.dispose();
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
      backgroundColor: AppColors.hexDAdb,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: AlignmentDirectional.topStart,
                child: CustomCircleBackButton(
                  color: AppColors.black.withOAlpha(0.18),
                ),
              ).padTop(46.r).padBottom(27.r),
              CustomText(
                data: AppStrings.createAccount,
                style: BaseStyle.s24800
                    .w(400)
                    .c(AppColors.black)
                    .family(FontFamily.montserrat),
              ).padBottom(7),
              CustomText(
                data: AppStrings.pleaseFillTheBelowInformation,
                style: BaseStyle.s14w400.c(AppColors.black),
              ).padBottom(30.r),
              BuildTextField(
                label: AppStrings.fullName,
                controller: _fullNameController,
                focusNode: _fullNameControllerFocus,
              ).padBottom(30),

              BuildTextField(
                label: AppStrings.email,
                controller: _emailController,
                focusNode: _emailFocus,
              ).padBottom(30),
              BuildTextField(
                label: AppStrings.mobileNumber,
                controller: _mobileNumberController,
                focusNode: _mobileNumberControllerFocus,
              ).padBottom(30),

              BuildTextField(
                label: AppStrings.password,
                controller: _passwordController,
                focusNode: _passwordFocus,
                isPassword: true,
                textInputType: TextInputType.visiblePassword,
              ).padBottom(30.r),
              BuildTextField(
                label: AppStrings.confirmPassword,
                controller: _confirmPasswordController,
                focusNode: _confirmPasswordControllerFocus,
                isPassword: true,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.visiblePassword,
              ).padBottom(30.r),
              CustomButton(
                label: AppStrings.createAccount,
                color: AppColors.black.withOAlpha(0.18),
                border: Border.all(color: AppColors.hex2e47),
              ).padBottom(51.r),
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
                      context.pop();
                    },
                    child: CustomText(
                      data: AppStrings.logIn,
                      style: BaseStyle.s14w400.c(AppColors.hex2e47),
                    ).padBottom(30.r),
                  ),
                ],
              ).padBottom(mCtx.viewPadding.bottom + mCtx.viewInsets.bottom),
            ],
          ).padH(12),
        ),
      ),
    );
  }
}
