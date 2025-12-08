part of 'ions.dart';

class LetterSpacing {
  const LetterSpacing._();

  static const double none = 0;
  static const double xs = -1;
  static const double s = -0.5;
  static const double m = 0.5;
}

class FontSize {
  const FontSize._();

  static const double s10 = 10;
  static const double s12 = 12;
  static const double s14 = 14;
  static const double s16 = 16;
  static const double s18 = 18;
  static const double s20 = 20;
  static const double s24 = 24;
  static const double s28 = 28;
  static const double s32 = 32;
  static const double s36 = 36;
  static const double s40 = 40;
  static const double s48 = 48;
  static const double s56 = 56;
  static const double s64 = 64;
}

class FontLineHeight {
  const FontLineHeight._();

  static const double h10 = 10;
  static const double h11 = 11;
  static const double h12 = 12;
  static const double h14 = 14;
  static const double h16 = 16;
  static const double h18 = 18;
  static const double h20 = 20;
  static const double h22 = 22;
  static const double h24 = 24;
  static const double h26 = 26;
  static const double h28 = 28;
  static const double h32 = 32;
  static const double h36 = 36;
  static const double h40 = 40;
  static const double h44 = 44;
  static const double h48 = 48;
  static const double h56 = 56;
  static const double h64 = 64;
}

class CustomFontWeight {
  const CustomFontWeight._();

  static FontWeight get regular => FontWeight.w400;
  static FontWeight get semibold => FontWeight.w600;
}

class FontFamily {
  const FontFamily._();

  static const String regular = 'packages/ui/PoppinsRegular';
  static const String semibold = 'packages/ui/PoppinsSemibold';
}
