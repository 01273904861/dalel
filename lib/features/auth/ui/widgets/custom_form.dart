import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/features/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Form(
          child: Column(
        children: [
          const CustomTextField(labelText: 'first name'),
          verticalSpacing(20),
          const CustomTextField(labelText: 'last name'),
          verticalSpacing(20),
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
