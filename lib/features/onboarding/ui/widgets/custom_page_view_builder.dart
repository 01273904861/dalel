import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPageViewBuilder extends StatelessWidget {
  const CustomPageViewBuilder(
      {super.key, required this.onPageChanged, required this.pageController});
  final void Function(int)? onPageChanged;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 530.h,
      width: 343.w,
      child: PageView.builder(
        controller: pageController,
        onPageChanged: onPageChanged,
        itemCount: onBoardingModels.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Image.asset(
                onBoardingModels[i].image,
                width: 343.w,
                height: 290.h,
              ),
              verticalSpacing(30),
              Text(
                textAlign: TextAlign.center,
                onBoardingModels[i].title,
                style: AppTextStyle.popins400Black24
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              verticalSpacing(20),
              Text(
                textAlign: TextAlign.center,
                onBoardingModels[i].body,
                style: AppTextStyle.popins300Black16,
              ),
            ],
          );
        },
      ),
    );
  }
}
