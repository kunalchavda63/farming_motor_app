// import 'package:farming_motor_app/core/app_ui/app_ui.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CustomWhiteBorderButton extends StatelessWidget {
//
//   const CustomWhiteBorderButton({
//     super.key,
//     this.buttonTitle,
//     this.onTap,
//     this.path,
//     this.style,
//   });
//   final String? buttonTitle;
//   final VoidCallback? onTap;
//   final String? path;
//   final TextStyle? style;
//
//   @override
//   Widget build(BuildContext context) {
//     final double size = MediaQuery.of(context).size.width;
//     return CustomContainer(
//       onTap: onTap,
//       h: 49,
//       w: size,
//       border: Border.all(color: AppColors.white),
//       borderRadius: BorderRadius.circular(45),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           SvgPicture.asset(path ?? AssetIcons.icBack),
//           CustomText(
//             data: buttonTitle ?? '',
//             // style: style ?? BaseStyle.s23w500.c(AppColors.hex1ed7),
//           ),
//           const SizedBox(),
//         ],
//       ).padH(16),
//     );
//   }
// }
