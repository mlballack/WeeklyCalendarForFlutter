import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/calendar_style.dart';

class DayOfWeekCell extends StatelessWidget {
  const DayOfWeekCell({
    super.key,
    required this.height,
    required this.date,
    required this.style,
  });

  final double height;
  final DateTime date;
  final CalendarStyle style;

  String get locale => style.locale;
  String get text => DateFormat.E(locale).format(date);
  Color get dowTextColor => style.dayOfWeekTextColor;
  Color get weekendTextColor => style.weekendDayOfWeekTextColor;
  Color get textColor => _isWeekend(date) ? weekendTextColor : dowTextColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  bool _isWeekend(DateTime date) {
    return date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;
  }
}
