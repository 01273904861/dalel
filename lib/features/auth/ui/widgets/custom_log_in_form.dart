import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/features/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLogInForm extends StatefulWidget {
  const CustomLogInForm({super.key});

  @override
  State<CustomLogInForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomLogInForm> {
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
          child: Column(
        children: [
          const CustomTextField(labelText: 'email address'),
          verticalSpacing(20),
          CustomPassowrdTextField(
            labelText: 'password',
            obsecureText: obsecureText,
            suffixIcon: GestureDetector(
                onTap: () {
                  obsecureText = !obsecureText;
                  setState(() {});
                },
                child: obsecureText
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility)),
          ),
          verticalSpacing(20),
        ],
      )),
    );
  }
}
