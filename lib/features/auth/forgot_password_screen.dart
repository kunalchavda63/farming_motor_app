import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';
import 'package:farming_motor_app/features/auth/otp_verification.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {

  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneControllerFocus = FocusNode();

  @override
  void dispose() {
    logger.d('Disposing Starting');
    _phoneController.dispose();
    _phoneControllerFocus.dispose();
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
              data: AppStrings.forgotCPassword,
              style: BaseStyle.s24800
                  .w(400)
                  .c(AppColors.black)
                  .family(FontFamily.montserrat),
            ).padBottom(19),
            // Todo Add  Mobile Number
            CustomText(
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
              data: AppStrings.doNotWorryItHappens,
              style: BaseStyle.s14w400.c(AppColors.black),
            ).padBottom(30.r),
            BuildTextField(label: AppStrings.mobileNumber, controller: _phoneController, focusNode: _phoneControllerFocus),
            const Spacer(),
            CustomButton(
              onTap: (){
                getIt<AppRouter>().push<void>(const OtpVerification());

              },
              label: AppStrings.send,
              color: AppColors.black.withOAlpha(0.18),
              border: Border.all(color: AppColors.hex2e47),
            ).padBottom(51.r),
          ],
        ).padH(12),
      ),
    );
  }
}
