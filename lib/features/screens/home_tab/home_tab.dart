
import 'dart:async';

import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/services/timer_service.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/auth.dart';
import 'package:farming_motor_app/features/screens/provider/customer_provider/customer_provider.dart';
import 'package:farming_motor_app/l10n/loc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final LocalPreferences _prefs = LocalPreferences();
  Map<int, bool> showInfoMap = {};
  final Map<int, TextEditingController> _minuteControllers = {};
  Timer? _refreshTimer;
  late AppLocalizations loc;


  @override
  void didChangeDependencies() {
    setStatusBarLightStyle();
    loc = AppLocalizations.of(context)!;
    super.didChangeDependencies();
  }

  void _userLogOut() async {
    await _prefs.setAuth(false);
    await _prefs.clearUser();
    await _prefs.clear();
    getIt<AppRouter>().pushAndRemoveUntil<void>(
      const Onboarding(),
    );
    showSuccessToast(loc.userLogOutSuccessfully,context);
  }

  void goToResetScreen() {
    getIt<AppRouter>().push<void>(const ChangePasswordScreen());
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      context.read<CustomerProvider>().loadPumps();
      _refreshTimer = Timer.periodic(const Duration(seconds: 1), (_) async {
        if(mounted) {
          await _prefs.reload();
          context.read<CustomerProvider>().refreshSwitchState();
        }
      });
    });
  }



  @override
  void dispose() {
    _refreshTimer?.cancel();

    for (final controller in _minuteControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CustomerProvider>();
    final state = provider.pumpListState;
    return Scaffold(

      key: _key,

      backgroundColor: AppColors.white,
      drawer: Drawer(
        elevation: 200,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(

              decoration: const BoxDecoration(color: AppColors.white50),
              curve: Curves.ease,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomCircleSvgIcon(
                    path: AssetIcons.icUser,
                    iconColor: AppColors.hex2e47,
                  ),
                  CustomText(
                    data: _prefs.getUser()?.name ?? '',
                    style: BaseStyle.s14w400
                        .c(AppColors.hex5474)
                        .w(500)
                        .family(FontFamily.montserrat),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                drawerBox(
                  label: loc.changePassword,
                    onTap: () async {
                      getIt<AppRouter>().pop<void>();
                      await context.showCustomDialog<void>(
                          title: loc.changePassword,
                          message: 'Are you sure want to change Password?',
                          titleColor: AppColors.black,
                          secondaryButtonText: loc.cancel,
                          primaryButtonText: loc.confirm,
                          onPrimaryTap: () async {
                            getIt<AppRouter>().push<void>(const ChangePasswordScreen());
                          }

                      );
                    }

                ).padTop(10),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
                drawerBox(
                  label: loc.logOut,
                  onTap: () async {
                    getIt<AppRouter>().pop<void>();
                    await context.showCustomDialog<void>(
                        title: loc.logOut,
                        message: loc.areYouSureLogout,
                        titleColor: Colors.red,
                      secondaryButtonText: loc.cancel,
                      primaryButtonText: loc.confirm,
                      onPrimaryTap: _userLogOut

                    );
                  }
                ),
              ],
            ).padH(10),
          ],
        ),
      ),
      appBar: CustomAppBar(
        autoImplyLeading: false,
        isCenterTitle: false,
        leading: CustomCircleSvgIcon(
          onTap: () {
            _key.currentState?.openDrawer();
          },
          path: AssetIcons.icUser,
          bgColor: AppColors.black10,
          h: 30,
          w: 30,
        ).padLeft(20),
        bgColor: AppColors.hex5474.withOAlpha(0.25),
        title: Row(
          children: [
            CustomText(
              data: loc.pumpOperation,
              style: const TextStyle()
                  .s(20)
                  .w(400)
                  .c(AppColors.hex2e47)
                  .family(FontFamily.montserrat),
            ),
          ],
        ),
      ),
      body: state.loading || state.initial
          ? const Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
          color: AppColors.hex5474,
        ),
      )
          : state.error != null
          ? Center(child: CustomText(data: state.error!))
          : (state.data?.isEmpty ?? false)
          ? Center(child: CustomText(data: loc.noPumpsFound))
          : ListView.builder(

        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        itemCount: state.data!.length,
        itemBuilder: (context, index) {

          final controller = _minuteControllers.putIfAbsent(
              index, () => TextEditingController(text: '10'));

          final pump = state.data![index];
          final timerData = _prefs.getPumpTimer(serial: pump.serialNumber ?? '', pumpId: pump.pumpID ?? '');
          String startTimeText = '--:--:--';
          String endTimeText = '--:--:--';
          if (timerData != null && timerData['active'] == true) {
            final DateTime startDt = timerData['startTime'] as DateTime;
            final int mins = timerData['minutes'] as int;

            startTimeText = formatTime(startDt);
            // End Time ગણતરી: Start Time + Minutes
            endTimeText = formatTime(startDt.add(Duration(minutes: mins)));
          }

          return CustomContainer(
            borderRadius: BorderRadius.circular(10),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            color: AppColors.black10,
            child: Column(
              children: [
                Row(
                  children: [
                    CustomContainer(
                      alignment: Alignment.center,
                      h: 30,
                      w: 30,
                      boxShape: BoxShape.circle,
                      color: AppColors.white,
                      padding: const EdgeInsets.all(5),
                      border: Border.all(color: AppColors.hex5474),
                      child: CustomText(data: '${index + 1}'),
                    ),
                    CustomText(
                      data: pump.serialNumber ?? '',
                      style: BaseStyle.s14w400
                          .c(AppColors.black)
                          .family(FontFamily.montserrat)
                          .w(700),
                    ).padH(10),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        logger.e("Pump:${_prefs.getPumpState(serial: pump.serialNumber??'', pumpId: pump.pumpID??'')}");

                        setState(() {
                          showInfoMap[index] = !(showInfoMap[index] ?? false);
                        });
                      },
                      child: const Icon(Icons.info_outline),
                    )
                  ],
                ).padBottom(10),
                CustomContainer(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.hex5474),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomText(
                            data: loc.switchOnOff,
                            style: BaseStyle.s14w400
                                .c(AppColors.hex5474)
                                .w(500)
                                .family(FontFamily.montserrat),
                          ),
                  const Spacer(),
                  SizedBox(
                    width: 70,
                    height: 30,
                    child: CustomTextField(
                      controller: controller,
                      hintText: 'Minute',
                      textInputType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      hintStyle: BaseStyle.s14w400.c(AppColors.hex5474).family(FontFamily.montserrat),
                      padding: const EdgeInsets.symmetric(
                        vertical: 8
                      ),
                      textAlign: TextAlign.center,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: AppColors.hex5474),
                      ),
                    ),
                  ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _prefs.getPumpState(serial: pump.serialNumber??'', pumpId: pump.pumpID??''),
                            builder: (context,isOn,_) {
                              return CustomSwitch(
                                isLoading: provider.pumpControlState.loading,
                                value: isOn,
                                onChanged: (bool value) async {
                                  final serialNumber = pump.serialNumber ?? '';
                                  final pumpId = pump.pumpID ?? '';
                                  logger.d('Pump:${_prefs.getPumpState(
                                      serial: serialNumber, pumpId: pumpId)}');

                                  final minutes =
                                      int.tryParse(
                                          _minuteControllers[index]?.text ??
                                              '') ?? 0;
                                  if (value && minutes <= 0) {
                                    showErrorToast(
                                        'Enter valid minutes', context);
                                    return;
                                  }


                                  final action = value ? 1 : 0;

                                  // Api Call
                                  await context
                                      .read<CustomerProvider>()
                                      .togglePump(
                                    serialNumber: serialNumber,
                                    pumpId: pumpId,
                                    action: action,
                                    time: minutes,
                                  );

                                  if (value) {
                                    await startPumpTimer(serial: serialNumber,
                                        pumpId: pumpId,
                                        minutes: minutes);
                                  } else {
                                    await stopPumpTimer(
                                        serial: serialNumber, pumpId: pumpId);
                                  }
                                }
                                ,
                              );
                            }
                          )
                        ],
                      )
                    ],
                  ),
                ).padBottom(10),
                // Replace the timerBox calls with timerBoxWithInput
                timerBox(label: loc.startTime,dateTime: startTimeText),
                timerBox(label: '${loc.endTime}  ',dateTime: endTimeText),
                Visibility(
                  visible: showInfoMap[index] ?? false,
                  child: CustomContainer(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        _infoRow('Serial Number', pump.serialNumber.toString()),
                        _infoRow(loc.pumpName, pump.pumpName.toString()),
                        _infoRow('${loc.pump} ID', pump.serialNumber.toString()),
                        _infoRow(loc.capacityUnit, pump.capacityUnit.toString()),
                        _infoRow(loc.headUnit, pump.headUnit.toString()),
                        _infoRow('Phase Type', pump.phase.toString()),
                        _infoRow(loc.supplyVoltage, pump.supplyVoltage.toString()),
                        _infoRow(loc.lph, pump.lph.toString()),
                        _infoRow(loc.location, pump.location.toString()),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ).padBottom(20);
        },
      ),
    );
  }
  Widget drawerBox({Color? textColor,String? label, VoidCallback? onTap}) {
    return CustomContainer(
      onTap: onTap,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      border: Border.all(color: AppColors.hex5474),
      borderRadius: BorderRadius.circular(5),
      color: textColor==null?AppColors.black10:null,
      child: CustomText(
        textAlign: TextAlign.center,
        data: label ?? AppStrings.logOut,
        style: BaseStyle.s14w400
            .c(textColor ?? AppColors.hex2e47)
            .w(500)
            .family(FontFamily.montserrat),
      ),
    );
  }
  Widget _infoRow(String? title,String? value){
    return Row(
      children: [
        Expanded(child: CustomText(data: '$title :',style: BaseStyle.s14w400.c(AppColors.hex5474).family(FontFamily.montserrat).w(500),)),
        Expanded(child: CustomText(data: '$value',style: BaseStyle.s16w400.c(AppColors.black),))
      ],
    ).padH(14).padV(1);

  }
  Widget timerBox({String? label,String? dateTime,}){
    return CustomContainer(
      onTap: () async {
        await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),

          builder: (context, child) {
            return Theme(
              data: ThemeData.light().copyWith(
                primaryColor: Colors.orange,
                colorScheme: const ColorScheme.light(
                  primary: Colors.orange,
                  secondary: Colors.green,
                ),
                timePickerTheme: TimePickerThemeData(
                  backgroundColor: Colors.white,
                  hourMinuteTextColor: WidgetStateColor.resolveWith((states) {
                    return states.contains(WidgetState.selected)
                        ? AppColors.hex5474
                        : Colors.black;
                  }),
                  hourMinuteColor: WidgetStateColor.resolveWith((states) {
                    return states.contains(WidgetState.selected)
                        ? Colors.orange.withOAlpha(0.2)
                        : Colors.transparent;
                  }),
                  dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
                    return states.contains(WidgetState.selected)
                        ? Colors.white
                        : Colors.black;
                  }),
                  dayPeriodColor: WidgetStateColor.resolveWith((states) {
                    return states.contains(WidgetState.selected)
                        ? AppColors.hex5474.withOAlpha(0.80)
                        : AppColors.hexCcd6;
                  }),
                  dialBackgroundColor: AppColors.black10,
                  dialHandColor: AppColors.hex2e47,
                  dialTextColor: WidgetStateColor.resolveWith((states) {
                    return states.contains(WidgetState.selected)
                        ? Colors.white
                        : Colors.black;
                  }),
                  entryModeIconColor: Colors.black,
                  helpTextStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  hourMinuteTextStyle: const TextStyle(
                    fontSize: 32,
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                buttonTheme: const ButtonThemeData(
                    textTheme: ButtonTextTheme.primary,
                    buttonColor: AppColors.hexCcd6
                ),
              ),
              child: child!,
            );
          },
        );
      },
      padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 5
      ),
      borderRadius: BorderRadius.circular(5),
      color: AppColors.transparent,
      child: Column(
        children: [
          Row(
            children: [
              CustomText(data: label ?? loc.startTime,style: BaseStyle.s14w400.c(AppColors.hex5474).w(500).family(FontFamily.montserrat),).padRight(20),
              Expanded(
                child: CustomContainer(
                  borderRadius: BorderRadius.circular(5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10
                  ),
                  color: AppColors.white,
                  child: CustomText(data: dateTime ?? '')),
              )

            ],
          )
        ],
      ),
    );
  }

}


String formatTime(DateTime datetime) {
  return DateFormat('hh:mm:ss').format(datetime);
}


