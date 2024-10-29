import 'package:dalel/core/functions/show_snack_bar.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/ui/widgets/already_have_an_account_section.dart';
import 'package:dalel/features/auth/ui/widgets/dont_have_an_account.dart';
import 'package:dalel/features/auth/ui/widgets/sign_up_button_section.dart';
import 'package:dalel/features/auth/ui/widgets/terms_and_condition.dart';
import 'package:dalel/features/auth/ui/widgets/custom_sign_up_form.dart';
import 'package:dalel/features/auth/ui/widgets/welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>();

    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is SignUpFailureState) {
              showSnackBar(context, state.errorMessage);
            } else if (state is SignUpSuccessState) {
              showSnackBar(context, 'sign up success ');
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: WelcomeSection(),
                ),
                SliverToBoxAdapter(
                  child: CustomSignUpForm(
                    signUpFormKey: auth.signUpFormKey,
                  ),
                ),
                
                const SliverToBoxAdapter(
                  child: SignUpButtonSection(),
                ),
                const SliverToBoxAdapter(
                  child: AlreadyHaveAnAccountSection(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
