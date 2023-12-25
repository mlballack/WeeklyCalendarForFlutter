import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toStringWithFormat(String format) => DateFormat(format).format(this);
}
