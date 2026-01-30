import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_gu.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('gu'),
    Locale('hi')
  ];

  /// No description provided for @logIn.
  ///
  /// In en, this message translates to:
  /// **'Log In'**
  String get logIn;

  /// No description provided for @alreadyHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get alreadyHaveAnAccount;

  /// No description provided for @pleaseSignIn.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to your existing account'**
  String get pleaseSignIn;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @mobileNumber.
  ///
  /// In en, this message translates to:
  /// **'Mobile Number'**
  String get mobileNumber;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @rememberMe.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// No description provided for @forgotCPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotCPassword;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get forgotPassword;

  /// No description provided for @otpVerification.
  ///
  /// In en, this message translates to:
  /// **'OTP Verification'**
  String get otpVerification;

  /// No description provided for @doNotHaveAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get doNotHaveAnAccount;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send Code'**
  String get sendCode;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send;

  /// No description provided for @verification.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get verification;

  /// No description provided for @weHaveSentCode.
  ///
  /// In en, this message translates to:
  /// **'We have sent a code to your email'**
  String get weHaveSentCode;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @resend.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resend;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @inDot.
  ///
  /// In en, this message translates to:
  /// **'In.'**
  String get inDot;

  /// No description provided for @sec.
  ///
  /// In en, this message translates to:
  /// **'sec'**
  String get sec;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @pleaseSignUpToGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Please sign up to get started'**
  String get pleaseSignUpToGetStarted;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @reTypePassword.
  ///
  /// In en, this message translates to:
  /// **'Re-type password'**
  String get reTypePassword;

  /// No description provided for @didNotReceivedTheOTP.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t received the OTP?'**
  String get didNotReceivedTheOTP;

  /// No description provided for @enterTheOtpSentTo.
  ///
  /// In en, this message translates to:
  /// **'Enter the OTP sent to'**
  String get enterTheOtpSentTo;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @oldPassword.
  ///
  /// In en, this message translates to:
  /// **'Old Password'**
  String get oldPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// No description provided for @signIntoContinue.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue'**
  String get signIntoContinue;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @createAnAccount.
  ///
  /// In en, this message translates to:
  /// **'Create An Account'**
  String get createAnAccount;

  /// No description provided for @pleaseFillTheBelowInformation.
  ///
  /// In en, this message translates to:
  /// **'Please fill the below informations.'**
  String get pleaseFillTheBelowInformation;

  /// No description provided for @doNotWorryItHappens.
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry! it happens. Please enter the mobile number which is associated with your account'**
  String get doNotWorryItHappens;

  /// No description provided for @pumpConfiguration.
  ///
  /// In en, this message translates to:
  /// **'Pump Configuration'**
  String get pumpConfiguration;

  /// No description provided for @enterPowerRating.
  ///
  /// In en, this message translates to:
  /// **'Enter Power Rating'**
  String get enterPowerRating;

  /// No description provided for @selectPowerUnit.
  ///
  /// In en, this message translates to:
  /// **'Select Power Unit'**
  String get selectPowerUnit;

  /// No description provided for @selectPhaseType.
  ///
  /// In en, this message translates to:
  /// **'Select Phase Type'**
  String get selectPhaseType;

  /// No description provided for @enterVoltage.
  ///
  /// In en, this message translates to:
  /// **'Enter Voltage'**
  String get enterVoltage;

  /// No description provided for @enterFrequency.
  ///
  /// In en, this message translates to:
  /// **'Enter Frequency'**
  String get enterFrequency;

  /// No description provided for @enterMaxHead.
  ///
  /// In en, this message translates to:
  /// **'Enter Maximum Head'**
  String get enterMaxHead;

  /// No description provided for @enterMaxDischarge.
  ///
  /// In en, this message translates to:
  /// **'Enter Maximum Discharge'**
  String get enterMaxDischarge;

  /// No description provided for @enterEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Enter Efficiency'**
  String get enterEfficiency;

  /// No description provided for @enterCurrentRating.
  ///
  /// In en, this message translates to:
  /// **'Enter Current Rating'**
  String get enterCurrentRating;

  /// No description provided for @enterPowerFactor.
  ///
  /// In en, this message translates to:
  /// **'Enter Power Factor'**
  String get enterPowerFactor;

  /// No description provided for @selectMotorClass.
  ///
  /// In en, this message translates to:
  /// **'Select Motor Class'**
  String get selectMotorClass;

  /// No description provided for @selectInsulationClass.
  ///
  /// In en, this message translates to:
  /// **'Select Insulation Class'**
  String get selectInsulationClass;

  /// No description provided for @enterRpm.
  ///
  /// In en, this message translates to:
  /// **'Enter RPM'**
  String get enterRpm;

  /// No description provided for @selectMaterial.
  ///
  /// In en, this message translates to:
  /// **'Select Material'**
  String get selectMaterial;

  /// No description provided for @enterSuctionSize.
  ///
  /// In en, this message translates to:
  /// **'Enter Suction Size'**
  String get enterSuctionSize;

  /// No description provided for @enterDeliverySize.
  ///
  /// In en, this message translates to:
  /// **'Enter Delivery Size'**
  String get enterDeliverySize;

  /// No description provided for @optionalNotes.
  ///
  /// In en, this message translates to:
  /// **'Optional Notes'**
  String get optionalNotes;

  /// No description provided for @savePumpDetails.
  ///
  /// In en, this message translates to:
  /// **'Save Pump Details'**
  String get savePumpDetails;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @successPumpSaved.
  ///
  /// In en, this message translates to:
  /// **'Pump details saved successfully!'**
  String get successPumpSaved;

  /// No description provided for @errorInvalidInput.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid values'**
  String get errorInvalidInput;

  /// No description provided for @warningMismatchVoltage.
  ///
  /// In en, this message translates to:
  /// **'Voltage does not match motor rating'**
  String get warningMismatchVoltage;

  /// No description provided for @infoTipPowerRating.
  ///
  /// In en, this message translates to:
  /// **'Enter the motor power in kW'**
  String get infoTipPowerRating;

  /// No description provided for @infoTipMaxHead.
  ///
  /// In en, this message translates to:
  /// **'Maximum vertical lift of the pump'**
  String get infoTipMaxHead;

  /// No description provided for @infoTipMaxDischarge.
  ///
  /// In en, this message translates to:
  /// **'Maximum flow the pump can handle'**
  String get infoTipMaxDischarge;

  /// No description provided for @infoTipEfficiency.
  ///
  /// In en, this message translates to:
  /// **'Pump efficiency in percentage'**
  String get infoTipEfficiency;

  /// No description provided for @infoTipCurrentRating.
  ///
  /// In en, this message translates to:
  /// **'Current at rated load in amperes'**
  String get infoTipCurrentRating;

  /// No description provided for @infoTipPowerFactor.
  ///
  /// In en, this message translates to:
  /// **'Typical motor power factor'**
  String get infoTipPowerFactor;

  /// No description provided for @infoTipRpm.
  ///
  /// In en, this message translates to:
  /// **'Motor speed in revolutions per minute'**
  String get infoTipRpm;

  /// No description provided for @infoTipMaterial.
  ///
  /// In en, this message translates to:
  /// **'Pump body material'**
  String get infoTipMaterial;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @operations.
  ///
  /// In en, this message translates to:
  /// **'Operations'**
  String get operations;

  /// No description provided for @pump.
  ///
  /// In en, this message translates to:
  /// **'Pump'**
  String get pump;

  /// No description provided for @enterModelNo.
  ///
  /// In en, this message translates to:
  /// **'Enter Model No.'**
  String get enterModelNo;

  /// No description provided for @singlePhase.
  ///
  /// In en, this message translates to:
  /// **'Single Phase'**
  String get singlePhase;

  /// No description provided for @threePhase.
  ///
  /// In en, this message translates to:
  /// **'Three Phase'**
  String get threePhase;

  /// No description provided for @disposingStarted.
  ///
  /// In en, this message translates to:
  /// **'Pump'**
  String get disposingStarted;

  /// No description provided for @disposingFinished.
  ///
  /// In en, this message translates to:
  /// **'Pump'**
  String get disposingFinished;

  /// No description provided for @selectedPhase.
  ///
  /// In en, this message translates to:
  /// **'Selected Phase'**
  String get selectedPhase;

  /// No description provided for @enter.
  ///
  /// In en, this message translates to:
  /// **'Enter'**
  String get enter;

  /// No description provided for @pumpOperation.
  ///
  /// In en, this message translates to:
  /// **'Pump Operation'**
  String get pumpOperation;

  /// No description provided for @switchOnOff.
  ///
  /// In en, this message translates to:
  /// **'Switch On/Off'**
  String get switchOnOff;

  /// No description provided for @timer.
  ///
  /// In en, this message translates to:
  /// **'Timer'**
  String get timer;

  /// No description provided for @on.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get on;

  /// No description provided for @off.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get off;

  /// No description provided for @startTime.
  ///
  /// In en, this message translates to:
  /// **'Start Time'**
  String get startTime;

  /// No description provided for @endTime.
  ///
  /// In en, this message translates to:
  /// **'End Time'**
  String get endTime;

  /// No description provided for @logs.
  ///
  /// In en, this message translates to:
  /// **'Logs'**
  String get logs;

  /// No description provided for @welcomeToFarmingMotorApp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Farming Motor App'**
  String get welcomeToFarmingMotorApp;

  /// No description provided for @controlAndMonitorYouFarmMotorsAnyTime.
  ///
  /// In en, this message translates to:
  /// **'Control and monitor your farm motors anytime, anywhere. \n Easy, fast, and reliable.'**
  String get controlAndMonitorYouFarmMotorsAnyTime;

  /// No description provided for @firstName.
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastName;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @enterASerialNumber.
  ///
  /// In en, this message translates to:
  /// **'Enter a Serial Number'**
  String get enterASerialNumber;

  /// No description provided for @pumpName.
  ///
  /// In en, this message translates to:
  /// **'Pump Name'**
  String get pumpName;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @capacity.
  ///
  /// In en, this message translates to:
  /// **'Capacity'**
  String get capacity;

  /// No description provided for @capacityUnit.
  ///
  /// In en, this message translates to:
  /// **'Capacity Unit'**
  String get capacityUnit;

  /// No description provided for @headRange.
  ///
  /// In en, this message translates to:
  /// **'Head Range'**
  String get headRange;

  /// No description provided for @headUnit.
  ///
  /// In en, this message translates to:
  /// **'Head Unit'**
  String get headUnit;

  /// No description provided for @outletSize.
  ///
  /// In en, this message translates to:
  /// **'Outlet Size'**
  String get outletSize;

  /// No description provided for @outletUnit.
  ///
  /// In en, this message translates to:
  /// **'Outlet Unit'**
  String get outletUnit;

  /// No description provided for @phase.
  ///
  /// In en, this message translates to:
  /// **'Phase'**
  String get phase;

  /// No description provided for @supplyVoltage.
  ///
  /// In en, this message translates to:
  /// **'Supply Voltage'**
  String get supplyVoltage;

  /// No description provided for @lph.
  ///
  /// In en, this message translates to:
  /// **'LPH'**
  String get lph;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @farmingMotorApp.
  ///
  /// In en, this message translates to:
  /// **'Farming Motor App'**
  String get farmingMotorApp;

  /// No description provided for @smartPumpControl.
  ///
  /// In en, this message translates to:
  /// **'Smart Pump Control'**
  String get smartPumpControl;

  /// No description provided for @noUsersFound.
  ///
  /// In en, this message translates to:
  /// **'No Users found'**
  String get noUsersFound;

  /// No description provided for @totalUsers.
  ///
  /// In en, this message translates to:
  /// **'Total Users'**
  String get totalUsers;

  /// No description provided for @someThinkWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get someThinkWentWrong;

  /// No description provided for @userProfile.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get userProfile;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @addDevice.
  ///
  /// In en, this message translates to:
  /// **'Add Device'**
  String get addDevice;

  /// No description provided for @required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get required;

  /// No description provided for @pleaseFillTheForm.
  ///
  /// In en, this message translates to:
  /// **'Please fill the form'**
  String get pleaseFillTheForm;

  /// No description provided for @addUser.
  ///
  /// In en, this message translates to:
  /// **'Add User'**
  String get addUser;

  /// No description provided for @totalPumps.
  ///
  /// In en, this message translates to:
  /// **'Total Pumps'**
  String get totalPumps;

  /// No description provided for @srNo.
  ///
  /// In en, this message translates to:
  /// **'SR. No'**
  String get srNo;

  /// No description provided for @createdDate.
  ///
  /// In en, this message translates to:
  /// **'Created Date'**
  String get createdDate;

  /// No description provided for @updatedDate.
  ///
  /// In en, this message translates to:
  /// **'Updated Date'**
  String get updatedDate;

  /// No description provided for @adminDashboard.
  ///
  /// In en, this message translates to:
  /// **'Admin Dashboard'**
  String get adminDashboard;

  /// No description provided for @userLogOutSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User Logged Out Successfully'**
  String get userLogOutSuccessfully;

  /// No description provided for @noPumpsFound.
  ///
  /// In en, this message translates to:
  /// **'No pumps found'**
  String get noPumpsFound;

  /// No description provided for @pumpStopped.
  ///
  /// In en, this message translates to:
  /// **'Pump Stopped'**
  String get pumpStopped;

  /// No description provided for @pumpStarted.
  ///
  /// In en, this message translates to:
  /// **'Pump Started'**
  String get pumpStarted;

  /// No description provided for @userPasswordChangedSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Password Changed Successfully'**
  String get userPasswordChangedSuccessfully;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'Minute'**
  String get minute;

  /// No description provided for @pleaseFillValidForm.
  ///
  /// In en, this message translates to:
  /// **'Please fill valid form'**
  String get pleaseFillValidForm;

  /// No description provided for @userCreateSuccessfully.
  ///
  /// In en, this message translates to:
  /// **'User created successfully'**
  String get userCreateSuccessfully;

  /// No description provided for @generatedPassword.
  ///
  /// In en, this message translates to:
  /// **'Generated Password'**
  String get generatedPassword;

  /// No description provided for @userCreatedPassword.
  ///
  /// In en, this message translates to:
  /// **'User created password'**
  String get userCreatedPassword;

  /// No description provided for @failedToCreateUser.
  ///
  /// In en, this message translates to:
  /// **'Failed to create user'**
  String get failedToCreateUser;

  /// No description provided for @errorWhileCreatingUser.
  ///
  /// In en, this message translates to:
  /// **'Error while creating user'**
  String get errorWhileCreatingUser;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get somethingWentWrong;

  /// No description provided for @userIsAuthenticated.
  ///
  /// In en, this message translates to:
  /// **'User is authenticated'**
  String get userIsAuthenticated;

  /// No description provided for @sorry.
  ///
  /// In en, this message translates to:
  /// **'Sorry'**
  String get sorry;

  /// No description provided for @thisDeviceHasNoAccess.
  ///
  /// In en, this message translates to:
  /// **'This device has no access'**
  String get thisDeviceHasNoAccess;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'gu', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'gu': return AppLocalizationsGu();
    case 'hi': return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
