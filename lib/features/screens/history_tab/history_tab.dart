import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/extensions.dart';
import 'package:farming_motor_app/features/screens/home_tab/home_tab.dart';
import 'package:farming_motor_app/features/screens/provider/pump_list_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PumpListProvider>();
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:  CustomAppBar(
        bgColor: AppColors.white,
        title: CustomText(data: 'Logs',style: const TextStyle().s(25).w(400).c(AppColors.hex2e47).family(FontFamily.montserrat),),
        
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: provider.pumps.length,
          itemBuilder: (context,index){
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
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: pump.logs.length,
                      itemBuilder: (context,index){
                        final log = pump.logs[index];
                        return CustomContainer(
                          borderRadius: BorderRadius.circular(10),
                          padding: const EdgeInsets.all(10),
                          color: AppColors.black10,
                          child: Row(
                            children: [
                              CustomContainer(
                                h: 30,
                                w: 30,
                                alignment: Alignment.center,
                                boxShape: BoxShape.circle,
                                color: AppColors.black10,
                                child: CustomText(data: '${index+1}'),
                              ).padRight(10.r),
                              CustomText(data: formatTime(log.time),style: BaseStyle.s14w400.c(AppColors.hex2e47).family(FontFamily.montserrat),),
                              const Spacer(),

                              CustomText(data: log.action,style: BaseStyle.s14w400.c(AppColors.hex2e47).family(FontFamily.montserrat),),
                            ],
                          ),
                        ).padAll(5);

                  })


                ],
              ),
            );
      }).padH(10),
    );
  }
}
