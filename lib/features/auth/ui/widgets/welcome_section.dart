import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  const WelcomeSection({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(50),
        Text(
          textAlign: TextAlign.center,
          label,
          style: AppTextStyle.ppoins600Black28,
        ),
        verticalSpacing(20),
      ],
    );
  }
}
