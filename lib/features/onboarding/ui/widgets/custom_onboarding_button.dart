import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOnBoardingTextButton extends StatelessWidget {
  const CustomOnBoardingTextButton({
    this.index,
    super.key,
    required this.pageController,
  });
  final PageController pageController;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          minimumSize: WidgetStatePropertyAll(Size(343.w, 56.h)),
          backgroundColor: const WidgetStatePropertyAll(AppColors.primaryColor),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        onPressed: () {
          index == onBoardingModels.length - 1
              ? Navigator.pushNamedAndRemoveUntil(
                  context, Routes.register, (_) => false)
              : pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
        },
        child: index == onBoardingModels.length - 1
            ? Text(
                'create a ccount ',
                style: AppTextStyle.popins500White15,
              )
            : Text(
                'next',
                style: AppTextStyle.popins500White15,
              ));
  }
}
