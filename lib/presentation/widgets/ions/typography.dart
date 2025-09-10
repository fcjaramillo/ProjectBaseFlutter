part of 'ions.dart';

class TypoHeadings {
  const TypoHeadings._();

  static TextStyle get h1 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s36,
          height: FontLineHeight.h44 / FontSize.s36,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s48,
          height: FontLineHeight.h56 / FontSize.s48,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s56,
          height: FontLineHeight.h64 / FontSize.s56,
        );
    }
  }

  static TextStyle get h2 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s28,
          height: FontLineHeight.h36 / FontSize.s28,
          letterSpacing: LetterSpacing.s,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s36,
          height: FontLineHeight.h44 / FontSize.s36,
          letterSpacing: LetterSpacing.s,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s48,
          height: FontLineHeight.h56 / FontSize.s48,
          letterSpacing: LetterSpacing.s,
        );
    }
  }

  static TextStyle get h3 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s24,
          height: FontLineHeight.h32 / FontSize.s24,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s28,
          height: FontLineHeight.h36 / FontSize.s28,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s40,
          height: FontLineHeight.h48 / FontSize.s40,
        );
    }
  }

  static TextStyle get h4 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s20,
          height: FontLineHeight.h28 / FontSize.s20,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s24,
          height: FontLineHeight.h32 / FontSize.s24,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s32,
          height: FontLineHeight.h40 / FontSize.s32,
        );
    }
  }

  static TextStyle get _base => TextStyle(
        fontFamily: FontFamily.semibold,
        fontWeight: CustomFontWeight.semibold,
        letterSpacing: LetterSpacing.none,
      );
}

class TypoSubtitles {
  const TypoSubtitles._();

  static TextStyle get s1 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s18,
          height: FontLineHeight.h26 / FontSize.s18,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s20,
          height: FontLineHeight.h28 / FontSize.s20,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s28,
          height: FontLineHeight.h36 / FontSize.s28,
        );
    }
  }

  static TextStyle get s2 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s18,
          height: FontLineHeight.h26 / FontSize.s18,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s24,
          height: FontLineHeight.h32 / FontSize.s24,
        );
    }
  }

  static TextStyle get s3 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h22 / FontSize.s14,
          letterSpacing: LetterSpacing.m,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
          letterSpacing: LetterSpacing.m,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s20,
          height: FontLineHeight.h28 / FontSize.s20,
          letterSpacing: LetterSpacing.m,
        );
    }
  }

  static TextStyle get _base => TextStyle(
        fontFamily: FontFamily.semibold,
        fontWeight: CustomFontWeight.semibold,
        letterSpacing: LetterSpacing.none,
      );
}

class TypoBody {
  const TypoBody._();

  static TextStyle get b1r {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
    }
  }

  static TextStyle get b2r {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h20 / FontSize.s14,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h20 / FontSize.s14,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h20 / FontSize.s14,
        );
    }
  }

  static TextStyle get b3r {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s12,
          height: FontLineHeight.h16 / FontSize.s12,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s12,
          height: FontLineHeight.h16 / FontSize.s12,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s12,
          height: FontLineHeight.h16 / FontSize.s12,
        );
    }
  }

  static TextStyle get b1s {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
      case FontDeviceSize.medium:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
      case FontDeviceSize.large:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
    }
  }

  static TextStyle get b2s {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h20 / FontSize.s14,
        );
      case FontDeviceSize.medium:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h20 / FontSize.s14,
        );
      case FontDeviceSize.large:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s14,
          height: FontLineHeight.h20 / FontSize.s14,
        );
    }
  }

  static TextStyle get b3s {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s12,
          height: FontLineHeight.h16 / FontSize.s12,
        );
      case FontDeviceSize.medium:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s12,
          height: FontLineHeight.h16 / FontSize.s12,
        );
      case FontDeviceSize.large:
        return _baseSemibold.copyWith(
          fontSize: FontSize.s12,
          height: FontLineHeight.h16 / FontSize.s12,
        );
    }
  }

  static TextStyle get _base => TextStyle(
        fontFamily: FontFamily.regular,
        fontWeight: CustomFontWeight.regular,
        letterSpacing: LetterSpacing.none,
      );

  static TextStyle get _baseSemibold => TextStyle(
        fontFamily: FontFamily.semibold,
        fontWeight: CustomFontWeight.semibold,
        letterSpacing: LetterSpacing.none,
      );
}

class TypoButton {
  const TypoButton._();

  static TextStyle get b1 {
    switch (EnvVariables.instance.deviceSize) {
      case FontDeviceSize.small:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h14 / FontSize.s16,
        );
      case FontDeviceSize.medium:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h14 / FontSize.s16,
        );
      case FontDeviceSize.large:
        return _base.copyWith(
          fontSize: FontSize.s16,
          height: FontLineHeight.h24 / FontSize.s16,
        );
    }
  }

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
  displayLarge: TypoHeadings.h1,
  displayMedium: TypoHeadings.h2,
  displaySmall: TypoHeadings.h3,
  headlineLarge: TypoHeadings.h2,
  headlineMedium: TypoHeadings.h3,
  headlineSmall: TypoHeadings.h4,
  titleLarge: TypoSubtitles.s1,
  titleMedium: TypoSubtitles.s2,
  titleSmall: TypoSubtitles.s3,
  bodyLarge: TypoBody.b1r,
  bodyMedium: TypoBody.b2r,
  bodySmall: TypoBody.b3r,
  labelLarge: TypoBody.b2r,
  labelMedium: TypoCaption.c1,
  labelSmall: TypoCaption.c2,
);
