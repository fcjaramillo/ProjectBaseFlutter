part of 'extensions.dart';

extension DurationExtension on Duration {
  String get formatted {
    String twoDigitMinutes = _twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = _twoDigits(inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
}
