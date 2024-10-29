import 'package:dalel/core/helper/spacing.dart';
import 'package:dalel/features/auth/data/cubit/cubit/auth_cubit.dart';
import 'package:dalel/features/auth/ui/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key, required this.signUpFormKey});
  final Key signUpFormKey;
  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  bool obsecureText = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Form(
          key: widget.signUpFormKey,
          child: Column(
            children: [
              CustomTextField(
                  controller:
                      context.read<AuthCubit>().signUpfirstNameController,
                  labelText: 'first name'),
              verticalSpacing(20),
              CustomTextField(
                  controller:
                      context.read<AuthCubit>().signUpLastNameController,
                  labelText: 'last name'),
              verticalSpacing(20),
              CustomTextField(
                  controller: context.read<AuthCubit>().signUpEmailContoller,
                  labelText: 'email address'),
              verticalSpacing(20),
              CustomPassowrdTextField(
                labelText: 'password',
                controller: context.read<AuthCubit>().signUpPasswordController,
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
