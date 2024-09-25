import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/controller/app_navigation_bar_controller.dart';
import 'package:note_mock/gen/assets.gen.dart';

class AppBottomNavigationBar extends HookConsumerWidget {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(appNaviagtionBarProvider);
    final controller = ref.read(appNaviagtionBarProvider.notifier);
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.haiti.withOpacity(0.85),
            AppColor.haiti1.withOpacity(0.85),
          ],
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          itemWidget(
            Assets.resources.images.home.homeActiveIcon.path,
            Assets.resources.images.home.homeInactiveIcon.path,
            'Home',
            selectedIndex == 0,
            () => controller.updateIndex(0),
          ),
          gapWidth50,
          addWidget(),
          gapWidth50,
          itemWidget(
            Assets.resources.images.home.summaryActiveIcon.path,
            Assets.resources.images.home.summaryInactiveIcon.path,
            'Summary',
            selectedIndex == 1,
            () => controller.updateIndex(1),
          ),
        ],
      ),
    );
  }

  Widget addWidget() {
    return Assets.resources.images.home.addIcon.image(
      width: 36.w,
    );
  }

  Widget itemWidget(
    String activeImgSrc,
    String inactiveImgSrc,
    String title,
    bool isActive,
    Function() onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            isActive ? activeImgSrc : inactiveImgSrc,
            gaplessPlayback: true,
            width: 50.w,
          ),
          gapHeight8,
          Text(
            title,
            style: textStyleW500(
                color: isActive ? AppColor.violetRed : AppColor.regentGrey),
          ),
        ],
      ),
    );
  }
}
