import 'package:flutter/material.dart';

import '../shared/calendar_style.dart';
import '../extension/datetime_ex.dart';

class DayCell extends StatelessWidget {
  const DayCell({
    super.key,
    required this.display,
    required this.selected,
    required this.current,
    required this.style,
  });

  final DateTime display;
  final DateTime selected;
  final DateTime current;
  final CalendarStyle style;

  String get dayText {
    return display.toStringWithFormat("d");
  }

  Color get selectedCircleColor => style.selectedCircleColor;
  Color get todaySelectedCircleColor => style.todaySelectedCircleColor;
  Color get dayTextColor => style.dayTextColor;
  Color get todayDayTextColor => style.todayDayTextColor;
  Color get selectedDayTextColor => style.selectedDayTextColor;
  Color get weekendDayTextColor => style.weekendDayTextColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: _isSelected(display)
            ? _isToday(display)
                ? todaySelectedCircleColor
                : selectedCircleColor
            : Colors.transparent,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        dayText,
        style: TextStyle(
          fontSize: 16,
          fontWeight: _isSelected(display) ? FontWeight.bold : FontWeight.w500,
          color: _dayTextColor(display),
        ),
      ),
    );
  }

  Color _dayTextColor(DateTime date) {
    if (_isSelected(date)) {
      return selectedDayTextColor;
    }

    if (_isToday(date)) {
      return todayDayTextColor;
    }

    if (_isWeekend(date)) {
      return weekendDayTextColor;
    }

    return dayTextColor;
  }

  bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }

  bool _isSelected(DateTime date) {
    return date.toStringWithFormat("yyyyMMdd") ==
        selected.toStringWithFormat("yyyyMMdd");
  }

  bool _isToday(DateTime date) {
    return date.toStringWithFormat("yyyyMMdd") ==
        current.toStringWithFormat("yyyyMMdd");
  }
}
