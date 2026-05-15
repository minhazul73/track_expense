import 'package:track_expense/src/core/imports/core_imports.dart';
import 'package:track_expense/src/core/imports/packages_imports.dart';

import '../screens/calendar_page.dart';
import '../screens/notes_page.dart';
import '../screens/tasks_page.dart';

enum BottomNavTab {
  home,
  notes,
  calendar,
  tasks,
}

extension BottomNavTabX on BottomNavTab {
  String get title => switch (this) {
        BottomNavTab.home => 'bottom_nav.home',
        BottomNavTab.notes => 'bottom_nav.notes',
        BottomNavTab.calendar => 'bottom_nav.calendar',
        BottomNavTab.tasks => 'bottom_nav.tasks',
      };

  List<List<dynamic>> get icon => switch (this) {
        BottomNavTab.home => HugeIcons.strokeRoundedHome01,
        BottomNavTab.notes => HugeIcons.strokeRoundedDocumentAttachment,
        BottomNavTab.calendar => HugeIcons.strokeRoundedCalendar01,
        BottomNavTab.tasks => HugeIcons.strokeRoundedTask01,
      };

  Widget get page => switch (this) {
        BottomNavTab.home => const HomePage(),
        BottomNavTab.notes => const NotesPage(),
        BottomNavTab.calendar => const CalendarPage(),
        BottomNavTab.tasks => const TasksPage(),
      };
}
