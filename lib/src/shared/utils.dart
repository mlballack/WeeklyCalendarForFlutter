DateTime addDay(DateTime date, int days) {
  return date.add(Duration(days: days));
}

DateTime subtractDay(DateTime date, int days) {
  return date.subtract(Duration(days: days));
}

DateTime firstDayOfWeek(DateTime date) {
  if (date.weekday == DateTime.sunday) {
    return date;
  }
  return date.subtract(Duration(days: date.weekday));
}

List<DateTime> getWeekdays(DateTime date, int at) {
  final first = firstDayOfWeek(date);
  if (at >= 0) {
    return _addWeek(first, at);
  } else {
    return _subtractWeek(first, -at);
  }
}

List<DateTime> _addWeek(DateTime date, int add) {
  final day = addDay(date, 7 * add);
  return _getWeekDaysAt(day);
}

List<DateTime> _subtractWeek(DateTime date, int subtract) {
  final day = subtractDay(date, 7 * subtract);
  return _getWeekDaysAt(day);
}

List<DateTime> _getWeekDaysAt(DateTime date) {
  return List.generate(7, (index) => index)
      .map((index) => date.add(Duration(days: index)))
      .toList();
}
