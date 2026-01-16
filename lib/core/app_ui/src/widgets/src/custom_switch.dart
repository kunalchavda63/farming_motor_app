import 'package:farming_motor_app/core/app_ui/app_ui.dart';


class CustomSwitch extends StatelessWidget {

  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
  });
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: value, // 👈 PROVIDER CONTROLS THIS
      onChanged: onChanged,
    );
  }
}
