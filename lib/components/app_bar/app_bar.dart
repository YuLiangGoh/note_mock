import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/app/app_route.dart';

class AppTitleBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTitleBar({
    super.key,
    required this.title,
    this.isAbleToBack = true,
    this.actions,
  });

  final String title;
  final bool isAbleToBack;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      flexibleSpace: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w)
            .add(EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
          gradient: const LinearGradient(
            colors: [
              AppColor.violetApprox,
              AppColor.violetApprox1,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColor.violetApprox2.withOpacity(0.25),
              offset: const Offset(0, 4),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              if (isAbleToBack)
                IconButton(
                  onPressed: AppRoute.popPage,
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 24.w,
                  ),
                  color: AppColor.white,
                ),
              Text(
                title,
                style: textStyleW600(fontSize: 24),
              ),
              if (actions != null) ...actions!,
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(68.h);
}
