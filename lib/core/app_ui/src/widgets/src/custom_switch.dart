import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/l10n/loc.dart';

class CustomSwitch extends StatelessWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.isLoading,
  });
  final bool? isLoading;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations loc = AppLocalizations.of(context)!;
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
                alignment: value ? Alignment.centerLeft : Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    value ? loc.on: loc.off,
                    style: BaseStyle.s14w400
                        .c(value ? AppColors.white : AppColors.black)
                        .w(800)
                        .family(FontFamily.montserrat),
                  ),
                ),
              ),

              // THUMB
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: value ? Alignment.centerRight : Alignment.centerLeft,
                child: isLoading!=true ? const CustomContainer(
                  w: 28,
                  h: 28,
                  color: Colors.white,
                  boxShape: BoxShape.circle,
                ):
                    CustomContainer(
                      color: AppColors.white,
                      h: 30,
                      w: 30,
                      boxShape: BoxShape.circle,
                      child: const CircularProgressIndicator(
                        strokeWidth: 0.9,
                      ).padAll(8),
                    )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
