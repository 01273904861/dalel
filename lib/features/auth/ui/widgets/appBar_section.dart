import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 375.w,
          height: 290.h,
          color: AppColors.primaryColor,
        ),
        Row(
          children: [
            SizedBox(
              width: 250.w,
              height: 100.h,
            
            )
          ],
        )
      ],
    );
  }
}
