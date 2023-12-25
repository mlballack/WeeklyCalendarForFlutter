import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weekly_calendar/src/widgets/day_of_week_view.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

void main() {
  Widget setupTestWidget(Widget child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(child: child),
    );
  }

  group("DayOfWeekView", () {
    testWidgets("DayOfWeekView(locale=ja_JP)", (WidgetTester tester) async {
      await initializeDateFormatting("ja_JP");
      final weekdays = List.generate(7, (index) {
        return DateTime(2023, 12, 24 + index);
      });
      final view =
          DayOfWeekView(weekdays: weekdays, style: const CalendarStyle());

      await tester.pumpWidget(setupTestWidget(view));
      expect(find.byType(DayOfWeekView), findsOneWidget);

      final candidates = find.byType(DayOfWeekView).allCandidates;
      final weekdayNames = candidates
          .where((candidate) {
            return candidate.widget is Text;
          })
          .map((e) => (e.widget as Text).data)
          .toList();

      expect(weekdayNames[0], "日");
      expect(weekdayNames[1], "月");
      expect(weekdayNames[2], "火");
      expect(weekdayNames[3], "水");
      expect(weekdayNames[4], "木");
      expect(weekdayNames[5], "金");
      expect(weekdayNames[6], "土");
    });

    testWidgets("DayOfWeekView(locale=en_US)", (WidgetTester tester) async {
      await initializeDateFormatting("en_US");
      final weekdays = List.generate(7, (index) {
        return DateTime(2023, 12, 24 + index);
      });
      final view = DayOfWeekView(
          weekdays: weekdays, style: const CalendarStyle(locale: "en_US"));

      await tester.pumpWidget(setupTestWidget(view));
      expect(find.byType(DayOfWeekView), findsOneWidget);

      final candidates = find.byType(DayOfWeekView).allCandidates;
      final weekdayNames = candidates
          .where((candidate) {
            return candidate.widget is Text;
          })
          .map((e) => (e.widget as Text).data)
          .toList();

      expect(weekdayNames[0], "Sun");
      expect(weekdayNames[1], "Mon");
      expect(weekdayNames[2], "Tue");
      expect(weekdayNames[3], "Wed");
      expect(weekdayNames[4], "Thu");
      expect(weekdayNames[5], "Fri");
      expect(weekdayNames[6], "Sat");
    });
  });
}
