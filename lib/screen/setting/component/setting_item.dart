import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/gen/assets.gen.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.imgSrc,
    required this.title,
    this.onTap,
  });

  final String imgSrc;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColor.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColor.white.withOpacity(0.12),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Image.asset(
            imgSrc,
            width: 24.w,
          ),
          gapWidth16,
          Expanded(
            child: Text(
              title,
              style: textStyleW400(
                fontSize: 16,
                color: AppColor.white.withOpacity(0.9),
              ),
            ),
          ),
          Assets.resources.images.home.forwardArrow.image(width: 18.w),
        ],
      ),
    );
  }
}
