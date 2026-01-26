import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/provider/admin_provider/admin_provider.dart';
import 'package:farming_motor_app/features/export_screens.dart';
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



  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AdminProvider>().loadUsers());
  }

  final List<PopUpModel> filterItems = const [
    PopUpModel(id: 'az', data: 'az', value: 'az'),
    PopUpModel(id: 'za', data: 'za', value: 'za'),
  ];

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdminProvider>();
    final state = provider.userListState;

    return Scaffold(
      // floatingActionButton: CustomFloatingButton(
      //   backgroundColor: AppColors.hex5474.withOAlpha(0.4),
      //   toolTip: 'Reset',
      //   onTap: () async{
      //     await _prefs.clearUser();
      //     await _prefs.clear();
      //
      //
      //   },
      //   child: const CustomCircleSvgIcon(path: AssetIcons.icAdd,iconW: 20,iconH: 20),
      // ),
      backgroundColor: AppColors.hexCcd6,
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

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _header(),
                    const SizedBox(height: 20),

                    /// 🔹 STAT CARDS
                    Row(
                      children: [
                        _statCard(
                          title: AppStrings.totalUsers,
                          value: '${state.data?.length ?? 0}',
                          icon: AssetIcons.icUser,
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
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
                                    _headerText('Sr.No', flex: 1),
                                    _headerText(AppStrings.name, flex: 3),
                                    _headerText('Created Date', flex: 2),
                                    _headerText('Updated Date', flex: 2),
                                    _headerText('Pump Type', flex: 2),
                                    _headerText(
                                      AppStrings.changePassword,
                                      flex: 2,
                                    ),
                                    _headerText(AppStrings.addDevice, flex: 2),
                                  ],
                                ),
                                Positioned(
                                  right: -10,
                                  top: 14,
                                  child: Container(
                                    key: _filterKey, // 🔥 YAHI IMPORTANT HAI
                                    child: CustomCircleSvgIcon(
                                      onTap: () async {
                                        final selectedItem = await context.showCustomPopupMenu(
                                          color: AppColors.white,
                                          anchorKey: _filterKey,
                                          ctx: context,
                                          items: filterItems,
                                          itemBuilder: (items) {
                                            return CustomContainer(
                                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                              borderRadius: BorderRadius.circular(5),
                                              border: Border.all(width: 0.1),
                                              color: AppColors.hex2e47.withOAlpha(0.10),
                                              w: MediaQuery.of(context).size.width,
                                              child: CustomText(
                                                data: items.data,
                                                style: BaseStyle.s14w500.c(AppColors.hex2e47),
                                              ),
                                            );
                                          },
                                        );

                                        context.read<AdminProvider>().setSortOrder(selectedItem == 'az' ? SortOrder.az:SortOrder.za);
                                      },
                                      iconH: 14,
                                      iconW: 14,
                                      fit: BoxFit.cover,
                                      path: AssetIcons.icHistory,
                                      iconColor: AppColors.black,
                                    ),
                                  ),
                                ),

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
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// ================= HEADER =================
  Widget _header() {
    return CustomText(
      data: 'Admin Dashboard',
      style: BaseStyle.s18w400.c(AppColors.hex2e47).letter(1.2),
    );
  }

  /// ================= 3D CARD BASE =================
  Widget _threeDCard({required Widget child, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CustomContainer(
        padding: const EdgeInsets.all(16),
        color: AppColors.white,
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
      ),
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
              child: CustomText(data: '${index + 1}', style: BaseStyle.s14w400),
            ),

            // Name
            Expanded(
              flex: 3,
              child: CustomText(
                data: '${user.firstName} ${user.lastName}',
                style: BaseStyle.s14w400,
              ),
            ),

            // Created Date
            Expanded(
              flex: 2,
              child: CustomText(
                data: formatDateFromString(user.createdAt),
                style: BaseStyle.s14w400,
              ),
            ),

            // Updated Date
            Expanded(
              flex: 2,
              child: CustomText(
                data: formatDateFromString(user.updatedAt),

                style: BaseStyle.s14w400,
              ),
            ),

            // Pump Type
            Expanded(
              flex: 2,
              child: CustomText(
                data: '${user.totalPumps}',
                style: BaseStyle.s14w400,
              ),
            ),

            // Change Password
            Expanded(
              flex: 2,
              child: _actionButton(
                iconData: Icons.password,
                onTap: () {
                  // change password logic
                },
              ).padRight(40),
            ),

            // Add Device
            Expanded(
              flex: 2,
              child: _actionButton(
                iconData: Icons.add,
                onTap: () {
                  getIt<AppRouter>().push<void>(
                    PumpSetupScreen(customerId: user.id ?? ''),
                  );
                },
              ).padRight(40),
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
        data: text,
        style: BaseStyle.s14w500.c(AppColors.black),
      ),
    );
  }

  /// ================= 3D ACTION BUTTON =================
  Widget _actionButton({required IconData iconData, required VoidCallback onTap}) {
    return  CustomCircleIcon(
      padding: const EdgeInsets.all(8),
      onTap: onTap,
      bgColor: AppColors.hex5474.withOAlpha(0.25),
      iconData:iconData,
      iconSize: 19,

    );
  }
}

String formatDateFromString(String? date) {
  if (date == null || date.isEmpty) return '-';
  final parsedDate = DateTime.parse(date);
  return DateFormat('dd-MM-yyyy').format(parsedDate);
}


