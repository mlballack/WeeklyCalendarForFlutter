import 'package:flutter/material.dart';

import '../shared/calendar_style.dart';
import '../widgets/day_cell.dart';

class DayTableView extends StatelessWidget {
  const DayTableView({
    super.key,
    required this.weekdays,
    required this.onSelect,
    required this.selectedDate,
    required this.currentDate,
    required this.style,
  });

  final List<DateTime> weekdays;
  final Function(DateTime)? onSelect;
  final DateTime selectedDate;
  final DateTime currentDate;
  final CalendarStyle style;

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          children: [
            ...weekdays.map(
              (date) {
                return GestureDetector(
                  onTap: () => onSelect?.call(date),
                  child: DayCell(
                    display: date,
                    selected: selectedDate,
                    current: currentDate,
                    style: style,
                  ),
                );
              },
            ).toList(),
          ],
        ),
      ],
    );
  }
}
