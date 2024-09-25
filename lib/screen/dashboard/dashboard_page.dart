import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:note_mock/components/bottom_navigation_bar/app_bottom_navigation_bar.dart';
import 'package:note_mock/controller/app_navigation_bar_controller.dart';
import 'package:note_mock/screen/dashboard/component/home_widget.dart';
import 'package:note_mock/screen/dashboard/component/summary_widget.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(appNavigationBarProvider);
    final controller = usePageController();

    useEffect(() {
      if (controller.hasClients) {
        controller.jumpToPage(selectedIndex);
      }
      return;
    }, [selectedIndex]);

    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeWidget(),
          SummaryWidget(),
        ],
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
