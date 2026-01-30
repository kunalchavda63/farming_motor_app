import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/provider/admin_provider/admin_provider.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';
import 'package:provider/provider.dart';

class PumpSetupScreen extends StatefulWidget {
  const PumpSetupScreen({super.key, required this.customerId});
  final String customerId;

  @override
  State<PumpSetupScreen> createState() => _PumpSetupScreenState();
}

class _PumpSetupScreenState extends State<PumpSetupScreen> {
  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final GlobalKey _phaseTypeKey = GlobalKey();
  final GlobalKey _capacityUnitKey = GlobalKey();
  final GlobalKey _headUnitKey = GlobalKey();
  final GlobalKey _outletUnitKey = GlobalKey();

  final TextEditingController _serialNoController = TextEditingController();
  final TextEditingController _pumpNameController = TextEditingController();
  final TextEditingController _phaseTypeController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _capacityUnitController = TextEditingController();
  final TextEditingController _supplyVoltageController = TextEditingController();
  final TextEditingController _lphController = TextEditingController();
  final TextEditingController _headRangeController = TextEditingController();
  final TextEditingController _headUnitController = TextEditingController();
  final TextEditingController _outletSizeController = TextEditingController();
  final TextEditingController _outletUnitController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  final FocusNode _serialNoControllerFocus = FocusNode();
  final FocusNode _pumpNameControllerFocus = FocusNode();
  final FocusNode _phaseTypeControllerFocus = FocusNode();
  final FocusNode _capacityUnitControllerFocus = FocusNode();
  final FocusNode _supplyVoltageControllerFocus = FocusNode();
  final FocusNode _lphControllerFocus = FocusNode();
  final FocusNode _headRangeControllerFocus = FocusNode();
  final FocusNode _headUnitControllerFocus = FocusNode();
  final FocusNode _outletSizeControllerFocus = FocusNode();
  final FocusNode _outletUnitControllerFocus = FocusNode();
  final FocusNode _locationControllerFocus = FocusNode();
  bool _isLoading = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mCtx = MediaQuery.of(context);
  }

  void _addPump() async {
  if (!_key.currentState!.validate()){
    showErrorToast(AppStrings.pleaseFillTheForm, context);
    return;
  }


  final payload = PumpDetailModel(
  serialNumber:
  _serialNoController.text.trim(),
  pumpName:
  _pumpNameController.text.trim(),
  customer: widget.customerId,
  phase: int.tryParse(
  _phaseTypeController.text.trim()),
  capacitykW: double.tryParse(
  _capacityController.text.trim()),
  capacityUnit:
  _capacityUnitController.text.trim(),
  headRangeMetres: double.tryParse(
  _headRangeController.text.trim()),
  headUnit:
  _headUnitController.text.trim(),
  outletSizeMM: double.tryParse(
  _outletSizeController.text.trim()),
  outletUnit:
  _outletUnitController.text.trim(),
  supplyVoltage: int.tryParse(
  _supplyVoltageController.text.trim()),
  lph: int.tryParse(
  _lphController.text.trim()),
  location:
  _locationController.text.trim(),
  );
  setState(() => _isLoading = true);


  await context
      .read<AdminProvider>()
      .addPumps(payload,context);

  setState(() => _isLoading = false);

  getIt<AppRouter>().pop<void>();

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white.withOAlpha(0.90),
      body: Form(
        key: _key,
        child: Stack(
          children: [
            const Positioned.fill(
              child: CustomImageView(
                path: AssetImages.imgBgBig,
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              left: 0,
              right: 0,
              top: 20,
              bottom: 20,

              child: Center(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isTablet = constraints.maxWidth > 600;

                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isTablet ? 700 : constraints.maxWidth * 0.99,
                        maxHeight: constraints.maxHeight * 0.95,
                      ),
                      child: CustomContainer(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.black10,
                          width: isTablet ? 4 : 2,
                        ),
                        color: AppColors.white50,
                        padding: const EdgeInsets.all(10),
                        child: CustomContainer(
                          borderRadius: BorderRadius.circular(14),
                          color: AppColors.white50,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CustomCircleSvgIcon(
                                      path: AssetIcons.icBack,
                                      bgColor: AppColors.black10,
                                      onTap: () {
                                        getIt<AppRouter>().pop<void>();
                                      },
                                    ),
                                    const Spacer(),
                                    const CustomImageView(
                                      path: AssetImages.imgLogo,
                                      height: 40,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 30),

                                CustomText(
                                  data: AppStrings.pumpConfiguration,
                                  style: BaseStyle.s24800
                                      .w(400)
                                      .family(FontFamily.montserrat),
                                ),
                                const SizedBox(height: 6),
                                CustomText(
                                  data: AppStrings.pleaseFillTheBelowInformation,
                                  style: BaseStyle.s14w400,
                                ),
                                const SizedBox(height: 30),

                                /// ----------- FORM FIELDS -------------
                                BuildTextField(
                                  focusNode: _serialNoControllerFocus,
                                  label: AppStrings.enterASerialNumber,
                                  controller: _serialNoController,
                                  validator: (v) =>
                                      Validators.validateRequire(v, AppStrings.required),
                                ),
                                const SizedBox(height: 20),

                                BuildTextField(
                                  focusNode: _pumpNameControllerFocus,

                                  label: AppStrings.pumpName,
                                  controller: _pumpNameController,
                                  validator: (v) =>
                                      Validators.validateRequire(v, AppStrings.required),
                                ),
                                const SizedBox(height: 20),

                                BuildTextField(
                                  focusNode: _phaseTypeControllerFocus,

                                  label: AppStrings.selectPhaseType,
                                  controller: _phaseTypeController,
                                  isDropdown: true,
                                  items: const [
                                    PopUpModel(id: '1', data: '1', value: '1'),
                                    PopUpModel(id: '3', data: '3', value: '3'),
                                  ],
                                  anchorKey: _phaseTypeKey,
                                  context: context,
                                  validator: (v) =>
                                      Validators.validateRequire(v, AppStrings.required),
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _capacityUnitControllerFocus,

                                        label: AppStrings.capacity,
                                        controller: _capacityController,
                                        textInputType: TextInputType.number,
                                        validator: (v) => Validators.validateNumbers(
                                            v, AppStrings.required),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _capacityUnitControllerFocus,

                                        label: AppStrings.capacityUnit,
                                        controller: _capacityUnitController,
                                        isDropdown: true,
                                        items: const [
                                          PopUpModel(
                                              id: 'HP', data: 'HP', value: 'HP'),
                                        ],
                                        anchorKey: _capacityUnitKey,
                                        context: context,
                                        validator: (v) =>
                                            Validators.validateRequire(v, AppStrings.required),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _supplyVoltageControllerFocus,

                                        label: AppStrings.supplyVoltage,
                                        controller: _supplyVoltageController,
                                        textInputType: TextInputType.number,
                                        validator: (v) =>
                                            Validators.validateNumbers(v, AppStrings.required),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _headUnitControllerFocus,

                                        label: AppStrings.headUnit,
                                        controller: _headUnitController,
                                        isDropdown: true,
                                        items: const [
                                          PopUpModel(
                                              id: 'feet',
                                              data: 'feet',
                                              value: 'feet'),
                                        ],
                                        anchorKey: _headUnitKey,
                                        context: context,
                                        validator: (v) =>
                                            Validators.validateRequire(v, AppStrings.required),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _lphControllerFocus,

                                        label: AppStrings.lph,
                                        controller: _lphController,
                                        textInputType: TextInputType.number,
                                        validator: (v) =>
                                            Validators.validateNumbers(v, AppStrings.required),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _headRangeControllerFocus,

                                        label: AppStrings.headRange,
                                        controller: _headRangeController,
                                        textInputType: TextInputType.number,
                                        validator: (v) =>
                                            Validators.validateNumbers(v, AppStrings.required),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                Row(
                                  children: [
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _outletSizeControllerFocus,
                                        label: AppStrings.outletSize,
                                        controller: _outletSizeController,
                                        textInputType: TextInputType.number,
                                        validator: (v) =>
                                            Validators.validateNumbers(v, AppStrings.required),
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: BuildTextField(
                                        focusNode: _outletUnitControllerFocus,

                                        label: AppStrings.outletUnit,
                                        controller: _outletUnitController,
                                        isDropdown: true,
                                        items: const [
                                          PopUpModel(
                                              id: 'inch',
                                              data: 'inch',
                                              value: 'inch'),
                                          PopUpModel(
                                              id: 'mm',
                                              data: 'mm',
                                              value: 'mm'),
                                        ],
                                        anchorKey: _outletUnitKey,
                                        context: context,
                                        validator: (v) =>
                                            Validators.validateRequire(v, AppStrings.required),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                BuildTextField(
                                  focusNode: _locationControllerFocus,

                                  label: AppStrings.location,
                                  controller: _locationController,
                                  validator: (v) =>
                                      Validators.validateRequire(v, AppStrings.required),
                                ),

                                const SizedBox(height: 30),

                                CustomButton(
                                  isLoading : _isLoading,
                                  label: AppStrings.submit,
                                  color: AppColors.black.withOAlpha(0.18),
                                  border:
                                  Border.all(color: AppColors.hex2e47),
                                  onTap:_addPump,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
