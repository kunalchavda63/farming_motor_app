import 'package:farming_motor_app/core/app_ui/app_ui.dart';

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:  CustomAppBar(
        bgColor: AppColors.white,
        title: CustomText(data: 'Logs',style: const TextStyle().s(25).w(400).c(AppColors.hex2e47).family(FontFamily.montserrat),),
        
      ),
      body:const SizedBox.shrink(),
    );
  }
}
