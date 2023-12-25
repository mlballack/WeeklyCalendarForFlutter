import 'package:flutter/material.dart';

class CalendarStyle {
  /// Common
  ///
  final String locale;

  ///
  ///
  final EdgeInsets padding;

  ///
  ///
  final EdgeInsets margin;

  ///
  ///
  final BoxDecoration decoration;

  /// HeaderDateText
  ///
  final Alignment headerDateTextAlign;
  final Color headerDateTextColor;
  final bool isShowHeaderDateText;

  /// FooterDateText
  ///
  final Alignment footerDateTextAlign;
  final Color footerDateTextColor;
  final bool isShowFooterDateText;

  /// DayCell
  final Color selectedCircleColor;
  final Color todaySelectedCircleColor;
  final Color dayTextColor;
  final Color todayDayTextColor;
  final Color selectedDayTextColor;
  final Color weekendDayTextColor;

  // DayOfWeekCell
  final Color dayOfWeekTextColor;
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
