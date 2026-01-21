import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/src/strings.dart';


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
    return Transform.scale(
      scale: 0.8,
      child: GestureDetector(
          onTap: () => onChanged(!value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            width: 80,
            height: 36,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: value ? AppColors.hex5474 : AppColors.hexCcd6,
            ),
            child: Stack(
              children: [
                // ON / OFF TEXT
                Align(
                  alignment:
                  value ? Alignment.centerLeft : Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      value ? AppStrings.on : AppStrings.off,
                      style: BaseStyle.s14w400.c(value? AppColors.white:AppColors.black).w(800).family(FontFamily.montserrat)
                    ),
                  ),
                ),

                // THUMB
                AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  alignment:
                  value ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
