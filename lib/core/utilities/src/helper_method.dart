// import 'dart:developer';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<bool> takeLocationPermission() async {
//   LocationPermission permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//    permission =  await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       log('Location Permission denied by user');
//       return false;
//     }
//   }
//   if (permission == LocationPermission.deniedForever) {
//     log(
//       'Location Permission Permanently denied. Please enable from app settings',
//     );
//     return false;
//   }
//   if (permission == LocationPermission.whileInUse ||
//       permission == LocationPermission.always) {
//     log('Location permission granted');
//     return true;
//   }
//   log('Unexpected location permission state:$permission');
//   return false;
// }
//
// Future<Position> determinePosition() async {
//   final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   debugPrint('✅ Location service enabled: $serviceEnabled');
//
//   if (!serviceEnabled) {
//     // Try opening settings before throwing
//     await Geolocator.openLocationSettings();
//     return Future.error('Location Services are disabled');
//   }
//   LocationPermission permission = await Geolocator.checkPermission();
//   debugPrint('🔐 Permission status: $permission');
//
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     debugPrint('📥 Permission after request: $permission');
//
//     if (permission == LocationPermission.denied) {
//       return Future.error('Location Permission are denied');
//     }
//   }
//
//   if (permission == LocationPermission.deniedForever) {
//     return Future.error(
//       'Location Permission are permanently denied, we cannot request permissions',
//     );
//   }
//
//   final position = await Geolocator.getCurrentPosition();
//   debugPrint('📍 Got position: ${position.latitude}, ${position.longitude}');
//   return position;
// }
//
// Future<List<Placemark>> getListPlace(Position position) async {
//   final placeMarks = await placemarkFromCoordinates(
//     position.latitude,
//     position.longitude,
//   );
//   return placeMarks;
// }

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
}

Future<void> launchUri(String uri) async {
  final Uri url = Uri.parse(uri);
  final bool canLaunch = await launchUrl(url);

  if (!canLaunch) {
    throw Exception('Could not launch $uri');
  }
}

void push(BuildContext context, String path) {
  // context.push(path);
}

void go(BuildContext context, String path) {
  // context.go(path);
}

void back(BuildContext context) {
  // context.pop();
}

void setStatusBarDarkStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.light, // Light icons for dark bg
      statusBarBrightness: Brightness.dark, // iOS
      systemNavigationBarColor: AppColors.black, // Replace with your color
      systemNavigationBarIconBrightness: Brightness.dark,
      // systemNavigationBarDividerColor: AppColors.hex2824,
      // systemNavigationBarContrastEnforced: false,
      systemStatusBarContrastEnforced: true,
    ),
  );
}

void setStatusBarLightStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: AppColors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ),
  );
}
Future<TimeOfDay?> pick24HourTime(BuildContext context) {
  final now = TimeOfDay.now();

  return showTimePicker(

    context: context,
    initialTime: now, // 👈 current time

    builder: (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          alwaysUse24HourFormat: true,
          boldText: true,
          highContrast: true,
          invertColors: true,
          onOffSwitchLabels: true,

        ),
        child: child!,
      );
    },
  );
}

DateTime getSafeScheduledTime(TimeOfDay time) {
  final now = DateTime.now();
  var scheduled = DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );

  // ⛑ If time already passed → schedule tomorrow
  if (scheduled.isBefore(now)) {
    scheduled = scheduled.add(const Duration(days: 1));
  }

  return scheduled;
}



DateTime timeOfDayToDateTime(TimeOfDay time) {
  final now = DateTime.now();
  return DateTime(
    now.year,
    now.month,
    now.day,
    time.hour,
    time.minute,
  );
}
// String formatTimestamp(Timestamp? timestamp) {
//   if (timestamp == null) return '';
//
//   final dateTime = timestamp.toDate();
//   final now = DateTime.now();
//
//   final isToday = dateTime.year == now.year &&
//       dateTime.month == now.month &&
//       dateTime.day == now.day;
//
//   return isToday
//       ? "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}"
//       : "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}";
// }

