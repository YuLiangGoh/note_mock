import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.title,
    this.onPressed,
    this.width,
  });

  final String title;
  final Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        gradient: const LinearGradient(
          colors: [
            AppColor.violetRed,
            AppColor.violetRed1,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(width ?? 200.w, 34.h),
          padding: EdgeInsets.symmetric(vertical: 8.h),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24.r),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: textStyleW600(fontSize: 14),
        ),
      ),
    );
  }
}
