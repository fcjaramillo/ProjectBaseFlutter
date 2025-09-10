part of '../entities.dart';

class ColorIconForeground {
  ColorIconForeground({
    required this.scale,
    required this.noChange,
    required this.main,
    required this.feedbacks,
  });

  final ColorScaleSemiExtended scale;
  final ColorContrast noChange;
  final ColorMains main;
  final ColorFeedbacks feedbacks;
}
