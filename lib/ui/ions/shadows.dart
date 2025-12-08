part of 'ions.dart';

class Shadows {
  const Shadows._();

  static BoxShadow get black10 => const BoxShadow(
        offset: Offset(0, 20),
        blurRadius: 50,
      );

  static BoxShadow get black30 => const BoxShadow(
        offset: Offset(0, 10),
        blurRadius: 35,
        spreadRadius: 0.8,
      );

  static BoxShadow get shadow2 => const BoxShadow(
        blurRadius: 30,
      );

  static BoxShadow get shadow3 => const BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 10,
      );
}
