import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_images.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGoogleTextButton extends StatelessWidget {
  const CustomGoogleTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
  });
  final String label;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: TextButton(
          style: ButtonStyle(
            minimumSize: WidgetStatePropertyAll(Size(343.w, 56.h)),
            backgroundColor:
                WidgetStatePropertyAll(color ?? AppColors.primaryColor),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.sp),
              ),
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: AppTextStyle.popins500White15,
              ),
              Image.asset(
                AppImages.imagesGoogle,
                width: 24,
                height: 24,
              ),
            ],
          )),
    );
  }
}