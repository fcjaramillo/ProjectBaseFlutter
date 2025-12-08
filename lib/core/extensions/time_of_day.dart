part of 'extensions.dart';

extension TimeOfDayFormatter on TimeOfDay {
  /// Return hour format such as "04:23 pm"
  int get hour12 {
    final int h = hour % 12;
    return h == 0 ? 12 : h;
  }

  String get periodString => hour >= 12 ? 'PM' : 'AM';

  String format12h({bool leadingZero = true, bool uppercase = false}) {
    final String minuteStr = minute.toString().padLeft(2, '0');
    final String periodStr = period.name.toUpperCase();

    return '$hourOfPeriod:$minuteStr $periodStr';
  }
}
