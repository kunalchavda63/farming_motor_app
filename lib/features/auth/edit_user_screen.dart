import 'package:dio/dio.dart';
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/local_storage/sharedpreference_service.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/auth/auth.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:windows_toast/windows_toast.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, this.userID});
  final String? userID;

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late MediaQueryData mCtx;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final FocusNode _firstNameControllerFocus = FocusNode();
  final FocusNode _lastNameControllerFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _addressControllerFocus = FocusNode();
  final FocusNode _mobileNumberControllerFocus = FocusNode();
  LocalPreferences prefs = LocalPreferences();
  final AuthRepository _repo = AuthRepository();
  bool _isLoading = false;
  @override
  void dispose() {
    logger.d('Disposing Starting');
    _firstNameController.dispose();
    _lastNameController.dispose();
    _firstNameControllerFocus.dispose();
    _lastNameControllerFocus.dispose();
    _emailController.dispose();
    _emailFocus.dispose();
    _mobileNumberController.dispose();
    _mobileNumberControllerFocus.dispose();
    _addressController.dispose();
    _addressControllerFocus.dispose();

    logger.i('Disposing Completed');

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mCtx = MediaQuery.of(context);
  }

  void _signUp() async {
    if (!_key.currentState!.validate()) {
      WindowsToast.show('Hello', context, 20, textStyle: BaseStyle.s14w500);
      logger.e('Please fill valid form');
      return;
    }
    setState(() => _isLoading = true);

    try {
      // 2️⃣ Call API
      final response = await _repo.createUser(
        user: CreateUserModel(
          firstName: _firstNameController.text.trim(),
          lastName: _lastNameController.text.trim(),
          email: _emailController.text.trim(),
          mobileNumber: _mobileNumberController.text.trim(),
          address: _addressController.text.trim(),
          role: 'customer',
        ),
      );

      // 3️⃣ Handle response
      if (response.success && response.data != null) {
        final createdUser = response.data?['data'];

        logger.i('User Created Successfully!');
        logger.d('User ID: ${createdUser["id"]}');
        logger.d('Generated Password: ${createdUser['generatedPassword']}');

        // 4️⃣ Show dialog / toast to admin
        showSuccessToast(
          'User Created\nPassword: ${createdUser["generatedPassword"]}',
          context,
        );

        // 5️⃣ Pop the screen
        if (mounted) {
          getIt<AppRouter>().pop<void>();
        }
      } else {
        logger.e('Failed to Create user: ${response.message}');
        showErrorToast('Failed to create user: ${response.message}', context);
      }
    } on DioException catch (e) {
      logger.e('Error while creating user: $e');
      showErrorToast('Something went wrong $e', context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white.withOAlpha(0.90),
      body: Form(
        key: _key,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                SizedBox(height: mCtx.size.height, width: mCtx.size.width),
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomImageView(
                    path: AssetImages.imgBgBig,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final double maxWidth = constraints.maxWidth;
                      final double maxHeight = constraints.maxHeight;

                      final bool isTablet = maxWidth > 600;

                      return Center(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: isTablet ? 600 : maxWidth * 0.9,
                            maxHeight: maxHeight * 0.8,
                          ),
                          child: CustomContainer(
                            alignment: Alignment.center,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: AppColors.black10,
                              width: isTablet ? 4 : 2,
                            ),

                            color: AppColors.white50,
                            padding: const EdgeInsets.symmetric(
                              vertical: 5,
                              horizontal: 5,
                            ),
                            child: CustomContainer(
                              alignment: Alignment.center,
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white50,

                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                    Align(
                                      alignment: AlignmentGeometry.topLeft,

                                      child: CustomCircleSvgIcon(
                                        onTap: () {
                                          getIt<AppRouter>().pop<void>();
                                        },
                                        iconH: 20,
                                        iconW: 20,

                                        iconColor: AppColors.hex5474,
                                        path: AssetIcons.icClose,
                                      ),
                                    ).padLeft(60),
                                  if (isWindows)
                                    const Align(
                                      alignment: AlignmentDirectional.topStart,
                                      child: CustomImageView(
                                        path: AssetImages.imgOfficeLogo,
                                        height: 100,
                                        width: 300,
                                      ),
                                    ).padBottom(10).padLeft(30),
                                  _buildBoth().padH(isTablet ? 32 : 16),

                                  const SizedBox(height: 20),

                                  CustomButton(
                                    isLoading: _isLoading,
                                    onTap: _signUp,
                                    border: Border.all(),
                                    color: AppColors.black10,
                                    label: AppStrings.createAccount,
                                  ).padH(isTablet ? 48 : 24),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),

      bottomNavigationBar: (isWindows)
          ? null
          : CustomButton(
        label: AppStrings.createAccount,
        onTap: () async {
          if (_key.currentState!.validate()) {
            // await prefs.setAuth(true);
            logger.d('User Is Authenticated');
            getIt<AppRouter>().push<void>(const Onboarding());
          }
        },
        color: AppColors.black.withOAlpha(0.18),
        border: Border.all(color: AppColors.hex2e47),
      )
          .padH(12.r)
          .padBottom(MediaQuery.of(context).viewPadding.bottom + 40.r),
    );
  }

  Widget _buildBoth() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          data: AppStrings.createAnAccount,
          style: BaseStyle.s24800
              .w(400)
              .c(AppColors.black)
              .family(FontFamily.montserrat),
        ).padBottom(17),
        Row(
          children: [
            Expanded(
              child: BuildTextField(
                label: '${AppStrings.firstName}*',
                controller: _firstNameController,
                focusNode: _firstNameControllerFocus,
                validator: Validators.validateName,
              ),
            ),
            SizedBox(width: mCtx.size.width * 0.01),
            Expanded(
              child: BuildTextField(
                label: AppStrings.lastName,
                controller: _lastNameController,
                focusNode: _lastNameControllerFocus,
                validator: (val) {
                  if (val!.isNotEmpty) {
                    Validators.validateName;
                  } else {
                    return null;
                  }
                  return null;
                },
              ),
            ),
          ],
        ).padBottom(20),
        BuildTextField(
          validator: (val) {
            if (val!.isNotEmpty) {
              return Validators.validateEmail(val);
            } else {
              return '';
            }
          },
          textInputType: TextInputType.emailAddress,
          label: AppStrings.email,
          controller: _emailController,
          focusNode: _emailFocus,
        ).padBottom(14),

        BuildTextField(
          validator: Validators.validateMobile,
          textInputType: TextInputType.phone,
          inputFormatter: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          label: '${AppStrings.mobileNumber}*',
          controller: _mobileNumberController,
          focusNode: _mobileNumberControllerFocus,
        ).padBottom(14),
        BuildTextField(
          validator: Validators.validateStreetAddress,
          textInputType: TextInputType.streetAddress,
          label: AppStrings.address,
          controller: _addressController,
          focusNode: _addressControllerFocus,
        ).padBottom(24),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                data: AppStrings.alreadyHaveAnAccount,
                style: BaseStyle.s14w400
                    .c(AppColors.black)
                    .family(FontFamily.montserrat),
              ).padBottom(30.r).padRight(7.r),
              GestureDetector(
                onTap: () {
                  logger.d('SignUp Screen : Moving');
                  context.pop();
                },
                child: CustomText(
                  data: AppStrings.logIn,
                  style: BaseStyle.s14w400.c(AppColors.hex2e47),
                  softWrap: true,
                ).padBottom(30.r),
              ),
            ],
          ),
      ],
    );
  }
}
