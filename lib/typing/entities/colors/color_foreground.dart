part of '../entities.dart';

class ColorForeground {
  ColorForeground({
    required this.scale,
    required this.noChange,
    required this.main,
    required this.feedbacks,
  });

  final ColorScaleExtended scale;
  final ColorContrast noChange;
  final ColorMains main;
  final ColorFeedbacks feedbacks;
}
