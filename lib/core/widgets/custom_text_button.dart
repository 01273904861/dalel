import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.label,
    required this.onPressed,
  });
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: TextButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(343.w, 56.h)),
            backgroundColor:
                const WidgetStatePropertyAll(AppColors.primaryColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: AppTextStyle.popins500White15,
          )),
    );
  }
}
