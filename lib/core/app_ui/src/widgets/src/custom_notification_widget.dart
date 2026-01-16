// import 'package:farming_motor_app/core/app_ui/app_ui.dart';
// import 'package:farming_motor_app/core/models/src/notification_model/notification_model.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class CustomNotificationWidget extends StatelessWidget {
//   const CustomNotificationWidget({
//     super.key,
//   required this.model,
//   });
//   final NotificationModel model;
//
//   @override
//   Widget build(BuildContext context) {
//     String _getIcon(){
//       switch(model.notificationType){
//         case NotificationType.reminders:
//           return AssetIcons.icPaymentReminder;
//         case NotificationType.alert:
//           return AssetIcons.icAlert;
//         case NotificationType.newAdd:
//           return AssetIcons.icNewCustomerAdd;
//         default:
//           return AssetIcons.icAlert;
//       }
//     }
//
//     final loc = AppLocalizations.of(context);
//     return  CustomContainer(
//       padding: EdgeInsets.symmetric(
//         horizontal: 11.r,
//         vertical: 14.r,
//       ),
//       color: AppColors.white,
//       borderRadius: BorderRadius.circular(5.r),
//       child: Row(
//         children: [
//           CustomContainer(
//             color: AppColors.hexFf80,
//             borderRadius: BorderRadius.circular(8.r),
//             padding: EdgeInsets.all(4.r),
//             child: SvgPicture.asset(_getIcon()).padRight(4.r),
//           ).padRight(20.r),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(data: model.title,style:const TextStyle().s(10).w(500).c(AppColors.black).family(FontFamily.poppins),).padBottom(4.r),
//               CustomText(data: model.subTitle??'',style:const TextStyle().s(8).w(300).c(AppColors.black).family(FontFamily.poppins),),
//             ],
//           ),
//           const Expanded(child: SizedBox()),
//           if(model.isViewIcon && model.notificationType == NotificationType.alert || model.isNew )
//             CustomContainer(
//               padding: EdgeInsets.symmetric(horizontal: 12.r,vertical: 4.r),
//               borderRadius: BorderRadius.circular(15.r),
//               color: model.isNew == true ? AppColors.hex30c8:AppColors.hexFf80,
//               child: CustomText(data: '${model.isNew ? loc?.newW :loc?.alert}',style: const TextStyle().s(8).w(400).c(AppColors.hexE7f1).family(FontFamily.poppins),),
//             )
//
//
//         ],
//       ),
//
//     );
//   }
// }