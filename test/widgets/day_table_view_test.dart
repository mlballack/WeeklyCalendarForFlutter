import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekly_calendar/src/widgets/day_table_view.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

void main() {
  Widget setupTestWidget(Widget child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(child: child),
    );
  }

  final weekdays = List.generate(
    7,
    (index) {
      return DateTime(2023, 12, 24 + index);
    },
  );

  group("DayTableView", () {
    testWidgets("selected: 2023/12/24, current: 2023/12/24", (tester) async {
      final selectedDate = DateTime(2023, 12, 24);
      final currentDate = DateTime(2023, 12, 24);

      final view = DayTableView(
        weekdays: weekdays,
        onSelect: (date) {
          print(date);
        },
        selectedDate: selectedDate,
        currentDate: currentDate,
        style: const CalendarStyle(),
      );

      await tester.pumpWidget(setupTestWidget(view));
      await tester.pumpAndSettle();

      view.onSelect!(DateTime(2023, 12, 25));
    });
  });
}
