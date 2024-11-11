import 'package:dalel/core/functions/show_functions.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/ui/widgets/already_have_an_account_section.dart';
import 'package:dalel/features/auth/ui/widgets/sign_up_button_section.dart';
import 'package:dalel/features/auth/ui/widgets/custom_sign_up_form.dart';
import 'package:dalel/features/auth/ui/widgets/welcome_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              showToast(state.errorMessage);
            } else if (state is SignUpSuccessState) {
              showToast('User signed up succesfully');

              Navigator.of(context)
                  .pushNamedAndRemoveUntil(Routes.logIn, (_) => false);
              auth.signUpEmailContoller.clear();
              auth.signUpLastNameController.clear();
              auth.signUpPasswordController.clear();
              auth.signUpFirstNameController.clear();
            }
          },
          builder: (context, state) {
            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: WelcomeSection(label: 'Welcome !'),
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
