import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/models/src/login_model/login_model.dart';
import 'package:farming_motor_app/core/services/navigation/router.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:farming_motor_app/features/admin/provider/admin_provider/admin_provider.dart';
import 'package:farming_motor_app/features/screens/pump_add_screen/pump_setup_screen.dart';
import 'package:provider/provider.dart';

class Admin extends StatefulWidget {
  const Admin({super.key, required this.userModel});
  final User userModel;

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<AdminProvider>().loadUsers());
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdminProvider>();

    return Scaffold(
      floatingActionButton: CustomFloatingButton(
        child: const Icon(Icons.roundabout_left),
        onTap: (){
          context.read<AdminProvider>().loadUsers();
        },
      ),
      backgroundColor: AppColors.white,
      body: Row(
        children: [

          /// SIDEBAR
          _sideBar(),
          Expanded(
            child: Builder(
              builder: (_) {
                final state = provider.userListState;
                if (state.loading == true) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error != null) {
                  return Center(
                    child: CustomText(data: state.error!),
                  );
                }

                if (state.data?.isEmpty == true) {
                  return const Center(
                    child: CustomText(data: 'No users found'),
                  );
                }
                else {
                  return _userListView(provider.userListState.data,loading: provider.userListState.loading,error: provider.userListState.error);

                }

                /// ✅ SUCCESS UI
              },
            ),
          ),

        ],
      ),
    );
  }

  Widget _sideBar() {
    return CustomContainer(
      w: 260,
      color: AppColors.hex2e47.withOAlpha(0.15),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            data: 'Admin Panel',
            style: BaseStyle.s15w700,
          ),
          const SizedBox(height: 30),

          _sideItem('Home', AssetIcons.icHome),
          _sideItem('Users', AssetIcons.icUser),
          _sideItem('Settings', AssetIcons.icSearch),
        ],
      ),
    );
  }

  Widget _sideItem(String title, String icon) {
    return CustomContainer(
      h: 48,
      margin: const EdgeInsets.only(bottom: 10),
      borderRadius: BorderRadius.circular(12),
      color: AppColors.white,
      child: Row(
        children: [
          CustomCircleSvgIcon(path: icon),
          const SizedBox(width: 12),
          CustomText(data: title),
        ],
      ),
    );
  }

  Widget _header() {
    return CustomText(
      data: 'Dashboard',
      style: BaseStyle.s8w700,
    );
  }

  Widget _statCard({
    required String title,
    required String value,
    required String icon,
  }) {
    return Expanded(
      child: CustomContainer(
        h: 120,
        borderRadius: BorderRadius.circular(20),
        color: AppColors.hexCcd6,
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            CustomCircleSvgIcon(path: icon),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(data: title),
                const SizedBox(height: 8),
                CustomText(
                  data: value,
                  style: BaseStyle.s20w400,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _actionCard({
    required String title,
    required String icon,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: CustomContainer(
          h: 120,
          borderRadius: BorderRadius.circular(20),
          color: AppColors.hexDAdb,
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CustomCircleSvgIcon(path: icon),
              const SizedBox(width: 20),
              CustomText(
                data: title,
                style: BaseStyle.s15w700.copyWith(color: AppColors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardOnTap({
    String? label,
    VoidCallback? onTap,
    Color? bgColor,
}){
    return CustomContainer(
      onTap: onTap,
        padding: const EdgeInsets.symmetric(
            horizontal: 9,
            vertical: 3
        ),
        borderRadius: BorderRadius.circular(20),
        color: bgColor ?? AppColors.white,
      child: Row(
        children: [
          const CustomCircleSvgIcon(
            bgColor: AppColors.black10,
            path: AssetIcons.icEdit,
          ).padRight(10),
          CustomText(data: label ?? 'Change Password',style: BaseStyle.s14w400.c(AppColors.black).family(FontFamily.montserrat),),
        ],
      ),
      );

  }
  Widget _userListView(List<User?>? users, {bool loading = false, String? error}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        const SizedBox(height: 20),

        Row(
          children: [
            _statCard(
              title: 'Total Users',
              value: '${users?.length ?? 0}',
              icon: AssetIcons.icUser,
            ),
            const SizedBox(width: 20),
            _actionCard(
              title: 'Change Password',
              icon: AssetIcons.icLock,
              onTap: () {},
            ),
          ],
        ),

        const SizedBox(height: 30),

        /// ✅ Content Area
        Expanded(
          child: Builder(
            builder: (_) {
              if (loading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (error != null) {
                return Center(child: CustomText(data: error));
              }
              if (users == null || users.isEmpty) {
                return const Center(child: CustomText(data: 'No users found'));
              }

              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return _userItem(user, index);
                },
              );
            },
          ),
        ),
      ],
    ).padH(20);
  }


  Widget _userItem(User? user, int index) {
    return CustomContainer(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 10),
      borderRadius: BorderRadius.circular(10),
      color: AppColors.hexDAdb,
      child: Row(
        children: [
          CustomText(data: '${index + 1}'),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(data: '${user?.firstName} ${user?.lastName}'),
              CustomText(data: user?.mobileNumber ?? ''),
              CustomText(data: user?.id ?? ''),
            ],
          ),
          const Spacer(),
          _cardOnTap(
            label: 'Add Pump',
            bgColor: AppColors.hex5474.withOAlpha(0.2),
            onTap: () {
              getIt<AppRouter>().push<void>(PumpSetupScreen(customerId: user?.id));
            },
          ).padRight(20),
          _cardOnTap(),
        ],
      ),
    );
  }


}


