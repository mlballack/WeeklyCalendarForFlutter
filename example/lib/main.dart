import 'package:flutter/material.dart';
import 'package:weekly_calendar/weekly_calendar.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(),
        body: Column(
          children: [
            WeeklyCalendar(
              calendarStyle: const CalendarStyle(
                locale: "en_US",
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                margin: EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(14))),
                headerDateTextColor: Colors.white,
                headerDateTextAlign: Alignment.center,
                isShowHeaderDateText: false,
                footerDateTextColor: Colors.white,
                footerDateTextAlign: Alignment.center,
                isShowFooterDateText: false,
                selectedCircleColor: Colors.white,
                todaySelectedCircleColor: Colors.greenAccent,
                dayTextColor: Colors.white,
                todayDayTextColor: Colors.greenAccent,
                selectedDayTextColor: Colors.black,
                weekendDayTextColor: Colors.grey,
                dayOfWeekTextColor: Colors.white,
                weekendDayOfWeekTextColor: Colors.grey,
              ),
              isAutoSelect: true,
              onChangedSelectedDate: (date) {
                debugPrint("onChangedSelectedDate: $date");
              },
              onChangedPage: (date, state) {
                debugPrint("onChangedPage: $date ${state.name}");
              },
            ),
          ],
        ),
      ),
    );
  }
}
