import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/theming/app_images.dart';
import 'package:dalel/core/theming/app_text_style.dart';

import 'package:dalel/features/auth/ui/widgets/custom_reset_password_form.dart';
import 'package:dalel/features/auth/ui/widgets/welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
                child: WelcomeSection(
              label: 'Forgot Password',
            )),
            SliverToBoxAdapter(
                child: Image.asset(
              AppImages.imagesPassword,
              width: 235.h,
              height: 235.h,
            )),
            SliverToBoxAdapter(child: verticalSpacing(40)),
            SliverToBoxAdapter(
                child: Text(
              textAlign: TextAlign.center,
              'Enter your registered email below to receive \npassword reset instructions.',
              style: AppTextStyle.popins400Black24.copyWith(fontSize: 14.sp),
            )),
            SliverToBoxAdapter(child: verticalSpacing(30)),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: const CustomResetPasswordForm()),
            ),
          ],
        ),
      ),
    );
  }
}
