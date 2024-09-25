import 'package:flutter/material.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/screen/dashboard/dashboard_page.dart';
import 'package:note_mock/screen/note/add_note_page.dart';
import 'package:note_mock/screen/setting/setting_page.dart';

class AppRoute {
  AppRoute._();

  static const String dashboard = '/dashboard';
  static const String addNote = '/addNote';
  static const String setting = '/setting';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    MaterialPageRoute<dynamic> materialPageRoute(Widget route) {
      return MaterialPageRoute(
        builder: (_) => route,
        settings: settings,
      );
    }

    switch (settings.name) {
      case dashboard:
        return materialPageRoute(const DashboardPage());
      case addNote:
        return materialPageRoute(const AddNotePage());
      case setting:
        return materialPageRoute(const SettingPage());
      default:
        return materialPageRoute(const DashboardPage());
    }
  }

  static pushPage(String routeName) =>
      Navigator.of(globalContext).pushNamed(routeName);

  static pushReplacementPage(String routeName) =>
      Navigator.of(globalContext).pushReplacementNamed(routeName);

  static pushAndRemoveUntilPage(String routeName) => Navigator.of(globalContext)
      .pushNamedAndRemoveUntil(routeName, (route) => false);

  static popPage() => Navigator.of(globalContext).pop();
}
