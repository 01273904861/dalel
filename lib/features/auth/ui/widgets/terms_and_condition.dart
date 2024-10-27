import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({
    super.key,
  });

  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool value = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.sp),
      child: Row(
        children: [
          Checkbox(
              value: value,
              side: const BorderSide(color: AppColors.primaryColor),
              activeColor: Colors.grey,
              onChanged: (val) {
                value = val!;
                setState(() {});
              }),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'I have agree to our ',
                style: AppTextStyle.popins400Black24.copyWith(fontSize: 13)),
            TextSpan(
                text: 'Terms and Condition',
                style: AppTextStyle.popins400Black24.copyWith(
                    fontSize: 14, decoration: TextDecoration.underline))
          ]))
        ],
      ),
    );
  }
}
