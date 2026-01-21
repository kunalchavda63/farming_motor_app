import 'dart:async';

import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/src/helper_method.dart';
import 'package:farming_motor_app/core/utilities/src/strings.dart';
import 'package:farming_motor_app/features/auth/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size;

  @override
  void didChangeDependencies() {
    size = MediaQuery.of(context).size;
    setStatusBarLightStyle();

    super.didChangeDependencies();
  }

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 2), () {
      if(!mounted) return;
      getIt<AppRouter>().push<void>( const Onboarding());

    });
  }


@override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      backgroundColor: AppColors.white,
      body: CustomContainer(
        child:Stack(
          children: [
            SizedBox(
              height: size.height,
              width: size.width,
            ),
            const Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child:Opacity(
                  opacity: 0.65,
                  child: CustomAnimationWrapper(
                    duration: Duration(microseconds: 200),
                    child: CustomImageView(
                      fit: BoxFit.cover,
                      path: AssetImages.imgGreenWhite,
                    ),
                  ),
                )),
             Positioned.fill(
                top: size.height * 0.009,
                child: CustomAnimationWrapper(
                  curve: Curves.easeInBack,
                  duration: const Duration(seconds: 1),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomImageView(path: AssetImages.imgOfficeLogo,height: 200,width: 200,),
                      CustomText(data: AppStrings.smartPumpControl,style: BaseStyle.s19w500.c(AppColors.hex2e47).family(FontFamily.montserrat),)
                    ],
                  ),
                )
             ),


          ],
        ),
      ),
    );
  }
}
