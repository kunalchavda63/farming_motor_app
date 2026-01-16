import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/pop_up_model.dart';
import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';

class PumpSetupScreen extends StatefulWidget {
  const PumpSetupScreen({super.key});

  @override
  State<PumpSetupScreen> createState() => _PumpSetupScreenState();
}

class _PumpSetupScreenState extends State<PumpSetupScreen> {
  late PumpDetailModel pumpDetailModel;
  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final GlobalKey _phaseTypeKey = GlobalKey();

  // TextFields
  final TextEditingController _phaseType = TextEditingController();
  final TextEditingController _voltageController = TextEditingController();
  final TextEditingController _hpController = TextEditingController();
  final TextEditingController _kwController = TextEditingController();
  final TextEditingController _maxRangeController = TextEditingController();
  final TextEditingController  _modelNoController = TextEditingController();
  final TextEditingController _outletSizeController = TextEditingController();

  // FocusNode
  final FocusNode _phaseTypeFocus = FocusNode();
  final FocusNode _voltageControllerFocus = FocusNode();
  final FocusNode _hpControllerFocus = FocusNode();
  final FocusNode _kwControllerFocus = FocusNode();
  final FocusNode _maxRangeControllerFocus = FocusNode();
  final FocusNode  _modelNoControllerFocus = FocusNode();
  final FocusNode _outletSizeControllerFocus = FocusNode();
  @override
  void dispose() {
    logger.d('Disposing Starting');
    _phaseType.dispose();
    _voltageController.dispose();
    _hpController.dispose();
    _hpControllerFocus.dispose();

     _kwController.dispose();
    _kwControllerFocus.dispose();

     _maxRangeController.dispose();
    _maxRangeControllerFocus.dispose();

      _modelNoController.dispose();
    _modelNoControllerFocus.dispose();

     _outletSizeController.dispose();
    _outletSizeControllerFocus.dispose();


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
      backgroundColor: AppColors.white.withOAlpha(0.90),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                  child: const CustomImageView(path: AssetImages.imgSplash,height: 48,width: 48,fit: BoxFit.cover,).padTop(40)),
              CustomText(
                data: AppStrings.setupUFirstPump,
                style: BaseStyle.s24800
                    .w(400)
                    .c(AppColors.black)
                    .family(FontFamily.montserrat),
              ).padBottom(7).padTop(40),
              CustomText(
                data: AppStrings.pleaseFillTheBelowInformation,
                style: BaseStyle.s14w400.c(AppColors.black),
              ).padBottom(30.r),

              // Model No
              BuildTextField(
                label: 'Enter Model No.',
                controller: _modelNoController,
                focusNode: _modelNoControllerFocus,
              ).padBottom(30),

              BuildTextField(
                label: AppStrings.selectPhaseType,
                controller: _phaseType,
                focusNode: _phaseTypeFocus,

                isDropdown: true,
                items: [
                  PopUpModel(id: '1', data: 'Single Phase', value: PumpPhaseType.singlePhase.toString()),
                  PopUpModel(id: '2', data: 'Three Phase', value: PumpPhaseType.threePhase.toString()),
                ],
                anchorKey: _phaseTypeKey,
                context: context,
                onSelected: (val) {
                  logger.i('Selected Phase : ${val.data}');
                },
              ).padBottom(30),

              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      label: AppStrings.enterVoltage,
                      controller: _voltageController,
                      focusNode: _voltageControllerFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Expanded(
                    child: BuildTextField(
                      label: '${AppStrings.enter} KW',
                      controller: _kwController,
                      focusNode: _kwControllerFocus,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number,

                    ),
                  ),
                ],
              ).padBottom(20),
              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      label: '${AppStrings.enter} LPH',
                      controller: _voltageController,
                      focusNode: _voltageControllerFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  Expanded(
                    child: BuildTextField(
                      label: AppStrings.enterMaxHead,
                      controller: _maxRangeController,
                      focusNode: _maxRangeControllerFocus,
                      textInputAction: TextInputAction.done,
                      textInputType: TextInputType.number,

                    ),
                  ),
                ],
              ).padBottom(20),
              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      label: '${AppStrings.enter} Outlet Size',
                      controller: _outletSizeController,
                      focusNode: _outletSizeControllerFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                  ),
                  const Expanded(child: SizedBox())
                ],
              ).padBottom(20),




              CustomButton(
                label: AppStrings.submit,
                color: AppColors.black.withOAlpha(0.18),
                border: Border.all(color: AppColors.hex2e47),
              ).padBottom(51.r),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     CustomText(
              //       data: AppStrings.alreadyHaveAnAccount,
              //       style: BaseStyle.s14w400
              //           .c(AppColors.black)
              //           .family(FontFamily.montserrat),
              //     ).padBottom(30.r).padRight(7.r),
              //     GestureDetector(
              //       onTap: () {
              //         context.pop();
              //       },
              //       child: CustomText(
              //         data: AppStrings.logIn,
              //         style: BaseStyle.s14w400.c(AppColors.hex2e47),
              //       ).padBottom(30.r),
              //     ),
              //   ],
              // ).padBottom(mCtx.viewPadding.bottom + mCtx.viewInsets.bottom),
            ],
          ).padH(12),
        ),
      ),
    );
  }
}
