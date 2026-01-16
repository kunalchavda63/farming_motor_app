import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/app_ui/src/widgets/src/custom_switch.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/screens/provider/pump_list_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    final provider = context.read<PumpListProvider>();
    provider.loadPumpStatesAndLogs();
    provider.loadPumpStatesAndLogs();
    if(isWindows){
      provider.startAutoSync();
    }
  }
  @override
  void dispose() {
    context.read<PumpListProvider>().stopAutoSync();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        autoImplyLeading: false,
        bgColor: AppColors.white50,
        title: Row(
          children: [
            const CustomImageView(path: AssetImages.imgLogo,height: 40,width: 50,),
            CustomText(data: AppStrings.home,style: BaseStyle.s14w400,),
            const Spacer(),
            CustomCircleSvgIcon(
              bgColor: AppColors.hex2e47.withOAlpha(0.2),
              border: Border.all(color: AppColors.black10),
              path: AssetIcons.icNotification,
              iconColor: AppColors.hex5474,
            )
          ],
        ),

      ),
      body:  Column(
        children: [
          CustomContainer(
            color: AppColors.hex5474.withOAlpha(0.19),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10
            ),
            border: Border.all(color: AppColors.hex2e47),
            borderRadius: BorderRadius.circular(8),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomText(data: 'Pump Operation',style: BaseStyle.s14w400,).padBottom(20),
                ListView.builder(
                  shrinkWrap: true,
                    itemCount: context.watch<PumpListProvider>().pumps.length,
                    itemBuilder: (context,index) {
                    final pump = context.watch<PumpListProvider>().pumps[index];
                  return  CustomContainer(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.hex2e47.withOAlpha(0.2)),
                    borderRadius: BorderRadius.circular(10),
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(data: pump.pumpId ?? 'Pump-1',style: const TextStyle().s(11).w(500).c(AppColors.black).c(AppColors.black).family(FontFamily.montserrat),).padBottom(11),
                        Row(
                          children: [
                            CustomText(data: 'Switch on/off',style: const TextStyle().s(12).w(400).c(AppColors.hex2e47).family(FontFamily.montserrat),),
                            const Spacer(),
                            CustomSwitch(
                              value: context.watch<PumpListProvider>().pumps[index].isOn,
                              onChanged: (val){
                                final provider = context.read<PumpListProvider>();
                                if(val){
                                  provider.switchOn(pump.pumpId!);
                                }
                                else{
                                  provider.switchOff(pump.pumpId!);
                                }
                              },
                            ),
                          ],
                        ).padBottom(10),


                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomText(data: 'Timer',style: const TextStyle().s(12).w(400).c(AppColors.hex2e47).family(FontFamily.montserrat),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(data: 'On',style: BaseStyle.s14w400.c(AppColors.hex2e47),),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async{
                                      final selectedTime = await pick24HourTime(context);
                                      if(selectedTime != null){
                                        context.read<PumpListProvider>().startPumpAtSelectedTime(
                                            selectedTime: selectedTime,
                                            pumpId: pump.pumpId!,
                                        );
                                      }
                                    },


                                    child: CustomContainer(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.black10,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 11
                                      ),
                                      child: CustomText(data: pump.startTime == null ? 'Start Time':formatTime(pump.startTime!),
                                    ),
                                  ),
                                )),
                              ],
                            ).padBottom(10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(data: 'Off',style: BaseStyle.s14w400.c(AppColors.hex2e47),),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async{
                                      final provider = context.read<PumpListProvider>();

                                      final selectedTime = await pick24HourTime(context);
                                      if(selectedTime != null){
                                        provider.stopPumpAtSelectedTime(
                                            selectedTime: selectedTime,
                                            pumpId: pump.pumpId!,
                                        );
                                      }
                                    },
                                    child: CustomContainer(
                                      color: AppColors.black10,
                                      borderRadius: BorderRadius.circular(5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 11
                                      ),
                                      child: CustomText(data: pump.endTime == null ? 'End Time':formatTime(pump.endTime!),

                                    ),
                                  ),
                                ),
                                ),

                              ],
                            ).padBottom(10),


                          ],
                        ),


                      ],
                    ),
                  );
                })



              ],
            ),
          )

        ],
      ).padH(10),
    );
  }
}


String formatTime(DateTime datetime){
  return DateFormat('hh:mm:ss').format(datetime);
}

