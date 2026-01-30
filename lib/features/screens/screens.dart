import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/features/screens/history_tab/history_tab.dart';
import 'package:farming_motor_app/features/screens/home_tab/home_tab.dart';
import 'package:farming_motor_app/features/screens/provider/bottom_nav_provider.dart';
import 'package:farming_motor_app/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class Screens extends StatefulWidget {
  const Screens({super.key,required this.userModel});
  final UserModel userModel;

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  late AppLocalizations loc;
  int currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loc = AppLocalizations.of(context)!;
  }


  @override
  Widget build(BuildContext context) {
    final provider = context.read<BottomNavProvider>();
    final currentIndex = context.watch<BottomNavProvider>().currentIndex;


    const List<Widget> pages = [
      HomeTab(),
      HistoryTab(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: AppColors.white,
      bottomNavigationBar: CustomBottomNav(

        currentIndex: currentIndex,
        onTap: (v){
          provider.changeIndex(v);
        },
        bottomNavList: [
          BottomNavModel(icon: AssetIcons.icHome, label: loc.home),
          BottomNavModel(icon: AssetIcons.icHistory, label: loc.history),
        ],
      ),
    );
  }
}
