import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:intl/intl.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  void didChangeDependencies() {

    setStatusBarLightStyle();
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      key: _key,
      backgroundColor: AppColors.white,
      drawer: Drawer(
        elevation: 200,
        backgroundColor: AppColors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.white50
              ),
                curve: Curves.ease,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomCircleSvgIcon(path: AssetIcons.icUser,iconColor: AppColors.hex2e47,),
                    CustomText(data: 'User Profile',style: BaseStyle.s14w400.c(AppColors.hex5474).w(500).family(FontFamily.montserrat),)
                  ],
                )),
            ListView(
              shrinkWrap: true,
              children: [
                CustomContainer(
                  onTap: () async{

                    await LocalPreferences().setAuth(false);


                  },
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10
                  ),
                  border: Border.all(color: AppColors.hex5474),
                  borderRadius: BorderRadius.circular(5),
                  color: AppColors.black10,
                  child: CustomText(data: 'Log Out',style: BaseStyle.s14w400.c(AppColors.hex2e47).w(500).family(FontFamily.montserrat),),
                )
              ],
            ).padH(10)
          ],
        ),
      ),
      appBar: CustomAppBar(

        gradient: RadialGradient(
          radius: 7,
            colors: [
              AppColors.hex5474.withOAlpha(0.9),
              AppColors.hex2e47.withOAlpha(0.20)
        ],
        ),

        autoImplyLeading: false,

        title: Row(
          children: [
            GestureDetector(
              onTap: () =>_key.currentState?.openDrawer(),
                child: const CustomImageView(path: AssetImages.imgLogo,height: 40,width: 50,)),
            CustomText(data: AppStrings.pumpOperation,style: BaseStyle.s14w500.c(AppColors.white),),
          ],
        ),

      ),
      body: const Column(

      ),

    );
  }
}


String formatTime(DateTime datetime){
  return DateFormat('hh:mm:ss').format(datetime);
}

