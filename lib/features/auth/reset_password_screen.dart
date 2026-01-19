import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordControllerFocus = FocusNode();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final FocusNode _confirmPasswordControllerFocus = FocusNode();

  @override
  void dispose() {
    logger.d('Disposing Starting');
    _passwordController.dispose();
    _passwordControllerFocus.dispose();
    _confirmPasswordController.dispose();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.hexDAdb,
      body: Form(
        key: _key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: AlignmentDirectional.topStart,
              child: CustomCircleBackButton(
                color: AppColors.black.withOAlpha(0.18),
              ),
            ).padTop(46.r).padBottom(27.r),

            CustomCircleSvgIcon(
              padding: const EdgeInsets.all(24),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(-2, 0),
                    blurRadius: 20,
                    color: AppColors.white.withOAlpha(0.050)
                ),
                BoxShadow(
                    offset: const Offset(-2, -2),
                    blurRadius: 4,
                    color: AppColors.black.withOAlpha(0.10)
                )
              ],
              bgColor: AppColors.hex2e47.withOAlpha(0.08),
              path: AssetIcons.icLock,
            ).padBottom(30.r),

            CustomText(
              textAlign: TextAlign.center,
              data: AppStrings.resetPassword,
              style: BaseStyle.s24800
                  .w(400)
                  .c(AppColors.black)
                  .family(FontFamily.montserrat),
            ).padBottom(19),
            BuildTextField(label: AppStrings.password, controller: _passwordController, focusNode: _passwordControllerFocus,isPassword: true,textInputType: TextInputType.visiblePassword,textInputAction: TextInputAction.next,).padBottom(24.r),
            BuildTextField(label: AppStrings.confirmPassword, controller: _confirmPasswordController, focusNode: _confirmPasswordControllerFocus,isPassword: true,textInputType: TextInputType.visiblePassword,textInputAction: TextInputAction.done,),
            const Spacer(),
            CustomButton(
              onTap: (){
              },
              label: AppStrings.submit,
              color: AppColors.black.withOAlpha(0.18),
              border: Border.all(color: AppColors.hex2e47),
            ).padBottom(51.r),
          ],
        ).padH(12),
      ),
    );
  }
}
