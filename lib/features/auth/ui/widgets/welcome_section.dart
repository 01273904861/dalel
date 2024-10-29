import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
           verticalSpacing(70),
                Text(
                  textAlign: TextAlign.center,
                  'Welcome !',
                  style: AppTextStyle.ppoins600Black28,
                ),
                verticalSpacing(20),
    ],);
  }
}