import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'shared/calendar_style.dart';
import 'widgets/footer_date_text.dart';
import 'widgets/day_of_week_view.dart';
import 'widgets/header_date_text.dart';
import 'widgets/week_page.dart';
import 'shared/utils.dart' show getWeekdays;

class WeeklyCalendar extends StatefulWidget {
  const WeeklyCalendar({
    super.key,
    this.calendarStyle = const CalendarStyle(
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      margin: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    ),
    this.isAutoSelect = true,
    this.onChangedSelectedDate,
    this.onChangedPage,
  });

  final CalendarStyle calendarStyle;
  final bool isAutoSelect;
  final Function(DateTime)? onChangedSelectedDate;
  final Function(DateTime date, PageState state)? onChangedPage;

  @override
  State<StatefulWidget> createState() => _WeeklyCalendarState();
}

class _WeeklyCalendarState extends State<WeeklyCalendar> {
  final DateTime now = DateTime.now();
  DateTime selectedDate = DateTime.now();
  DateTime currentPageDate = DateTime.now();

  EdgeInsets get padding => widget.calendarStyle.padding;
  EdgeInsets get margin => widget.calendarStyle.margin;
  BoxDecoration get decoration => widget.calendarStyle.decoration;

  bool get isShowHeaderDateText => widget.calendarStyle.isShowHeaderDateText;
  bool get isShowFooterDateText => widget.calendarStyle.isShowFooterDateText;

  @override
  void initState() {
    initializeDateFormatting(widget.calendarStyle.locale);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: padding,
        margin: margin,
        decoration: decoration,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isShowHeaderDateText)
              HeaderDateText(
                  date: currentPageDate, style: widget.calendarStyle),
            if (isShowHeaderDateText)
              const SizedBox(
                height: 8,
              ),
            customDayOfWeek(),
            WeekPage(
              selectedDate: selectedDate,
              now: now,
              style: widget.calendarStyle,
              isAutoSelect: widget.isAutoSelect,
              onChangedPage: (date, state) {
                setState(() {
                  currentPageDate = date;
                });
                widget.onChangedPage?.call(date, state);
              },
              onChangedSelectedDate: (date) {
                setState(() {
                  selectedDate = date;
                });
                widget.onChangedSelectedDate?.call(date);
              },
            ),
            if (isShowFooterDateText)
              FooterDateText(
                  selectedDate: selectedDate, style: widget.calendarStyle),
          ],
        ),
      ),
    );
  }

  Widget customDayOfWeek() {
    final weekdays = getWeekdays(now, 0);
    return DayOfWeekView(weekdays: weekdays, style: widget.calendarStyle);
  }
}
