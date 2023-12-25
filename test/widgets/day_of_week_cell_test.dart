import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weekly_calendar/src/widgets/day_of_week_cell.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

void main() {
  Widget setupTestWidget(Widget child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(child: child),
    );
  }

  testWidgets("DayOfWeekCell", (WidgetTester tester) async {
    await initializeDateFormatting("ja_JP");

    final date = DateTime(2023, 12, 25);
    final dayOfWeekCell =
        DayOfWeekCell(height: 15, date: date, style: const CalendarStyle());

    await tester.pumpWidget(setupTestWidget(dayOfWeekCell));

    expect(find.byType(DayOfWeekCell), findsOneWidget);

    final candidates = find.byType(DayOfWeekCell).allCandidates;

    final text = candidates
        .firstWhere((element) => element.widget is Text)
        .widget as Text;
    expect(text.data, "月");
  });
}
