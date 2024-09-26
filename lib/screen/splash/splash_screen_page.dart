import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_mock/app/app_constant.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/app/app_route.dart';
import 'package:note_mock/gen/assets.gen.dart';

class SplashScreenPage extends HookWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 1), () {
          AppRoute.pushAndRemoveUntilPage(AppRoute.dashboard);
        });
      });
      return;
    }, []);

    return Scaffold(
      body: Container(
        width: 1.0.sw,
        height: 1.0.sh,
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
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.resources.images.summary.summaryRobot
                  .image(width: 150.w)
                  .animate()
                  .fadeIn(duration: const Duration(milliseconds: 500)),
              gapHeight12,
              AnimatedTextKit(
                isRepeatingAnimation: false,
                animatedTexts: [
                  TyperAnimatedText(
                    'NOTE',
                    textStyle: textStyleW600(fontSize: 42, wordSpacing: 10),
                    speed: const Duration(milliseconds: 100),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
