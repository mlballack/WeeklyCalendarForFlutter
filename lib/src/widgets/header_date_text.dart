import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/calendar_style.dart';

class HeaderDateText extends StatelessWidget {
  const HeaderDateText({
    super.key,
    required this.date,
    required this.style,
  });

  final DateTime date;
  final CalendarStyle style;

  String get locale => style.locale;
  Color get textColor => style.headerDateTextColor;
  Alignment get alignment => style.headerDateTextAlign;

  String get dateStr {
    return DateFormat.yMMMM(locale).format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        dateStr,
        style: TextStyle(
          color: textColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
