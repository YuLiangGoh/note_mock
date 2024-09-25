import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/components/app_bar/app_bar.dart';
import 'package:note_mock/components/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:note_mock/gen/assets.gen.dart';
import 'package:note_mock/screen/dashboard/component/dashboard_note_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppTitleBar(
        title: 'Home',
        isAbleToBack: false,
        actions: [
          Assets.resources.images.home.settingIcon.image(
            width: 24.w,
          )
        ],
      ),
      body: Container(
        padding:
            EdgeInsets.only(top: 68.h + MediaQuery.of(context).padding.top),
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: 1.sw,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 1.sh - 68.h - MediaQuery.of(context).padding.top,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    gapHeight20,
                    recentCreatedNoted(),
                    gapHeight28,
                    DashboardNoteItem(
                      imgSrc:
                          Assets.resources.images.home.workAndStudyIcon.path,
                      title: 'Work and study',
                      notes: const [],
                    ),
                    gapHeight28,
                    DashboardNoteItem(
                      imgSrc: Assets.resources.images.home.lifeIcon.path,
                      title: 'Life',
                      notes: const [],
                    ),
                    gapHeight28,
                    DashboardNoteItem(
                      imgSrc: Assets
                          .resources.images.home.healthAndWellnessIcon.path,
                      title: 'Health and wellness',
                      notes: const [],
                    ),
                    gapHeight32,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
      extendBody: true,
    );
  }

  Widget recentCreatedNoted() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.resources.images.home.recentIcon.image(
          width: 20.w,
        ),
        gapWidth8,
        Text(
          'Recently created notes',
          style: textStyleW400(
              color: AppColor.white.withOpacity(0.7), fontSize: 16),
        ),
      ],
    );
  }
}
