import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/src/app_router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/auth.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {

  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _oldPasswordController = TextEditingController();
  final FocusNode _oldPasswordControllerFocus = FocusNode();
  final TextEditingController _newPasswordController = TextEditingController();
  final FocusNode _newPasswordControllerFocus = FocusNode();
  final AuthRepository _repo = AuthRepository();

  bool? _isLoading = false;
  void _changePassword(String oldPassword,String newPassword) async {

    setState(() => _isLoading = true);
    logger.d('Customer Token  : ${prefs.isCustomerToken}');

    try {
      final response = await _repo.changePassword(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
logger.d(response.message);
      if (response.success && response.data!=null ) {

        getIt<AppRouter>().pop<void>();
        logger.i('User Changed Password Successfully!');

        showSuccessToast('User Changed Password Succesfully');

      }
    }
    on DioException  catch (e) {
      logger.e(e);
      showErrorToast(e.toString());
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    logger.d('Disposing Starting');
    _oldPasswordController.dispose();
    _oldPasswordControllerFocus.dispose();
    _newPasswordController.dispose();
    _newPasswordControllerFocus.dispose();
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
      backgroundColor: AppColors.white,
      body: Form(
        key: _key,
        child: SingleChildScrollView(
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
        opacity: 0.75,
        child: CustomImageView(
          path: AssetImages.imgGreenWhite,
          fit: BoxFit.cover,
          height: mCtx.size.height,
          width: mCtx.size.width,
        ),
      ),
        Positioned(
            top: 50,
            left: 20,

            child: CustomContainer(
                h: 50,
                w: 50,
                color: AppColors.black.withOAlpha(0.40),
                boxShape: BoxShape.circle,
                alignment: Alignment.center,
                child: const Icon(Icons.arrow_back,color: AppColors.white,))),

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomText(data: AppStrings.changePassword,style: BaseStyle.s20w400.c(AppColors.black).s(30),textAlign: TextAlign.start,).padBottom(20).padH(10),
          
          _buildBoth(),

          CustomButton(
            h: 45,
            isLoading: _isLoading,
            color: AppColors.black10,
            label: AppStrings.submit,
            onTap: () => _changePassword(_oldPasswordController.text.trim(),_newPasswordController.text.trim())
          ).padH(10).padV(10)
        ],
      ),
      ],
    ),
    ),
        )
      )
    );

  }
  Widget _buildBoth() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BuildTextField(
          validator: (v) => Validators.validateRequire(v,'Old Password Required'),
          label: AppStrings.oldPassword,
          controller: _oldPasswordController,
          focusNode: _oldPasswordControllerFocus,
          textInputType: TextInputType.visiblePassword,
        ).padBottom(30),
        BuildTextField(
          validator: (v) => Validators.validateRequire(v,'New Password Required'),
          label: AppStrings.password,
          controller: _newPasswordController,
          focusNode: _newPasswordControllerFocus,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          isPassword: true,
        ).padBottom(30.r),
      ],
    ).padH(12);
  }

}
