import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/ui/widgets/appBar_section.dart';
import 'package:dalel/features/auth/ui/widgets/custom_form.dart';
import 'package:dalel/features/auth/ui/widgets/dont_have_an_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: AppBarSection()),
            SliverToBoxAdapter(child: verticalSpacing(20.h)),
            SliverToBoxAdapter(
              child: Text(
                textAlign: TextAlign.center,
                'Welcome Back!',
                style: AppTextStyle.ppoins600Black28,
              ),
            ),
            SliverToBoxAdapter(child: verticalSpacing(20.h)),
            const SliverToBoxAdapter(
              child: CustomForm(),
            ),
            SliverToBoxAdapter(child: verticalSpacing(10)),
            SliverToBoxAdapter(child: verticalSpacing(60)),
            SliverToBoxAdapter(
              child: CustomTextButton(label: 'Log In', onPressed: () {}),
            ),
            SliverToBoxAdapter(child: verticalSpacing(10)),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    Routes.register,
                    (_) => false,
                  );
                },
                child: const CustomTextSpan(
                  text1: ' Don’t have an account ? ',
                  text2: 'Sign Up',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
