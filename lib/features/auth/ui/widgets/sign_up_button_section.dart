import 'package:dalel/core/functions/show_functions.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_state.dart';
import 'package:dalel/features/auth/ui/widgets/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpButtonSection extends StatelessWidget {
  const SignUpButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthCubit>();
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Column(
          children: [
            verticalSpacing(10),
            const TermsAndConditionsWidget(),
            verticalSpacing(60),
            auth.termsAndConditionValue
                ? state is SignUpLoadingState
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomTextButton(
                        label: 'Sign Up',
                        onPressed: () {
                          checkSignUpValideMethod(auth);
                        })
                : CustomTextButton(
                    label: 'Sign Up', color: Colors.grey, onPressed: () {}),
          ],
        );
      },
    );
  }

  void checkSignUpValideMethod(AuthCubit auth) {
    if (auth.signUpFormKey.currentState!.validate()) {
      auth.signUp();
    } else {
      showToast('Please enter fields');
    }
  }
}
