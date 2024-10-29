import 'package:dalel/core/functions/show_snack_bar.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_state.dart';
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
    final auth = context.read<AuthCubit>();
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, 
        AuthState>(
          listener: (context, state) {
          if(state is SignInFailureState){
            showSnackBar(context, state.errorMessage);
          }
          else if(state is SignInSuccessState){
              showSnackBar(context, 'login sucess');
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
                  signInFormKey: context.read<AuthCubit>().signInFormKey,
                )),
                SliverToBoxAdapter(child: verticalSpacing(30)),
                SliverToBoxAdapter(
                  child: CustomTextButton(
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

  void checkSignInValidMethod(AuthCubit auth) {
       if (auth.signInFormKey.currentState!.validate()) {
      auth.signIn();
      auth.signInEmailContoller.clear();
      auth.signInPasswordController.clear();
    }
  }
}
