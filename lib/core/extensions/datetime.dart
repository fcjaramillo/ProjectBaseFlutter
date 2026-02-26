part of 'extensions.dart';

extension DateTimeExtension on DateTime {
  String _baseFormat(String format) => DateFormat(format).format(this);

  Duration remainingTime({int minutes = 15, int seconds = 0}) => add(
    Duration(minutes: minutes, seconds: seconds),
  ).difference(DateTime.now());

  String formatDateWithHourDetail(String hour) {
    final String date = _baseFormat('EE, d-MMM-yy');
    return '$date\n($hour)';
  }

  String dayAndMonthFormat() => _baseFormat('MMMM dd');

  String hourFormat() => _baseFormat('HH:mm');

  String monthDayYearFormat() => _baseFormat('MMMM d, yyyy');

  String shortMonthDayYearFormat() => _baseFormat('MMM d, yyyy');

  String shortMonthYearFormat() => _baseFormat('MMM yyyy');
}
