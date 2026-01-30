import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/provider/admin_provider/admin_provider.dart';
import 'package:farming_motor_app/features/admin/pump_listing_screen.dart';
import 'package:farming_motor_app/features/auth/edit_user_screen.dart';
import 'package:farming_motor_app/features/export_screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Admin extends StatefulWidget {
  const Admin({super.key, required this.userModel});
  final UserModel userModel;

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final GlobalKey _filterKey = GlobalKey();
  final TextEditingController _minuteController = TextEditingController();
  final FocusNode _minuteControllerFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AdminProvider>().loadUsers());
  }
  @override
  void dispose() {
    super.dispose();
    _minuteController.dispose();
  }

  final List<PopUpModel> filterItems = const [
    PopUpModel(id: 'az', data: 'az', value: 'az'),
    PopUpModel(id: 'za', data: 'za', value: 'za'),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdminProvider>();
    final state = provider.userListState;
    final users = state.data ?? [];
    final totalPumps = users.fold<int>(
      0,
      (sum, user) => sum + (user.totalPumps ?? 0),
    );

    return Scaffold(

      floatingActionButton: CustomContainer(
        h: 60,
        w: 170,
        onTap: () => getIt<AppRouter>().push<void>(const SignUpScreen()),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.black10),
        color: AppColors.black10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomCircleSvgIcon(
              path: AssetIcons.icUser,
              h: 40,
              w: 40,
              iconH: 40,
              iconW: 40,
            ),
            CustomText(
              data: AppStrings.addUser,
              style: BaseStyle.s14w400
                  .c(AppColors.black.withOAlpha(0.80))
                  .family(FontFamily.montserrat)
                  .w(600),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        bottomOpacity: 0,
        bgColor: AppColors.hex5474.withOAlpha(0.4),
        height: 80,
        title:  Row(
          children: [
            const CustomImageView(path: AssetImages.imgOfficeLogo,height: 80,width: 300,),
            CustomText(data: AppStrings.adminDashboard,style: BaseStyle.s28w400.c(AppColors.white).family(FontFamily.montserrat),),
            const Spacer(),
            CustomCircleSvgIcon(
              onTap: () async{
                await prefs.clearUser();
                await prefs.clear();

                getIt<AppRouter>().pushReplacement<void>(const Onboarding());
              },
              path: AssetIcons.icLock,
              iconH: 25,
              iconW: 25,
              iconColor: AppColors.black,
            )
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          const Positioned.fill(
            child: CustomImageView(
              path: AssetImages.imgGreenWhite,
              fit: BoxFit.cover,
            ),
          ),
          if (state.error != null)
            Positioned(
              top: 10,
              right: 0,

              child: CustomCircleSvgIcon(
                onTap: () async {
                  await prefs.clearUser();
                  await prefs.clear();
                  getIt<AppRouter>().pushReplacement<void>(const Onboarding());
                },
                bgColor: AppColors.white,
                h: 30,
                w: 30,
                path: AssetIcons.icUser,
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Builder(
              builder: (_) {
                if (state.loading || state.initial) {
                  return const Center(
                    child: CircularProgressIndicator(strokeWidth: 1),
                  );
                }

                if (state.error != null) {
                  return Center(child: CustomText(data: state.error!));
                }

                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      /// 🔹 STAT CARDS
                      Row(
                        children: [
                          Expanded(
                            child: _statCard(
                              title: AppStrings.totalUsers,
                              value: '${state.data?.length ?? 0}',
                              icon: AssetIcons.icUser,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Expanded(
                            child: _statCard(
                              title: AppStrings.totalPumps,
                              value: totalPumps.toString(),
                              icon: AssetIcons.icUser,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              focusNode: _minuteControllerFocus,
                              controller: _minuteController,
                              onChanged:(value){
                                context.read<AdminProvider>().searchUsers(value??'');
                              },

                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 8
                              ),
                              hintText: 'Search User',
                              hintStyle: BaseStyle.s14w500.c(AppColors.black).w(400).family(FontFamily.montserrat),
                              fillColor: AppColors.white,
                              filled:true,
                              suffixIcon: InkWell(
                                onTap:(){
                                  _minuteController.clear();
                                  _minuteControllerFocus.unfocus();
                                  context.read<AdminProvider>().searchUsers(_minuteController.text.trim());
                                },
                                  child: SvgPicture.asset(AssetIcons.icClose,colorFilter: const ColorFilter.mode(AppColors.black,BlendMode.srcIn),).padV(10).padH(5)),
                              border: OutlinedInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(color: AppColors.hexDAdb)
                              ),
                            ).padV(10),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CustomContainer(
                            key: _filterKey, // 🔥 YAHI IMPORTANT HAI
                            child: CustomCircleSvgIcon(

                              onTap: () async {
                                final selectedItem = await context
                                    .showCustomPopupMenu(
                                  color: AppColors.white,
                                  anchorKey: _filterKey,
                                  ctx: context,
                                  items: filterItems,
                                  itemBuilder: (items) {
                                    return CustomContainer(
                                      padding:
                                      const EdgeInsets.symmetric(
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(5),
                                      border: Border.all(
                                        width: 0.1,
                                      ),
                                      color: AppColors.hex2e47
                                          .withOAlpha(0.10),
                                      w: MediaQuery.of(
                                        context,
                                      ).size.width,
                                      child: CustomText(
                                        data: items.data,
                                        style: BaseStyle.s14w500.c(
                                          AppColors.hex2e47,
                                        ),
                                      ),
                                    );
                                  },
                                );

                                context
                                    .read<AdminProvider>()
                                    .setSortOrder(
                                  selectedItem == 'az'
                                      ? SortOrder.az
                                      : SortOrder.za,
                                );
                              },
                              iconH: 14,
                              iconW: 14,
                              fit: BoxFit.cover,
                              path: AssetIcons.icHistory,
                              iconColor: AppColors.black,
                            ),
                          ),
                          const Expanded(child: SizedBox())
                        ],
                      ),

                      CustomContainer(
                        borderRadius: BorderRadius.circular(10),
                        padding: const EdgeInsets.symmetric(horizontal: 16),

                        color: AppColors.black10,
                        child: Column(
                          children: [
                            CustomContainer(
                              h: 60,
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: AlignmentGeometry.center,
                                children: [
                                  Row(
                                    children: [
                                      _headerText(AppStrings.srNo, flex: 1),
                                      _headerText(AppStrings.name, flex: 2),
                                      _headerText(
                                        AppStrings.createdDate,
                                        flex: 2,
                                      ),
                                      _headerText(
                                        AppStrings.updatedDate,
                                        flex: 2,
                                      ),
                                      _headerText('Total Pumps', flex: 2),
                                      _headerText(
                                        'Edit User',
                                        flex: 2,
                                      ),
                                      _headerText(AppStrings.addDevice, flex: 2),
                                    ],
                                  ),

                                  // Filter Action button

                                ],
                              ),
                            ),

                            /// 🔹 USER LIST
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                final user = state.data![index];
                                return _userTile(user, index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  /// ================= 3D CARD BASE =================
  Widget _threeDCard({
    required Widget child,
    VoidCallback? onTap,
    Color? color,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 8),
        color: color ?? AppColors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: AppColors.white, blurRadius: 1),
          BoxShadow(
            color: AppColors.black10,
            offset: Offset(2, 1),
            blurRadius: 100,
          ),
        ],
        child: child,
      ),
    );
  }

  /// ================= STAT CARD =================
  Widget _statCard({
    required String title,
    required String value,
    required String icon,
  }) {
    return _threeDCard(
      child: Row(
        children: [
          CustomCircleSvgIcon(
            path: icon,
            bgColor: AppColors.hex5474.withOAlpha(0.15),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                data: title,
                style: BaseStyle.s14w400.c(AppColors.hex2e47),
              ),
              const SizedBox(height: 6),
              CustomText(
                data: value,
                style: BaseStyle.s23w500.c(AppColors.hex5474),
              ),
            ],
          ),
        ],
      ).padH(20).padV(20),
    );
  }

  /// ================= USER TILE =================
  Widget _userTile(UserModel user, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: _threeDCard(
        child: Row(
          children: [
            // Sr.No
            Expanded(
              child: CustomText(
                data: '${index + 1}',
                style: BaseStyle.s14w400,
                textAlign: TextAlign.center,
              ),
            ),

            // Name
            Expanded(
              flex: 2,
              child: CustomText(
                textAlign: TextAlign.center,

                data: '${user.firstName} ${user.lastName}',
                style: BaseStyle.s14w400,
              ),
            ),

            // Created Date
            Expanded(
              flex: 2,
              child: CustomText(
                textAlign: TextAlign.center,

                data: formatDateFromString(user.createdAt),
                style: BaseStyle.s14w400,
              ),
            ),

            // Updated Date
            Expanded(
              flex: 2,
              child: CustomText(
                textAlign: TextAlign.center,

                data: formatDateFromString(user.updatedAt),

                style: BaseStyle.s14w400,
              ),
            ),

            // Total Pumps
            Expanded(
              flex: 2,
              child: InkWell(
                onTap: (){
                  getIt<AppRouter>().push<void>(CustomAnimationWrapper(
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease,
                      child: PumpListingScreen(pumps: user.pumps,)));
                },
                child: CustomText(
                  textAlign: TextAlign.center,

                  data: '${user.totalPumps}',
                  style: BaseStyle.s14w400,
                ),
              ),
            ),

            // Change Password
            Expanded(
              flex: 2,
              child: Center(
                child: _actionButton(
                  icon: AssetIcons.icEdit,
                  onTap: () {
                    getIt<AppRouter>().push<void>(EditUserScreen(userID: user.userId));
                  },
                ).padRight(40),
              ),
            ),

            // Add Device
            Expanded(
              flex: 2,
              child: Center(
                child: _actionButton(
                  icon: AssetIcons.icAdd,
                  onTap: () {
                    getIt<AppRouter>().push<void>(
                      PumpSetupScreen(customerId: user.id ?? ''),
                    );
                  },
                ).padRight(40),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerText(String text, {required int flex}) {
    return Expanded(
      flex: flex,
      child: CustomText(
        textAlign: TextAlign.center,
        data: text,
        style: BaseStyle.s14w500.c(AppColors.black),
      ),
    );
  }

  /// ================= 3D ACTION BUTTON =================
  Widget _actionButton({
    required String icon,
    required VoidCallback onTap,
  }) {
    return CustomCircleSvgIcon(
      iconColor: AppColors.black.withOAlpha(0.45),
      onTap: onTap,
      bgColor: AppColors.hex5474.withOAlpha(0.25),
      path: icon,
      padding: const EdgeInsets.all(6),
      h: 24,
      w: 24,
      iconH: 19,
      iconW: 19,
    );
  }
}

String formatDateFromString(String? date) {
  if (date == null || date.isEmpty) return '-';
  final parsedDate = DateTime.parse(date);
  return DateFormat('dd-MM-yyyy').format(parsedDate);
}
