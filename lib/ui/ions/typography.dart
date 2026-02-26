part of 'ions.dart';

class TypoPrimary {
  const TypoPrimary._();

  static TextStyle get h1 => _base.copyWith(
    fontSize: FontSize.s64,
    height: FontLineHeight.h72 / FontSize.s64,
  );

  static TextStyle get h2 => _base.copyWith(
    fontSize: FontSize.s48,
    height: FontLineHeight.h56 / FontSize.s48,
  );

  static TextStyle get h3 => _base.copyWith(
    fontSize: FontSize.s36,
    height: FontLineHeight.h44 / FontSize.s36,
    letterSpacing: LetterSpacing.s,
  );

  static TextStyle get h4 => _base.copyWith(
    fontSize: FontSize.s28,
    height: FontLineHeight.h36 / FontSize.s28,
    letterSpacing: LetterSpacing.s,
  );

  static TextStyle get _base => GoogleFonts.montserrat();
}

class TypoSubtitles {
  const TypoSubtitles._();

  static TextStyle get s1 => _base.copyWith(
    fontSize: FontSize.s20,
    height: FontLineHeight.h28 / FontSize.s20,
  );

  static TextStyle get s2 => _base.copyWith(
    fontSize: FontSize.s18,
    height: FontLineHeight.h26 / FontSize.s18,
  );

  static TextStyle get s3 => _base.copyWith(
    fontSize: FontSize.s16,
    height: FontLineHeight.h24 / FontSize.s16,
  );

  static TextStyle get s4 => _base.copyWith(
    fontSize: FontSize.s14,
    height: FontLineHeight.h22 / FontSize.s14,
    letterSpacing: LetterSpacing.m,
  );

  static TextStyle get _base => GoogleFonts.playfairDisplay();
}

class TypoSecondary {
  const TypoSecondary._();

  static TextStyle get b1r => _base.copyWith(
    fontSize: FontSize.s24,
    height: FontLineHeight.h32 / FontSize.s24,
  );

  static TextStyle get b2r => _base.copyWith(
    fontSize: FontSize.s20,
    height: FontLineHeight.h28 / FontSize.s20,
  );

  static TextStyle get b3r => _base.copyWith(
    fontSize: FontSize.s16,
    height: FontLineHeight.h24 / FontSize.s16,
  );
  static TextStyle get b4r => _base.copyWith(
    fontSize: FontSize.s14,
    height: FontLineHeight.h20 / FontSize.s14,
  );
  static TextStyle get b5r => _base.copyWith(
    fontSize: FontSize.s12,
    height: FontLineHeight.h16 / FontSize.s12,
  );

  static TextStyle get b1s => _baseSemibold.copyWith(
    fontSize: FontSize.s16,
    height: FontLineHeight.h24 / FontSize.s16,
  );

  static TextStyle get b2s => _baseSemibold.copyWith(
    fontSize: FontSize.s14,
    height: FontLineHeight.h20 / FontSize.s14,
  );

  static TextStyle get b3s => _baseSemibold.copyWith(
    fontSize: FontSize.s12,
    height: FontLineHeight.h16 / FontSize.s12,
  );

  static TextStyle get _base => GoogleFonts.poppins(
    fontWeight: CustomFontWeight.regular,
    letterSpacing: LetterSpacing.none,
  );

  static TextStyle get _baseSemibold => GoogleFonts.poppins(
    fontWeight: CustomFontWeight.semibold,
    letterSpacing: LetterSpacing.none,
  );
}

class TypoButton {
  const TypoButton._();

  static TextStyle get b1 => _base.copyWith(
    fontSize: FontSize.s16,
    height: FontLineHeight.h24 / FontSize.s16,
  );

  static TextStyle get b2 => _base.copyWith(
    fontSize: FontSize.s14,
    height: FontLineHeight.h20 / FontSize.s14,
  );

  static TextStyle get b3 => _base.copyWith(
    fontSize: FontSize.s12,
    height: FontLineHeight.h16 / FontSize.s12,
  );

  static final TextStyle _base = TextStyle(
    fontFamily: FontFamily.semibold,
    fontWeight: CustomFontWeight.semibold,
    letterSpacing: LetterSpacing.none,
  );
}

class TypoCaption {
  const TypoCaption._();

  static TextStyle get c1 => _base.copyWith(
    fontSize: FontSize.s12,
    height: FontLineHeight.h16 / FontSize.s12,
  );

  static TextStyle get c2 => _base.copyWith(
    fontSize: FontSize.s10,
    height: FontLineHeight.h14 / FontSize.s10,
  );

  static TextStyle get _base => TextStyle(
    fontFamily: FontFamily.regular,
    fontWeight: CustomFontWeight.regular,
    letterSpacing: LetterSpacing.none,
  );
}

class TypoLink {
  const TypoLink._();

  static TextStyle get l => _base.copyWith(
    fontSize: FontSize.s16,
    height: FontLineHeight.h24 / FontSize.s16,
  );

  static TextStyle get m => _base.copyWith(
    fontSize: FontSize.s14,
    height: FontLineHeight.h20 / FontSize.s14,
  );

  static TextStyle get s => _base.copyWith(
    fontSize: FontSize.s12,
    height: FontLineHeight.h16 / FontSize.s12,
  );

  static TextStyle get xs => _base.copyWith(
    fontSize: FontSize.s10,
    height: FontLineHeight.h14 / FontSize.s10,
  );

  static TextStyle get _base => TextStyle(
    fontFamily: FontFamily.semibold,
    fontWeight: CustomFontWeight.semibold,
    letterSpacing: LetterSpacing.none,
    decoration: TextDecoration.underline,
  );
}

final TextTheme textTheme = TextTheme(
  displayLarge: TypoPrimary.h1,
  displayMedium: TypoPrimary.h2,
  displaySmall: TypoPrimary.h3,
  headlineLarge: TypoPrimary.h2,
  headlineMedium: TypoPrimary.h3,
  headlineSmall: TypoPrimary.h4,
  titleLarge: TypoSubtitles.s1,
  titleMedium: TypoSubtitles.s2,
  titleSmall: TypoSubtitles.s3,
  bodyLarge: TypoSecondary.b1r,
  bodyMedium: TypoSecondary.b2r,
  bodySmall: TypoSecondary.b3r,
  labelLarge: TypoSecondary.b2r,
  labelMedium: TypoCaption.c1,
  labelSmall: TypoCaption.c2,
);
