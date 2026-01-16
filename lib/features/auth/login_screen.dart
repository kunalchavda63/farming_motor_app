import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';
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
  void didChangeDependencies() {
    mCtx = MediaQuery.of(context);
    setStatusBarDarkStyle();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white.withOAlpha(0.90),
      body: Form(
        key: _key,
        child: LayoutBuilder(
          builder: (context,constraints) {


            if(constraints.maxWidth < 600){

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
                            fit: BoxFit.cover, // optional: make it cover full width
                          ),
                        ),
                      ),
                    ).padBottom(40.r), // ✅ padding applied outside SizedBox
                    _buildBoth()
                  ],
                ),
              );
            }
            else if(constraints.maxWidth > 1200){
              return Stack(
                children: [
                  const CustomImageView(path: AssetImages.imgWaterPump),
                  CustomContainer(
                    padding: EdgeInsets.symmetric(
                      horizontal: mCtx.size.width*0.09,
                      vertical: mCtx.size.width*0.09,
                    ),
                    w: mCtx.size.width,
                    color: AppColors.hexDAdb,
                    border: Border.all(color: AppColors.black10),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();


          },
        ),
      ),
      bottomNavigationBar:CustomButton(
        label: AppStrings.logIn,
        onTap: () async{
          if(_key.currentState!.validate()){
            await prefs.setAuth(true);
            logger.d('User Is Authnecated');
            context.pushReplacement(RoutesEnum.onboarding.path);
          }

        },
        color: AppColors.black.withOAlpha(0.18),
        border: Border.all(color: AppColors.hex2e47),
      ).padH(12.r).padBottom(MediaQuery.of(context).viewPadding.bottom + 40.r),

    );
  }
  Widget _buildBoth(){
    return Column(
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
        // Center(
        //   child: GestureDetector(
        //     onTap: (){
        //       context.push(RoutesEnum.forgot.path);
        //     },
        //     child: CustomText(
        //       data: '${AppStrings.forgotPassword} ?',
        //       style: BaseStyle.s14w400.c(AppColors.black),
        //     ).padBottom(30.r),
        //   ),
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     CustomText(
        //       data: AppStrings.doNotHaveAnAccount,
        //       style: BaseStyle.s14w400
        //           .c(AppColors.black)
        //           .family(FontFamily.montserrat),
        //     ).padBottom(30.r).padRight(7.r),
        //     GestureDetector(
        //       onTap: () {
        //         logger.d('SignUp Screen : Moving');
        //         context.push(RoutesEnum.signup.path);
        //       },
        //       child: CustomText(
        //         data: AppStrings.signUp,
        //         style: BaseStyle.s14w400.c(AppColors.hex2e47),
        //         softWrap: true,
        //       ).padBottom(30.r),
        //     ),
        //   ],
        // ),
      ],
    ).padH(12);

  }
}
