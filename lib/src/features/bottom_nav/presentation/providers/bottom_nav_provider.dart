import 'package:track_expense/src/core/imports/packages_imports.dart';

import '../enums/bottom_nav_tab.dart';

final bottomNavProvider = StateNotifierProvider<BottomNavNotifier, BottomNavTab>((ref) {
  return BottomNavNotifier();
});

class BottomNavNotifier extends StateNotifier<BottomNavTab> {
  BottomNavNotifier() : super(BottomNavTab.home);

  void setTab(BottomNavTab tab) => state = tab;

  void setIndex(int index) {
    if (index < 0 || index >= BottomNavTab.values.length) {
      return;
    }

    state = BottomNavTab.values[index];
  }
}
