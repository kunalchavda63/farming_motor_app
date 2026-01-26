// lib/core/widgets/custom_text_field.dart
import 'package:farming_motor_app/core/app_ui/app_ui.dart';
import 'package:farming_motor_app/core/utilities/utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.focusNode,
    this.isPassword = false,
    this.textInputType,
    this.textInputAction,
    this.validator,
    this.onChanged,
    this.padding,
    this.fillColor,
    this.borderRadius = 8,
    this.isDropdown = false,
    this.anchorKey,
    this.context,
    this.items,
    this.onSelected,
    this.maxLength,
    this.inputFormatter

  });
  final List<TextInputFormatter>? inputFormatter;
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final bool isPassword;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? padding;
  final Color? fillColor;
  final double borderRadius;
  final bool isDropdown;
  final GlobalKey? anchorKey;
  final List<PopUpModel>? items;
  final void Function(PopUpModel)? onSelected;
  final BuildContext? context;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomText(
          data: label,
          style: BaseStyle.s14w400.c(AppColors.black),
        ).padBottom(10.r),
        GestureDetector(
          onTap: isDropdown
              ? () async {
                  if (anchorKey == null || items == null) {
                    return;
                  }

                  final selectedId = await context.showCustomPopupMenu(
                    color: AppColors.white,


                    itemBuilder: (items) {
                      return CustomContainer(

                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10
                        ),

                        borderRadius: BorderRadius.circular(5),

                        border: Border.all(width: 0.1),
                        color: AppColors.hex2e47.withOAlpha(0.10),
                        w: MediaQuery.of(context).size.width,
                        child: CustomText(data: items.data,style: BaseStyle.s14w500.c(AppColors.hex2e47),),
                      );
                    },
                    anchorKey: anchorKey!,
                    ctx: context,
                    items: items ?? [],
                  );

                  if (selectedId != null) {
                    final selectedItem = items?.firstWhere(
                      (e) => e.id == selectedId,
                    );

                    controller.text = selectedItem!.data;
                    onSelected?.call(selectedItem);
                  }
                }
              : null,
          child: AbsorbPointer(
            absorbing: isDropdown,
            child: CustomTextField(
              inputFormatter: inputFormatter,
              maxLength: maxLength,
              readOnly: isDropdown,
              key: anchorKey,
              controller: controller,
              focusNode: focusNode,
              textInputType: textInputType ?? TextInputType.text,
              textInputAction: textInputAction ?? TextInputAction.next,
              obscureText: isPassword,
              suffixIcon: isDropdown ? SvgPicture.asset(AssetIcons.icDropdown,colorFilter: ColorFilter.mode(AppColors.black.withOAlpha(0.20), BlendMode.srcIn),).padAll(14):null,
              validator: validator,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              filled: true,
              fillColor: fillColor ?? AppColors.hex5474.withOAlpha(0.25),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: AppColors.transparent),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              cursorColor: AppColors.hex2e47,
              style: BaseStyle.s17w400.c(AppColors.black.withOAlpha(0.75)),
            ),
          ),
        ),
      ],
    );
  }
}
