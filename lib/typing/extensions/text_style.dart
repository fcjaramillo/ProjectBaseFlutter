part of 'extensions.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get letterSpacingXS => copyWith(
        letterSpacing: -1,
      );

  TextStyle get letterSpacingS => copyWith(
        letterSpacing: -0.5,
      );

  TextStyle get letterSpacingM => copyWith(
        letterSpacing: 0.5,
      );

  TextStyle get letterSpacingNone => copyWith(
        letterSpacing: 0,
      );

  TextStyle get regular => copyWith(
        fontWeight: FontWeight.w400,
        fontFamily: FontFamily.regular,
      );

  TextStyle get semibold => copyWith(
        fontWeight: CustomFontWeight.semibold,
        fontFamily: FontFamily.semibold,
      );
}
