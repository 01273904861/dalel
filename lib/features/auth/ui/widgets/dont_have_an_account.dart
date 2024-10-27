import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomTextSpan extends StatelessWidget {
  const CustomTextSpan({super.key, required this.text1, required this.text2});
   final String text1;
   final String text2;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
                text: text1,
                style: AppTextStyle.ppoins400BGrey12
                    .copyWith(color: Colors.black)),
            TextSpan(text: text2, style: AppTextStyle.ppoins400BGrey12),
          ],
        ));
  }
}
