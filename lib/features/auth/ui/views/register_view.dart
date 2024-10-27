import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/ui/widgets/dont_have_an_account.dart';
import 'package:dalel/features/auth/ui/widgets/terms_and_condition.dart';
import 'package:dalel/features/auth/ui/widgets/custom_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: verticalSpacing(70)),
              SliverToBoxAdapter(
                child: Text(
                  textAlign: TextAlign.center,
                  'Welcome !',
                  style: AppTextStyle.ppoins600Black28,
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(20.h)),
              const SliverToBoxAdapter(
                child: CustomForm(),
              ),
              SliverToBoxAdapter(child: verticalSpacing(10)),
              const SliverToBoxAdapter(
                child: TermsAndConditionsWidget(),
              ),
              SliverToBoxAdapter(child: verticalSpacing(60)),
              SliverToBoxAdapter(
                child: CustomTextButton(label: 'Sign UP', onPressed: () {}),
              ),
              SliverToBoxAdapter(child: verticalSpacing(10)),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                      Routes.logIn,
                      (_) => false,
                    );
                  },
                  child: const CustomTextSpan(
                    text1: 'Already have an account ? ',
                    text2: 'Sign In',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
