import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({super.key});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpControllerFocus = FocusNode();

  @override
  void dispose() {
    _otpController.dispose();
    _otpControllerFocus.dispose();
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
              path: AssetIcons.icPhoneBlack,
            ),

            CustomText(
              textAlign: TextAlign.center,
              data: AppStrings.otpVerification,
              style: BaseStyle.s24800
                  .w(400)
                  .c(AppColors.black)
                  .family(FontFamily.montserrat),
            ).padBottom(7),
            // Todo Add  Mobile Number
            CustomText(
              textAlign: TextAlign.center,
              data: AppStrings.enterTheOtpSentTo,
              style: BaseStyle.s14w400.c(AppColors.black),
            ).padBottom(30.r),

            PinCodeTextField(
              controller: _otpController,
              focusNode: _otpControllerFocus,
              appContext: context,
              length: 4,
              cursorColor: AppColors.black,
              autoDisposeControllers: false,
              textStyle: BaseStyle.s23w500.w(400).family(FontFamily.montserrat).c(AppColors.black),
              enableActiveFill: true,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              animationCurve: Curves.ease,
              animationDuration: const Duration(milliseconds: 200),

              backgroundColor: AppColors.transparent,
              pinTheme: PinTheme(
                  fieldHeight: 70,
                  fieldWidth: 70,
                  borderRadius: BorderRadius.circular(5),
                  // Bg Color For Box
                  inactiveFillColor: AppColors.hex5474.withOAlpha(0.15),
                  activeFillColor: AppColors.hex5474.withOAlpha(0.15),
                  selectedFillColor: AppColors.hex5474.withOAlpha(0.15),


                  // Border Color For Box

                  inactiveColor: AppColors.black.withOAlpha(0.10),
                  activeColor: AppColors.black.withOAlpha(0.10),
                  selectedColor: AppColors.black.withOAlpha(0.50),
                  shape: PinCodeFieldShape.circle,
                  borderWidth: 1
              ),
            ),
            const Spacer(),
            CustomButton(
              onTap: (){
                context.push(RoutesEnum.reset.path);
              },
              label: AppStrings.verify,
              color: AppColors.black.withOAlpha(0.18),
              border: Border.all(color: AppColors.hex2e47),
            ).padBottom(51.r),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  data: AppStrings.didNotReceivedTheOTP,
                  style: BaseStyle.s14w400
                      .c(AppColors.black)
                      .family(FontFamily.montserrat),
                ).padBottom(30.r).padRight(7.r),
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: CustomText(
                    data: AppStrings.resend,
                    style: BaseStyle.s14w400.c(AppColors.hex2e47),
                  ).padBottom(30.r),
                ),
              ],
            ).padBottom(mCtx.viewPadding.bottom + mCtx.viewInsets.bottom+35),
          ],
        ).padH(12),
      ),
    );
  }
}
