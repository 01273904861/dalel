
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginNowWidget extends StatelessWidget {
  const LoginNowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(Routes.logIn, (_) => false);
      },
      child: Text(
        textAlign: TextAlign.center,
        'Login Now',
        style: AppTextStyle.popins400Black24
            .copyWith(fontSize: 16.sp, decoration: TextDecoration.underline),
      ),
    );
  }
}
