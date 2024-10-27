import 'package:dalel/core/theming/app_colors.dart';
import 'package:dalel/core/theming/app_images.dart';
import 'package:dalel/core/theming/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppBarSection extends StatelessWidget {
  const AppBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      width: 375.w,
      height: 290.h,
      color: AppColors.primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Dalel',
            style: AppTextStyle.ppoins700BWhite32,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 250.w,
                height: 100.h,
                child: SvgPicture.asset(AppImages.imagesPyramidss),
              ),
              SizedBox(
                width: 100.w,
                height: 128.h,
                child: SvgPicture.asset(AppImages.imagesMosque2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
