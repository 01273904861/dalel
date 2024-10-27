import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/features/onboarding/data/models/onboarding_model.dart';
import 'package:dalel/features/onboarding/ui/custom_page_view_builder.dart';
import 'package:dalel/features/onboarding/ui/widgets/login_now_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'ui/widgets/custom_onboarding_button.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int index = 0;

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.sp),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: verticalSpacing(30)),
              SliverToBoxAdapter(
                child: Text(
                  'skip',
                  style: AppTextStyle.popins400Black24,
                  textAlign: TextAlign.end,
                ),
              ),
              SliverToBoxAdapter(
                child: CustomPageViewBuilder(
                  pageController: pageController,
                  onPageChanged: (i) {
                    index = i;
                    setState(() {});
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: CustomOnBoardingTextButton(
                  index: index,
                  pageController: pageController,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(10)),
              index == onBoardingModels.length - 1
                  ? SliverToBoxAdapter(
                      child: Column(
                      children: [
                        const LoginNowTextWidget(),
                        verticalSpacing(10),
                      ],
                    ))
                  : SliverToBoxAdapter(child: verticalSpacing(10)),
            ],
          ),
        ),
      ),
    );
  }
}
