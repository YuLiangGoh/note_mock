import 'package:hooks_riverpod/hooks_riverpod.dart';

final appNavigationBarProvider =
    StateNotifierProvider<AppNavigationBarController, int>((ref) {
  return AppNavigationBarController();
});

class AppNavigationBarController extends StateNotifier<int> {
  AppNavigationBarController() : super(0);

  void updateIndex(int index) {
    state = index;
  }
}
