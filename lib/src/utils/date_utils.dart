import 'package:intl/intl.dart';

final DateFormat dateFormat = DateFormat("yyyy-MM-dd");
final DateFormat dateTimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

DateTime truncDateTime(DateTime dateTime) {
  String s = dateToString(dateTime);
  return stringToDate(s);
}

///
/// Convert a String (yyyy-MM-dd HH:mm:ss) to DateTime
///
DateTime stringToDateTime(String dateTimeStr) {
  return dateTimeFormat.parse(dateTimeStr);
}

///
/// Convert a String (yyyy-MM-dd) to DateTime
///
DateTime stringToDate(String dateTimeStr) {
  return dateFormat.parse(dateTimeStr);
}

///
/// Convert a DateTime to String (yyyy-MM-dd)
///
String dateToString(DateTime dateTime) {
  return dateFormat.format(dateTime);
}

///
/// Convert a DateTime to String (yyyy-MM-dd HH:mm:ss)
///
String dateTimeToString(DateTime dateTime) {
  return dateTimeFormat.format(dateTime);
}
