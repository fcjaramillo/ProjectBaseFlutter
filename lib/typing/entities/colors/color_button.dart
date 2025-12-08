part of '../entities.dart';

class ColorButton {
  ColorButton({
    required this.containedContrast,
    required this.contained,
    required this.outlined,
    required this.text,
  });

  final ColorStates containedContrast;
  final ColorStates contained;
  final ColorStates outlined;
  final ColorStates text;
}
