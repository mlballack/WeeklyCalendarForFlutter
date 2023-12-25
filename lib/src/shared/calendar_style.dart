import 'package:flutter/material.dart';

class CalendarStyle {
  /// The locale of the calendar.
  ///
  final String locale;

  /// The padding of the calendar.
  ///
  final EdgeInsets padding;

  /// The margin of the calendar.
  ///
  final EdgeInsets margin;

  /// The decoration of the calendar.
  ///
  final BoxDecoration decoration;

  /// The alignment of the header date text.
  ///
  final Alignment headerDateTextAlign;

  /// The color of the header date text.
  ///
  final Color headerDateTextColor;

  /// Whether to show the header date text.
  ///
  final bool isShowHeaderDateText;

  /// The alignment of the footer date text.
  ///
  final Alignment footerDateTextAlign;

  /// The color of the footer date text.
  ///
  final Color footerDateTextColor;

  /// Whether to show the footer date text.
  ///
  final bool isShowFooterDateText;

  /// The color of the selected circle in DayCell.
  ///
  final Color selectedCircleColor;

  /// The color of the selected circle at today in DayCell.
  ///
  final Color todaySelectedCircleColor;

  /// The color of the day text in DayCell.
  ///
  final Color dayTextColor;

  /// The color of the day text at today in DayCell.
  ///
  final Color todayDayTextColor;

  /// The color of the selected day text in DayCell.
  ///
  final Color selectedDayTextColor;

  /// The color of the weekend day text in DayCell.
  ///
  final Color weekendDayTextColor;

  /// The color of the text in DayOfWeekCell.
  ///
  final Color dayOfWeekTextColor;

  /// The color of the weekend text in DayOfWeekCell.
  ///
  final Color weekendDayOfWeekTextColor;

  const CalendarStyle({
    this.locale = "ja",
    this.padding = const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    this.margin = const EdgeInsets.all(14),
    this.decoration = const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.headerDateTextAlign = Alignment.center,
    this.headerDateTextColor = Colors.black,
    this.isShowHeaderDateText = true,
    this.footerDateTextAlign = Alignment.center,
    this.footerDateTextColor = Colors.black,
    this.isShowFooterDateText = true,
    this.selectedCircleColor = Colors.black,
    this.todaySelectedCircleColor = Colors.red,
    this.dayTextColor = Colors.black,
    this.todayDayTextColor = Colors.red,
    this.selectedDayTextColor = Colors.white,
    this.weekendDayTextColor = Colors.grey,
    this.dayOfWeekTextColor = Colors.black,
    this.weekendDayOfWeekTextColor = Colors.grey,
  });
}
