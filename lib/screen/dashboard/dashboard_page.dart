import 'package:flutter/material.dart';
import 'package:note_mock/components/app_bar/app_bar.dart';
import 'package:note_mock/components/buttons/primary_button.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTitleBar(
        title: 'Home',
        isAbleToBack: false,
      ),
      body: Column(
        children: [
          PrimaryButton(
            title: 'Logout',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
