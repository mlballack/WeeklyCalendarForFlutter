import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weekly_calendar/src/shared/utils.dart'
    show addDay, subtractDay, getWeekdays, firstDayOfWeek;

void main() {
  group("DateTime addDay(DateTime, int) test", () {
    test('2024/01/01 + 1d = 2024/01/02', () {
      final date = DateTime(2024, 1, 1);
      expect(addDay(date, 1), DateTime(2024, 1, 2));
    });

    test('2023/12/31 + 1d = 2024/01/01', () {
      final date = DateTime(2023, 12, 31);
      expect(addDay(date, 1), DateTime(2024, 1, 1));
    });
  });

  group("DateTime subtractDay(DateTime, int) test", () {
    test('2024/01/01 - 1d = 2023/12/31', () {
      final date = DateTime(2024, 1, 1);
      expect(subtractDay(date, 1), DateTime(2023, 12, 31));
    });
  });

  group("DateTime firstDayOfWeek(DateTime)", () {
    test("2024/01/01(Mon) -> 2023/12/31(Mon)", () {
      final date = DateTime(2024, 1, 1);
      debugPrint("date: $date");
      debugPrint("firstDayOfWeek: ${firstDayOfWeek(date)}");
      expect(firstDayOfWeek(date), DateTime(2023, 12, 31));
    });

    test("2023/12/31(Sun) -> 2023/12/31(Sun)", () {
      final date = DateTime(2023, 12, 31);
      debugPrint("date: $date");
      debugPrint("firstDayOfWeek: ${firstDayOfWeek(date)}");
      expect(firstDayOfWeek(date), DateTime(2023, 12, 31));
    });

    test("2023/12/30(Sat) -> 2023/12/24(Sun)", () {
      final date = DateTime(2023, 12, 30);
      debugPrint("date: $date");
      debugPrint("firstDayOfWeek: ${firstDayOfWeek(date)}");
      expect(firstDayOfWeek(date), DateTime(2023, 12, 24));
    });
  });

  group("getWeekdays", () {
    test("(2023/12/24, 0) -> [2023/12/24...2023/12/30]", () {
      final date = DateTime(2023, 12, 24);
      final weekdays = getWeekdays(date, 0);
      final answer = List.generate(7, (index) {
        return DateTime(2023, 12, 24 + index);
      });
      debugPrint("weekdays: $weekdays");
      debugPrint("answer: $answer");
      expect(weekdays, answer);
    });

    test("(2023/12/24, 1) -> [2023/12/31...2023/01/06]", () {
      final date = DateTime(2023, 12, 24);
      final weekdays = getWeekdays(date, 1);
      final answer = List.generate(7, (index) {
        return DateTime(2023, 12, 31 + index);
      });
      debugPrint("weekdays: $weekdays");
      debugPrint("answer: $answer");
      expect(weekdays, answer);
    });

    test("(2023/12/24, -1) -> [2023/12/17...2023/12/23]", () {
      final date = DateTime(2023, 12, 24);
      final weekdays = getWeekdays(date, -1);
      final answer = List.generate(7, (index) {
        return DateTime(2023, 12, 17 + index);
      });
      debugPrint("weekdays: $weekdays");
      debugPrint("answer: $answer");
      expect(weekdays, answer);
    });
  });
}
