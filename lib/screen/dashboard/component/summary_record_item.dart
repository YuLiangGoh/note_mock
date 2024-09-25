import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/components/buttons/primary_button.dart';

class SummaryRecordItem extends StatelessWidget {
  const SummaryRecordItem({
    super.key,
    required this.imgSrc,
    required this.title,
    this.detailOnPressed,
    required this.totalRecord,
  });

  final String imgSrc;
  final String title;
  final Function()? detailOnPressed;
  final int totalRecord;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              imgSrc,
              width: 48.w,
            ),
            gapWidth4,
            Text(
              title,
              style: textStyleW400(
                fontSize: 16,
              ),
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Detail',
              onPressed: detailOnPressed,
              width: 71.w,
            ),
          ],
        ),
        gapHeight12,
        Container(
          width: 1.0.sw,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColor.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(
              color: AppColor.white.withOpacity(0.12),
            ),
          ),
          child: Text(
            'This topic has a total of $totalRecord records.',
            style: textStyleW400(
              fontSize: 14,
              color: AppColor.white.withOpacity(0.7),
            ),
          ),
        )
      ],
    );
  }
}
