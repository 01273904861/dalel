import 'package:dalel/core/functions/show_functions.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';

import 'package:dalel/features/auth/data/cubit/cubit/sign_in_cubit.dart';
import 'package:dalel/features/auth/ui/widgets/login_banner_widget.dart';
import 'package:dalel/features/auth/ui/widgets/custom_log_in_form.dart';
import 'package:dalel/features/auth/ui/widgets/dont_have_an_account.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<SigninCubit>();
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<SigninCubit, SignInState>(
          listener: (context, state) {
            if (state is SignInFailureState) {
              showToast(state.errorMessage);
            } else if (state is SignInSuccessState) {
              if (auth.checKVerification()) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(Routes.homePage, (_) => false);
                auth.signInEmailContoller.clear();
                auth.signInPasswordController.clear();
                showToast('login sucess');
              } else {
                showToast('please verify your email');
              }
            }
          },
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
                )),
                SliverToBoxAdapter(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.forgotPassword);
                    },
                    child: Text(
                      'Forgot password ? ',
                      style:
                          AppTextStyle.ppoins600Black28.copyWith(fontSize: 13),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )),
                SliverToBoxAdapter(child: verticalSpacing(30)),
                SliverToBoxAdapter(
                  child: state is SignInLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomTextButton(
                          label: 'Sign In',
                          onPressed: () {
                            checkSignInValidMethod(auth);
                          }),
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
                ),
                SliverToBoxAdapter(child: verticalSpacing(10)),
              ],
            );
          },
        ),
      ),
    );
  }

  void checkSignInValidMethod(SigninCubit auth) {
    if (auth.signInFormKey.currentState!.validate()) {
      auth.signIn();
    } else {
      showToast('check email and password');
    }
  }
}
