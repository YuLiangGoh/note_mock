import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/app/app_route.dart';
import 'package:note_mock/gen/fonts.gen.dart';
import 'package:note_mock/screen/splash/splash_screen_page.dart';
import 'package:note_mock/util/object_box_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 727),
      builder: (_, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          onGenerateRoute: AppRoute.onGenerateRoute,
          title: 'Note',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            fontFamily: FontFamily.pingFangSC,
          ),
          home: child,
        );
      },
      child: const SplashScreenPage(),
    );
  }
}
