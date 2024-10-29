import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/features/auth/ui/widgets/dont_have_an_account.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccountSection extends StatelessWidget {
  const AlreadyHaveAnAccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(10),
        GestureDetector(
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
        )
      ],
    );
  }
}
