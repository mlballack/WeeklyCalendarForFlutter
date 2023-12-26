// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weekly_calendar/src/widgets/footer_date_text.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

void main() {
  Widget setupTestWidget(Widget child) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(child: child),
    );
  }

  group("FooterDateText", () {
    final selectedDate = DateTime(2023, 12, 25);
    testWidgets("selected: 2023/12/25 locale=ja_JP", (tester) async {
      const locale = "ja_JP";
      await initializeDateFormatting(locale);
      final view = FooterDateText(
          selectedDate: selectedDate,
          style: const CalendarStyle(locale: locale));
      await tester.pumpWidget(setupTestWidget(view));
      expect(find.byType(FooterDateText), findsOneWidget);

      final candidates = find.byType(FooterDateText).allCandidates;
      final text = candidates
          .firstWhere((element) => element.widget is Text)
          .widget as Text;
      expect(text.data, "2023年12月25日 (月曜日)");
    });

    testWidgets("selected: 2023/12/25 locale=en_US", (tester) async {
      const locale = "en_US";
      await initializeDateFormatting(locale);
      final view = FooterDateText(
          selectedDate: selectedDate,
          style: const CalendarStyle(locale: locale));
      await tester.pumpWidget(setupTestWidget(view));
      expect(find.byType(FooterDateText), findsOneWidget);

      final candidates = find.byType(FooterDateText).allCandidates;
      final text = candidates
          .firstWhere((element) => element.widget is Text)
          .widget as Text;
      expect(text.data, "December 25, 2023 (Monday)");
    });
  });
}
