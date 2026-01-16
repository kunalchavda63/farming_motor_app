import 'package:farming_motor_app/core/app_ui/app_ui.dart';

class CustomGreenButton extends StatelessWidget {

  const CustomGreenButton({super.key, this.text, this.onTap, this.style});
  final String? text;
  final VoidCallback? onTap;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final double size = MediaQuery.of(context).size.width;
    return CustomContainer(
      onTap: onTap,
      h: 49,
      w: size,
      // color: AppColors.hex1ed7,
      alignment: Alignment.center,
      borderRadius: BorderRadius.circular(45),

      child: CustomText(
        data: text ?? '',
        style: style ?? BaseStyle.s16w500,
      ),
    );
  }
}
