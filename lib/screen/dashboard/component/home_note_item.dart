import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/class/entity/note.dart';
import 'package:note_mock/gen/assets.gen.dart';

class HomeNoteItem extends StatelessWidget {
  const HomeNoteItem({
    super.key,
    required this.imgSrc,
    required this.title,
    this.notes = const [],
  });

  final String imgSrc;
  final String title;
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imgSrc,
              width: 20.w,
            ),
            gapWidth8,
            Text(title, style: textStyleW400(fontSize: 16)),
          ],
        ),
        gapHeight12,
        if (notes.isNotEmpty)
          ...List.generate(
            notes.length > 3 ? 3 : notes.length,
            (index) => noteItem(notes[index]),
          ),
        if (notes.isEmpty)
          Container(
            width: 1.sw,
            decoration: BoxDecoration(
              color: AppColor.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(
                color: AppColor.white.withOpacity(0.12),
                width: 1.w,
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
            child: Text('No notes yet', style: textStyleW400(fontSize: 14)),
          ),
      ],
    );
  }

  Widget noteItem(Note note) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColor.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: AppColor.white.withOpacity(0.12),
          width: 1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Text(
              note.content ?? 'Unknown',
              style: textStyleW400(
                fontSize: 14,
                color: AppColor.white.withOpacity(0.9),
              ),
              maxLines: 2,
            ),
          ),
          gapWidth16,
          Assets.resources.images.home.forwardArrow.image(width: 18.w),
        ],
      ),
    );
  }
}
