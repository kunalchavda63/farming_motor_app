
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.bottomNavList,
    this.currentIndex = 0,
    this.onTap,
  });

  final List<BottomNavModel> bottomNavList;
  final int currentIndex;
  final ValueChanged<int>? onTap;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.hex5474,
      unselectedItemColor: AppColors.hexDAdb,

      items: List.generate(bottomNavList.length, (index) {
        final item = bottomNavList[index];
        final isSelected = currentIndex == index;

        return BottomNavigationBarItem(
          icon: SvgPicture.asset(
            item.icon,
            width: 20.r,
            height: 20.r,
            colorFilter: ColorFilter.mode(
              isSelected
                  ? AppColors.hex5474
                  : AppColors.hexDAdb,
              BlendMode.srcIn,
            ),
          ).padBottom(5),
          label: item.label,
        );
      }),
    );
  }
}

