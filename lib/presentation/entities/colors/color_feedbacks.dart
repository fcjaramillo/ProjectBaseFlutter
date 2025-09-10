part of '../entities.dart';

class ColorFeedbacks {
  ColorFeedbacks({
    required this.success,
    required this.informative,
    required this.warning,
    required this.error,
  });

  final Color success;
  final Color informative;
  final Color warning;
  final Color error;
}
