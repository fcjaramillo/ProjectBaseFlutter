part of '../entities.dart';

class ColorVariants {
  ColorVariants({
    required this.v50,
    required this.v100,
    required this.v200,
    required this.v300,
    required this.v400,
    required this.v500,
    required this.v600,
    required this.v700,
    required this.v800,
    required this.v900,
    required this.v950,
  });

  final Color v50;
  final Color v100;
  final Color v200;
  final Color v300;
  final Color v400;
  final Color v500;
  final Color v600;
  final Color v700;
  final Color v800;
  final Color v900;
  final Color v950;

  static ColorVariants initial() => ColorVariants(
        v50: const Color(0x00000000),
        v100: const Color(0x00000000),
        v200: const Color(0x00000000),
        v300: const Color(0x00000000),
        v400: const Color(0x00000000),
        v500: const Color(0x00000000),
        v600: const Color(0x00000000),
        v700: const Color(0x00000000),
        v800: const Color(0x00000000),
        v900: const Color(0x00000000),
        v950: const Color(0x00000000),
      );
}
