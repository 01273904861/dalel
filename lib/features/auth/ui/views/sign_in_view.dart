import 'dart:math';

import 'package:dalel/core/functions/show_functions.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/data/cubit/cubit/sign_in_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/sign_in_with_google_cubit.dart';
import 'package:dalel/features/auth/ui/widgets/custom_google_text_button.dart';
import 'package:dalel/features/auth/ui/widgets/custom_log_in_form.dart';
import 'package:dalel/features/auth/ui/widgets/dont_have_an_account.dart';
import 'package:dalel/features/auth/ui/widgets/login_banner_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<SignInCubit>();
    final googleAuth = context.read<SignInWithGoogleCubit>();
    return SafeArea(
      child: Scaffold(
        body: BlocListener<SignInWithGoogleCubit, SignInWithGoogleState>(
          // Listener for Google Sign In states
          listener: (context, googleState) {
            if (googleState is SignInWithGoogleFailureState) {
              showToast(googleState.errorMessage);
            } else if (googleState is SignInWithGoogleSuccessState) {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.homePage, (_) => false);
              showToast('Google login success');
            }
          },
          child: BlocConsumer<SignInCubit, SignInState>(
            // Listener for regular Sign In states
            listener: (context, state) {
              if (state is SignInFailureState) {
                showToast(state.errorMessage);
              } else if (state is SignInSuccessState) {
                if (auth.checKVerification()) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Routes.homePage, (_) => false);
                  auth.signInEmailContoller.clear();
                  auth.signInPasswordController.clear();
                  showToast('login success');
                } else {
                  showToast('please verify your email');
                }
              }
            },
            // Builder for UI based on Sign In states
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(child: LoginBannerWidget()),
                  SliverToBoxAdapter(child: verticalSpacing(20.h)),
                  SliverToBoxAdapter(
                    child: Text(
                      textAlign: TextAlign.center,
                      'Welcome Back!',
                      style: AppTextStyle.ppoins600Black28,
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(20.h)),
                  SliverToBoxAdapter(
                    child: CustomLogInForm(
                      signInFormKey: auth.signInFormKey,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.forgotPassword);
                        },
                        child: Text(
                          'Forgot password ? ',
                          style: AppTextStyle.ppoins600Black28
                              .copyWith(fontSize: 13.sp),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(30)),
                  // Regular Sign In Button
                  SliverToBoxAdapter(
                    child: state is SignInLoadingState
                        ? const Center(child: CircularProgressIndicator())
                        : CustomTextButton(
                            label: 'Sign In',
                            onPressed: () {
                              checkSignInValidMethod(auth);
                            },
                          ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(10)),
                  // Google Sign In Button with BlocBuilder
                  SliverToBoxAdapter(
                    child: BlocBuilder<SignInWithGoogleCubit,
                        SignInWithGoogleState>(
                      builder: (context, googleState) {
                        return googleState is SignInWithGoogleLoadingState
                            ? const Center(child: CircularProgressIndicator())
                            : CustomGoogleTextButton(
                                color: AppColors.deepGrey,
                                label: 'Sign in with google',
                                onPressed: () {
                                  context
                                      .read<SignInWithGoogleCubit>()
                                      .signInWithGoogle();
                                },
                              );
                      },
                    ),
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
                        text1: ' Dont have an account ? ',
                        text2: 'Sign Up',
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: verticalSpacing(10)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void checkSignInValidMethod(SignInCubit auth) {
    if (auth.signInFormKey.currentState!.validate()) {
      auth.signIn();
    } else {
      showToast('check email and password');
    }
  }
}
