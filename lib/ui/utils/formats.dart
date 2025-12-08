part of './utils.dart';

class Formats {
  static String convertDateTimeToDayNameToMonth(DateTime date) =>
      DateFormat('EEE, MMM d').format(date);

  static String convertDateTimeToDayToMonth(DateTime date) =>
      DateFormat('MMM d').format(date);

  static String convertDateTimeYearMonthDay(String date) {
    DateTime newDate = DateTime.parse(date);
    return DateFormat('yyyy-MM-dd').format(newDate);
  }

  static String convertDateToFormatWithMonth(String date) {
    try {
      final DateTime parsedDate = DateFormat('dd/MM/yy').parse(date);
      return DateFormat('dd-MMM-yy').format(parsedDate);
    } catch (_) {
      try {
        final DateTime parsedDate = DateTime.parse(date);
        return DateFormat('dd-MMM-yy').format(parsedDate);
      } catch (_) {
        return date;
      }
    }
  }

  static String convertIntervalTimeToMonthAndDay({
    required String initialDate,
    required String endDate,
  }) {
    String start = DateFormat('MMM d').format(DateTime.parse(initialDate));
    String end = DateFormat('MMM d').format(DateTime.parse(endDate));
    return '$start - $end';
  }

  static String convertIntervalTimeToMonthDayAndYear({
    required String initialDate,
    required String endDate,
  }) {
    String start = DateFormat('d MMM yy').format(DateTime.parse(initialDate));
    String end = DateFormat('d MMM yy').format(DateTime.parse(endDate));
    return '$start - $end';
  }

  static String convertTime(String time) {
    try {
      DateTime dateTime = DateFormat('HH:mm:ss').parse(time);
      String formattedTime = DateFormat.jm().format(dateTime);
      return formattedTime;
    } catch (e) {
      return time;
    }
  }

  static String convertToDateTimeString(String date) {
    DateTime dateTime = DateFormat('dd-MMM-yy').parse(date);
    return dateTime.toIso8601String();
  }

  static String convertDateToDayMonthNameAndYear(DateTime date) =>
      DateFormat('d MMM yy').format(date).capitalizeWords();

  static String convertDateToDayMonthNameAndFullYear(DateTime date) =>
      DateFormat('d MMM yyyy').format(date).capitalizeWords();

  static String convertDateToMonthNameDayAndYear(DateTime date) =>
      DateFormat('MMM d, yyyy').format(date).capitalizeWords();

  static String convertDateToMonthNameDayAndYearFromString(String date) {
    try {
      final DateTime parsedDate = DateTime.parse(date);
      return DateFormat('MMM d, yyyy').format(parsedDate).capitalizeWords();
    } catch (_) {
      return date;
    }
  }

  static String convertDateToDayMonthYear(String date) {
    try {
      final DateTime parsedDate = DateFormat('dd-MMM-yyyy').parse(date);
      return DateFormat('dd/MM/yy').format(parsedDate);
    } catch (_) {
      try {
        final DateTime parsedDate = DateTime.parse(date);
        return DateFormat('dd/MM/yy').format(parsedDate);
      } catch (_) {
        return date;
      }
    }
  }
}
