import 'package:flutter/material.dart';
import 'package:note_mock/app/app_global.dart';
import 'package:note_mock/screen/dashboard/dashboard_page.dart';
import 'package:note_mock/screen/note/add_edit_note_page.dart';
import 'package:note_mock/screen/setting/setting_page.dart';

class AppRoute {
  AppRoute._();

  static const String dashboard = '/dashboard';
  static const String addEditNote = '/addEditNote';
  static const String setting = '/setting';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    MaterialPageRoute<dynamic> materialPageRoute(Widget route) {
      return MaterialPageRoute(
        builder: (_) => route,
        settings: settings,
      );
    }

    final args = settings.arguments;

    switch (settings.name) {
      case dashboard:
        return materialPageRoute(const DashboardPage());
      case addEditNote:
        return materialPageRoute(AddEditNotePage(
            note: args != null ? (args as AddEditNotePage).note : null));
      case setting:
        return materialPageRoute(const SettingPage());
      default:
        return materialPageRoute(const DashboardPage());
    }
  }

  static pushPage(String routeName, [dynamic arguments]) =>
      Navigator.of(globalContext).pushNamed(routeName, arguments: arguments);

  static pushReplacementPage(String routeName) =>
      Navigator.of(globalContext).pushReplacementNamed(routeName);

  static pushAndRemoveUntilPage(String routeName) => Navigator.of(globalContext)
      .pushNamedAndRemoveUntil(routeName, (route) => false);

  static popPage() => Navigator.of(globalContext).pop();
}
