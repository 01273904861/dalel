import 'package:dalel/core/functions/show_functions.dart';
import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/widgets/custom_text_button.dart';
import 'package:dalel/features/auth/data/cubit/cubit/reset_password_cubit.dart';
import 'package:dalel/features/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomResetPasswordForm extends StatelessWidget {
  const CustomResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
  
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordFailureState) {
          showSnackBar(context, state.errorMessage);
        } else if (state is ResetPasswordSucessState) {
          showSnackBar(context, 'reset password success');
          Navigator.of(context).pushNamed(Routes.logIn);
        }
      },
      builder: (context, state) {
          final auth = context.read<ResetPasswordCubit>();
        return Column(
          children: [
            Form(
              key: auth.resetPasswordFormKey,
              child: CustomTextField(
                labelText: 'Email Address',
                controller: auth.resetPasswordEmailContoller,
              ),
            ),
            verticalSpacing(80),
            state is ResetPasswordLoadingState
                ? const Center(child: CircularProgressIndicator())
                : CustomTextButton(
                    label: 'Change Password',
                    onPressed: () async {
                      if (auth.resetPasswordFormKey.currentState!.validate()) {
                        await auth.resetPassword();
                        auth.resetPasswordEmailContoller.clear();
                      } else {}
                    },
                  ),
            verticalSpacing(30),
          ],
        );
      },
    );
  }
}
