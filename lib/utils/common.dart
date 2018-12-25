import 'package:intl/intl.dart';

String formatDate(String format, DateTime date) {
  var formatter = new DateFormat(format);
  return formatter.format(date);
}