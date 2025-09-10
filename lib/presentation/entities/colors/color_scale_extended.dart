part of '../entities.dart';

class ColorScaleExtended {
  ColorScaleExtended({
    required this.strong,
    required this.base,
    required this.soft,
    required this.subtle,
    required this.disabled,
    required this.invert,
  });

  final Color strong;
  final Color base;
  final Color soft;
  final Color subtle;
  final Color disabled;
  final Color invert;
}
