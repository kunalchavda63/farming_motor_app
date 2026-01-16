import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomButton extends StatelessWidget {


  const CustomButton({super.key, this.label, this.onTap, this.icon, this.isSmall, this.h, this.isLoading = false, this.color, this.boxShadow, this.textColor, this.border});
  final String? label;
  final VoidCallback? onTap;
  final String? icon;
  final bool? isSmall;
  final double? h;
  final bool? isLoading;
  final Color? color;
  final Color? textColor;
  final List<BoxShadow>? boxShadow;
  final Border? border;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return CustomContainer(

      border: border,
      boxShadow: boxShadow,
      onTap: onTap,
      h: h ?? 43.r,
      w: (isSmall==true)?170:size.width,
      color: color ?? AppColors.black,
      // border: Border.all(color: AppColors.white),
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(isSmall==true?48:24),
      // Ensure children are clipped within borderRadius
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(isLoading == true) const CircularProgressIndicator(color: AppColors.white,),
            if(icon!=null) SvgPicture.asset(icon!,colorFilter: const ColorFilter.mode(AppColors.white,BlendMode.srcIn),).padRight(15.r),

            if(label!=null)
              CustomText(
              data: label ?? 'Lo',
              style: BaseStyle.s18w400.c(AppColors.black).family(FontFamily.montserrat)
            ),
          ],
        ),
      ),
    );
  }
}
