import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../shared/calendar_style.dart';

class FooterDateText extends StatelessWidget {
  const FooterDateText({
    super.key,
    required this.selectedDate,
    required this.style,
  });

  final DateTime selectedDate;
  final CalendarStyle style;

  String get locale => style.locale;
  Color get textColor => style.footerDateTextColor;
  Alignment get alignment => style.footerDateTextAlign;

  String get dateStr {
    return "${DateFormat.yMMMMd(locale).format(selectedDate)} (${DateFormat.EEEE(locale).format(selectedDate)})";
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
        dateStr,
        style: TextStyle(
          color: textColor,
          fontSize: 14,
        ),
      ),
    );
  }
}
