import 'package:flutter/material.dart';

import '../shared/calendar_style.dart';
import '../widgets/day_of_week_cell.dart';

class DayOfWeekView extends StatelessWidget {
  const DayOfWeekView({
    super.key,
    required this.weekdays,
    required this.style,
  });
  final List<DateTime> weekdays;
  final CalendarStyle style;

  final double cellHeight = 15;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: weekdays
              .map(
                (date) => DayOfWeekCell(
                  height: cellHeight,
                  date: date,
                  style: style,
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
