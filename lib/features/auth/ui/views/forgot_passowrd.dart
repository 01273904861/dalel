import 'package:dalel/core/functions/show_snack_bar.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_images.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';

import 'package:dalel/features/auth/data/cubit/cubit/reset_password_cubit.dart';
import 'package:dalel/features/auth/ui/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/ui/widgets/welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RsetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
      if (state is ResetPasswordSucessState) {
        Navigator.of(context).pushNamed(Routes.logIn);
        showSnackBar(
            context, 'Check your email for password reset instructions.');
      } else if (state is ResetPasswordFailureState) {
        showSnackBar(context, state.errorMessage);
        print(state.errorMessage);
      }
    }, builder: (context, state) {
      final auth = context.read<RsetPasswordCubit>();
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: WelcomeSection(
                  label: 'Forgot Password',
                ),
              ),
              SliverToBoxAdapter(
                child: Image.asset(
                  AppImages.imagesPassword,
                  width: 235.h,
                  height: 235.h,
                ),
              ),
              SliverToBoxAdapter(
                child: verticalSpacing(40),
              ),
              SliverToBoxAdapter(
                child: Text(
                  textAlign: TextAlign.center,
                  'Enter your registered email below to receive \npassword reset instructions.',
                  style:
                      AppTextStyle.popins400Black24.copyWith(fontSize: 14.sp),
                ),
              ),
              SliverToBoxAdapter(
                child: verticalSpacing(30),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Form(
                    key: auth.resetPasswordFormKey,
                    child: CustomTextField(
                      labelText: 'Email Address',
                      controller: auth.resetPasswordEmailContoller,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(80)),
              SliverToBoxAdapter(
                child: CustomTextButton(
                  label: 'Change Password',
                  onPressed: () async {
                    if (auth.resetPasswordFormKey.currentState!.validate()) {
                      await auth.resetPassword();
                      auth.resetPasswordEmailContoller.clear();
                    } else {
                      showSnackBar(
                          context, 'Please enter a valid email address');
                    }
                  },
                ),
              ),
              SliverToBoxAdapter(child: verticalSpacing(30)),
            ],
          ),
        ),
      );
    });
  }
}
