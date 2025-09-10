part of '../entities.dart';

class ColorVariant {
  ColorVariant({
    required this.v50,
    required this.v950,
  });

  final Color v50;
  final Color v950;

  static ColorVariant initial() => ColorVariant(
        v50: const Color(0x00000000),
        v950: const Color(0x00000000),
      );
}
