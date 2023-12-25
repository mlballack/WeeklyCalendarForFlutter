import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekly_calendar/src/widgets/day_cell.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

void main() {
  Widget setupTestWidget(Widget child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(child: child),
    );
  }

  testWidgets(
      "DayCell(display:2023/12/25, selected: 2023/12/25, current: 2023/12/25)",
      (tester) async {
    final dayCell = DayCell(
      display: DateTime(2023, 12, 25),
      selected: DateTime(2023, 12, 25),
      current: DateTime(2023, 12, 25),
      style: const CalendarStyle(),
    );

    await tester.pumpWidget(setupTestWidget(dayCell));

    expect(find.byType(DayCell), findsOneWidget);

    final candidates = find.byType(DayCell).allCandidates;

    final animatedContainer = candidates
        .firstWhere((element) => element.widget is AnimatedContainer)
        .widget as AnimatedContainer;
    expect((animatedContainer.decoration as BoxDecoration).color,
        dayCell.todaySelectedCircleColor);

    final text = candidates
        .firstWhere((element) => element.widget is Text)
        .widget as Text;
    expect(text.data, "25");
    expect(text.style?.color, dayCell.selectedDayTextColor);
  });

  testWidgets(
      "DayCell(display:2023/12/25, selected: 2023/12/20, current: 2023/12/25)",
      (tester) async {
    final dayCell = DayCell(
      display: DateTime(2023, 12, 25),
      selected: DateTime(2023, 12, 20),
      current: DateTime(2023, 12, 25),
      style: const CalendarStyle(),
    );

    await tester.pumpWidget(setupTestWidget(dayCell));

    expect(find.byType(DayCell), findsOneWidget);

    final candidates = find.byType(DayCell).allCandidates;

    final animatedContainer = candidates
        .firstWhere((element) => element.widget is AnimatedContainer)
        .widget as AnimatedContainer;
    expect((animatedContainer.decoration as BoxDecoration).color,
        Colors.transparent);

    final text = candidates
        .firstWhere((element) => element.widget is Text)
        .widget as Text;
    expect(text.data, "25");
    expect(text.style?.color, dayCell.todayDayTextColor);
  });

  testWidgets(
      "DayCell(display:2023/12/25, selected: 2023/12/20, current: 2023/12/20)",
      (tester) async {
    final dayCell = DayCell(
      display: DateTime(2023, 12, 25),
      selected: DateTime(2023, 12, 20),
      current: DateTime(2023, 12, 20),
      style: const CalendarStyle(),
    );

    await tester.pumpWidget(setupTestWidget(dayCell));

    expect(find.byType(DayCell), findsOneWidget);

    final candidates = find.byType(DayCell).allCandidates;

    final animatedContainer = candidates
        .firstWhere((element) => element.widget is AnimatedContainer)
        .widget as AnimatedContainer;
    expect((animatedContainer.decoration as BoxDecoration).color,
        Colors.transparent);

    final text = candidates
        .firstWhere((element) => element.widget is Text)
        .widget as Text;
    expect(text.data, "25");
    expect(text.style?.color, dayCell.dayTextColor);
  });

  testWidgets(
      "DayCell(display:2023/12/24, selected: 2023/12/20, current: 2023/12/20) if weekend",
      (tester) async {
    final dayCell = DayCell(
      display: DateTime(2023, 12, 24),
      selected: DateTime(2023, 12, 20),
      current: DateTime(2023, 12, 20),
      style: const CalendarStyle(),
    );

    await tester.pumpWidget(setupTestWidget(dayCell));

    expect(find.byType(DayCell), findsOneWidget);

    final candidates = find.byType(DayCell).allCandidates;

    final animatedContainer = candidates
        .firstWhere((element) => element.widget is AnimatedContainer)
        .widget as AnimatedContainer;
    expect((animatedContainer.decoration as BoxDecoration).color,
        Colors.transparent);

    final text = candidates
        .firstWhere((element) => element.widget is Text)
        .widget as Text;
    expect(text.data, "24");
    expect(text.style?.color, dayCell.weekendDayTextColor);
  });
}
