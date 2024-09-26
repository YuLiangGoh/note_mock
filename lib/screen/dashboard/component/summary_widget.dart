import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/controller/note_controller.dart';
import 'package:note_mock/gen/assets.gen.dart';
import 'package:note_mock/screen/dashboard/component/summary_record_item.dart';

class SummaryWidget extends StatefulHookConsumerWidget {
  const SummaryWidget({super.key});

  @override
  ConsumerState<SummaryWidget> createState() => _SummaryWidgetState();
}

class _SummaryWidgetState extends ConsumerState<SummaryWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final noteViewModel = ref.watch(noteProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColor.cloudBurst,
              AppColor.jaggerApprox,
              AppColor.revolverApprox,
              AppColor.grapeApprox,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 1.0.sw,
              height: 140.h,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned(
                    left: 20.w,
                    child: Text(
                      'Summary',
                      style: textStyleW600(
                        fontSize: 24,
                        color: AppColor.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -24.h,
                    right: 0,
                    child: Assets.resources.images.summary.summaryEclipse
                        .image(width: 268.w),
                  ),
                  Positioned(
                    bottom: 20.h,
                    right: 8.w,
                    child: Assets.resources.images.summary.summaryRobot
                        .image(width: 100.w),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r),
                  ),
                  color: AppColor.white.withOpacity(0.05),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      gapHeight24,
                      SummaryRecordItem(
                        imgSrc: Assets.resources.images.summary.avatar1.path,
                        title: 'Work and study',
                        totalRecord: noteViewModel.workAndStudyNotes.length,
                      ),
                      gapHeight24,
                      SummaryRecordItem(
                        imgSrc: Assets.resources.images.summary.avatar2.path,
                        title: 'Home life',
                        totalRecord: noteViewModel.lifeNotes.length,
                      ),
                      gapHeight24,
                      SummaryRecordItem(
                        imgSrc: Assets.resources.images.summary.avatar3.path,
                        title: 'Health and wellness',
                        totalRecord:
                            noteViewModel.healthAndWellnessNotes.length,
                      ),
                      gapHeight80,
                      gapHeight80,
                    ]
                        .animate(interval: 100.ms, delay: 100.ms)
                        .fade(duration: 300.ms)
                        .slide(
                            duration: 300.ms,
                            begin: const Offset(0, 5),
                            curve: Curves.easeInOut),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
