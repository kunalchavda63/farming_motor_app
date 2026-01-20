import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/pop_up_model.dart';
import 'package:farming_motor_app/core/models/src/pump_detail_model/pump_detail_model.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/provider/admin_provider/admin_provider.dart';
import 'package:farming_motor_app/features/auth/build_text_field.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PumpSetupScreen extends StatefulWidget {
  const PumpSetupScreen({super.key, this.customerId});
  final String? customerId;

  @override
  State<PumpSetupScreen> createState() => _PumpSetupScreenState();
}

class _PumpSetupScreenState extends State<PumpSetupScreen> {
  late PumpDetailModel pumpDetailModel;
  late MediaQueryData mCtx;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final GlobalKey _phaseTypeKey = GlobalKey();
  final GlobalKey _headUnit = GlobalKey();
  final GlobalKey _capacityUnitKey = GlobalKey();
  final GlobalKey _outletUnitKey = GlobalKey();

  // Controllers
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

  // FocusNodes
  final FocusNode _serialNoFocus = FocusNode();
  final FocusNode _pumpNameFocus = FocusNode();
  final FocusNode _phaseTypeFocus = FocusNode();
  final FocusNode _capacityFocus = FocusNode();
  final FocusNode _capacityUnitFocus = FocusNode();
  final FocusNode _supplyVoltageFocus = FocusNode();
  final FocusNode _lphFocus = FocusNode();
  final FocusNode _headRangeFocus = FocusNode();
  final FocusNode _headUnitControllerFocus = FocusNode();
  final FocusNode _outletSizeFocus = FocusNode();
  final FocusNode _outletUnitFocus = FocusNode();
  final FocusNode _locationControllerFocus = FocusNode();


  @override
  void dispose() {
    _serialNoController.dispose();
    _pumpNameController.dispose();
    _phaseTypeController.dispose();
    _capacityController.dispose();
    _capacityUnitController.dispose();
    _supplyVoltageController.dispose();
    _lphController.dispose();
    _headRangeController.dispose();
    _outletSizeController.dispose();
    _outletUnitController.dispose();
    _locationController.dispose();

    _serialNoFocus.dispose();
    _pumpNameFocus.dispose();
    _phaseTypeFocus.dispose();
    _capacityFocus.dispose();
    _capacityUnitFocus.dispose();
    _supplyVoltageFocus.dispose();
    _lphFocus.dispose();
    _headRangeFocus.dispose();
    _outletSizeFocus.dispose();
    _outletUnitFocus.dispose();
    _locationControllerFocus.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mCtx = MediaQuery.of(context);
  }

  @override
  Widget build(BuildContext context) {
    logger.d(widget.customerId);
    return Scaffold(
      backgroundColor: AppColors.white.withOAlpha(0.90),
      body: Form(
        key: _key,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: const CustomImageView(
                  path: AssetImages.imgLogo,
                  height: 48,
                  width: 48,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 40),

              CustomText(
                data: AppStrings.setupUFirstPump,
                style: BaseStyle.s24800
                    .w(400)
                    .c(AppColors.black)
                    .family(FontFamily.montserrat),
              ),

              const SizedBox(height: 7),

              CustomText(
                data: AppStrings.pleaseFillTheBelowInformation,
                style: BaseStyle.s14w400.c(AppColors.black),
              ),

              const SizedBox(height: 30),

              /// Serial Number
              BuildTextField(
                validator: (val) => Validators.validateRequire(val,'Serial Name required'),
                label: AppStrings.enterASerialNumber,
                controller: _serialNoController,
                focusNode: _serialNoFocus,
              ),
              const SizedBox(height: 20),

              /// Pump Name
              BuildTextField(
                validator: (val) => Validators.validateRequire(val,'Pump Name required'),

                label: AppStrings.pumpName,
                controller: _pumpNameController,
                focusNode: _pumpNameFocus,
              ),
              const SizedBox(height: 20),

              /// Phase Type
              BuildTextField(
                validator: (val) => Validators.validateRequire(val,'Select Phase Type'),
                label: AppStrings.selectPhaseType,
                controller: _phaseTypeController,
                focusNode: _phaseTypeFocus,
                isDropdown: true,
                items: const [
                  PopUpModel(id: '1', data: 'Single Phase', value: '1'),
                  PopUpModel(id: '2', data: 'Three Phase', value: '3'),
                ],
                anchorKey: _phaseTypeKey,
                context: context,
              ),
              const SizedBox(height: 20),

              /// Capacity + Unit
              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateNumbers(val,'Capacity Required'),

                      label: AppStrings.capacity,
                      controller: _capacityController,
                      focusNode: _capacityFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateRequire(val,'Select Capacity Unit'),
                      label: AppStrings.capacityUnit,
                      controller: _capacityUnitController,
                      focusNode: _capacityUnitFocus,
                      isDropdown: true,
                      items: const [
                        PopUpModel(id: '1', data: 'KW', value: 'KW'),
                        PopUpModel(id: '2', data: 'HP', value: 'HP'),
                      ],
                      anchorKey: _capacityUnitKey,
                      context: context,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Supply Voltage
              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateNumbers(val,'Supply Voltage Requied'),
                      label: AppStrings.supplyVoltage,
                      controller: _supplyVoltageController,
                      focusNode: _supplyVoltageFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: BuildTextField(
                      label: AppStrings.headUnit,
                      validator: (val) => Validators.validateRequire(val,'Select Head Unit'),

                      controller: _headUnitController,
                      focusNode: _headUnitControllerFocus,
                      isDropdown: true,
                      items: const [
                        PopUpModel(id: '1', data: 'FEET', value: 'FEEt'),
                        PopUpModel(id: '2', data: 'METER', value: 'METER'),
                      ],
                      anchorKey: _headUnit,
                      context: context,
                    ),
                  ),

                ],
              ),
              const SizedBox(height: 20),

              /// LPH + Head Range
              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateNumbers(val,'LPH '),

                      label: AppStrings.lph,
                      controller: _lphController,
                      focusNode: _lphFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateNumbers(val,'Head Range Required'),

                      label: AppStrings.headRange,
                      controller: _headRangeController,
                      focusNode: _headRangeFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              /// Outlet Size + Unit
              Row(
                children: [
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateNumbers(val,'Outlet Size Required'),

                      label: AppStrings.outletSize,
                      controller: _outletSizeController,
                      focusNode: _outletSizeFocus,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: BuildTextField(
                      validator: (val) => Validators.validateRequire(val,'Select Outlet Unit'),

                      label: AppStrings.outletUnit,
                      controller: _outletUnitController,
                      focusNode: _outletUnitFocus,
                      isDropdown: true,
                      items: const [
                        PopUpModel(id: '1', data: 'Inch', value: 'inch'),
                        PopUpModel(id: '2', data: 'MM', value: 'mm'),
                      ],
                      anchorKey: _outletUnitKey,
                      context: context,
                    ),
                  ),
                ],
              ),
              BuildTextField(
                validator: (val) => Validators.validateRequire(val,'Location Required'),
                label: AppStrings.location,
                controller: _locationController,
                focusNode: _locationControllerFocus,
                textInputType: TextInputType.number,
              ),

              const SizedBox(height: 30),

              CustomButton(
                onTap: () async{
                  final payload = PumpDetailModel(
                    serialNumber: _serialNoController.text.trim(),
                    pumpName: _pumpNameController.text.trim(),
                    customer: widget.customerId,
                    phaseType: int.tryParse(_phaseTypeController.text.trim()),
                    capacity: int.tryParse(_capacityController.text.trim()),
                    capacityUnit: _capacityUnitController.text.trim(),
                    headRange: int.tryParse(_headRangeController.text.trim()),
                    headUnit: _headUnitController.text.trim(),
                    outletSize: int.tryParse(_outletSizeController.text.trim()),
                    outletUnit: _outletUnitController.text.trim(),
                    supplyVoltage: int.tryParse(_supplyVoltageController.text.trim()),
                    lph: int.tryParse(_lphController.text.trim()),
                    location: _locationController.text.trim()
                  );





                  if(_key.currentState!.validate()){
                    final provider = context.read<AdminProvider>();
                    logger.d(payload.toJson());


                    await provider.addPumps(payload);

                    if(provider.addPumpState.status==true){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: CustomText(data: 'Pump Add Successfully')));
                    _key.currentState?.reset();
                    }
                    else if (provider.addPumpState.status == false){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: CustomText(data: 'Failed To add Pump')));
                    }


                  }
                },
                label: AppStrings.submit,
                color: AppColors.black.withOAlpha(0.18),
                border: Border.all(color: AppColors.hex2e47),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
