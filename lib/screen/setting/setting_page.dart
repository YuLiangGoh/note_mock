import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/components/app_bar/app_bar.dart';
import 'package:note_mock/components/buttons/primary_button.dart';
import 'package:note_mock/controller/setting_page_controller.dart';
import 'package:note_mock/gen/assets.gen.dart';
import 'package:note_mock/screen/setting/component/setting_item.dart';

class SettingPage extends HookConsumerWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: const AppTitleBar(title: 'Settings'),
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
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 1.sh - 68.h - MediaQuery.of(context).padding.top,
          ),
          child: Container(
              width: 1.0.sw,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  gapHeight20,
                  SettingItem(
                    imgSrc:
                        Assets.resources.images.setting.onlineCustomerIcon.path,
                    title: 'Online Customer',
                  ),
                  gapHeight16,
                  SettingItem(
                    imgSrc:
                        Assets.resources.images.setting.userAgreementIcon.path,
                    title: 'User Agreement',
                  ),
                  gapHeight16,
                  SettingItem(
                    imgSrc:
                        Assets.resources.images.setting.privacyPolicyIcon.path,
                    title: 'Privacy Policy',
                  ),
                  gapHeight16,
                  SettingItem(
                    imgSrc: Assets.resources.images.setting.aboutUsIcon.path,
                    title: 'About Us',
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: bottomNavigationItem(ref),
    );
  }

  Widget bottomNavigationItem(WidgetRef ref) {
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
      child: Center(
        child: PrimaryButton(
          title: 'Delete All Notes',
          onPressed: () => SettingPageController.deleteAllNotes(ref),
        ),
      ),
    );
  }
}
