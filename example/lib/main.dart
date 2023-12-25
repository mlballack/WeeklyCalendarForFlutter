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
        body: HomeView(),
      ),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final mywidgetkey = GlobalKey();
  double calendarHeight = 0;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      debugPrint("size: ${mywidgetkey.currentContext?.size}");
    });
    return Column(
      children: [
        calendar0(),
        calendar1(),
        calendar2(),
        //Spacer(),
      ],
    );
  }

  Widget calendar0() {
    return WeeklyCalendar(
      calendarStyle: CalendarStyle(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        margin: EdgeInsets.all(14),
        decoration: BoxDecoration(),
      ),
      isAutoSelect: true,
      onChangedSelectedDate: (date) {
        debugPrint("onChangedSelectedDate: $date");
      },
      onChangedPage: (date, state) {
        debugPrint("onChangedPage: $date ${state.name}");
      },
    );
  }

  Widget calendar1() {
    return WeeklyCalendar(
      calendarStyle: CalendarStyle(
          locale: "en",
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          margin: EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          selectedCircleColor: Colors.blueAccent,
          todayDayTextColor: Colors.deepPurple,
          todaySelectedCircleColor: Colors.deepPurple),
      isAutoSelect: false,
      onChangedSelectedDate: (date) {
        debugPrint("onChangedSelectedDate: $date");
      },
      onChangedPage: (date, state) {
        debugPrint("onChangedPage: $date ${state.name}");
      },
    );
  }

  Widget calendar2() {
    return WeeklyCalendar(
      calendarStyle: CalendarStyle(
        locale: "zh",
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        margin: EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(14))),
        headerDateTextColor: Colors.white,
        isShowHeaderDateText: false,
        footerDateTextColor: Colors.white,
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
    );
  }
}
