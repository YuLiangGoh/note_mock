import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/components/app_bar/app_bar.dart';
import 'package:note_mock/controller/note_controller.dart';
import 'package:note_mock/gen/assets.gen.dart';
import 'package:note_mock/screen/dashboard/component/home_note_item.dart';

class HomeWidget extends HookConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteViewModel = ref.watch(noteProvider);
    final noteController = ref.read(noteProvider.notifier);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        noteController.getAllNotes();
      });
      return;
    }, []);

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
                    HomeNoteItem(
                      imgSrc:
                          Assets.resources.images.home.workAndStudyIcon.path,
                      title: 'Work and study',
                      notes: noteViewModel.workAndStudyNotes,
                    ),
                    gapHeight28,
                    HomeNoteItem(
                      imgSrc: Assets.resources.images.home.lifeIcon.path,
                      title: 'Life',
                      notes: noteViewModel.lifeNotes,
                    ),
                    gapHeight28,
                    HomeNoteItem(
                      imgSrc: Assets
                          .resources.images.home.healthAndWellnessIcon.path,
                      title: 'Health and wellness',
                      notes: noteViewModel.healthAndWellnessNotes,
                    ),
                    gapHeight80,
                    gapHeight80,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
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
