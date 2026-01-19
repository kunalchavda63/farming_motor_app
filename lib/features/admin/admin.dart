import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/src/extensions/extensions.dart';
import 'package:farming_motor_app/features/auth/sign_up_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Admin extends StatefulWidget {
  const Admin({super.key, required this.userModel});
  final User userModel;

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  late MediaQueryData mCtx;
  @override
  void didChangeDependencies() {
    mCtx = MediaQuery.of(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final Size size = mCtx.size;
    return Scaffold(
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingButton(
        onTap: (){
          getIt<AppRouter>().push<void>(const SignUpScreen(isLoggerIn: true,));
        },
        backgroundColor: AppColors.hexCcd6,
        child: SvgPicture.asset(AssetIcons.icAdd,height: 20,),

      ),
      backgroundColor: AppColors.white,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            h: size.height,
            w: size.width * 0.15,
            boxShadow: [
              BoxShadow(
                offset: const Offset(-2,2),
                color: AppColors.hex5474.withOAlpha(0.1),
                blurRadius: 15
              )
            ],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            border: Border.all(color: AppColors.black10),
            color: AppColors.white.withOAlpha(0.4),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: CustomImageView(path: AssetImages.imgOfficeLogo,width: 180,)),
                const Divider(color: AppColors.black10,).padBottom(20),

                InkWell(
                  onTap: (){},
                  child: CustomContainer(
                    color: AppColors.black10,
                    borderRadius: BorderRadius.circular(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: CustomText(data: 'User Management',style: BaseStyle.s14w400,).padH(20)).padH(20),
                )

              ],
            ),
          ),
          Column(
            children: [
              CustomText(data: 'All Users',style: BaseStyle.s28w400,),


            ],
          ).padH(20).padV(10),

        ],
      ),
    );
  }
}

