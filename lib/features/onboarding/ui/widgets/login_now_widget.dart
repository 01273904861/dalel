import 'package:dalel/core/database/cache_constants.dart';
import 'package:dalel/core/database/cache_helper.dart';
import 'package:dalel/core/routing/routes.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginNowTextWidget extends StatelessWidget {
  const LoginNowTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
                CacheHelper()
            .setData(key: CacheConstants.visitedOnBoarding, value: true);
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
