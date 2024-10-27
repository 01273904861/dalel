import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.labelText,
    this.borderRadius,
    this.inputFontSize,
    this.borderColor,
  });
  final String labelText;
  final double? borderRadius;
  final double? inputFontSize;
  final Color? borderColor;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.popins400Black24
          .copyWith(fontSize: inputFontSize?.sp ?? 15.sp),
      decoration: InputDecoration(
        enabledBorder: customInputBorder(),
        focusedBorder: customInputBorder(),
        labelText: labelText,
        labelStyle: AppTextStyle.ppoins500BGrey17,
      ),
    );
  }

  OutlineInputBorder customInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
      borderRadius: BorderRadius.circular(borderRadius?.sp ?? 4.sp),
    );
  }
}

class CustomPassowrdTextField extends StatelessWidget {
  const CustomPassowrdTextField({
    super.key,
    required this.labelText,
    required this.suffixIcon,
    this.obsecureText,
    this.borderRadius,
    this.inputFontSize,
    this.borderColor,
  });
  final String labelText;
  final double? borderRadius;
  final double? inputFontSize;
  final Color? borderColor;
  final Widget suffixIcon;
  final bool? obsecureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText ?? false,
      style: AppTextStyle.popins400Black24
          .copyWith(fontSize: inputFontSize?.sp ?? 15.sp),
      decoration: InputDecoration(
        enabledBorder: customInputBorder(),
        focusedBorder: customInputBorder(),
        labelText: labelText,
        labelStyle: AppTextStyle.ppoins500BGrey17,
        suffixIcon: suffixIcon,
        isDense: true,
        
      ),
    );
  }

  OutlineInputBorder customInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: borderColor ?? Colors.grey),
      borderRadius: BorderRadius.circular(borderRadius?.sp ?? 4.sp),
    );
  }
}
