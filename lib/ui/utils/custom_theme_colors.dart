part of 'utils.dart';

@immutable
class CustomThemeColors extends ThemeExtension<CustomThemeColors> {
  final Color transparent;
  final Color success;
  final Color successOpacity;
  final Color info;
  final Color infoOpacity;
  final Color infoAccent;
  final Color warning;
  final Color warningOpacity;
  final Color warningAccent;
  final Color dark;
  final Color light;

  const CustomThemeColors({
    required this.transparent,
    required this.success,
    required this.successOpacity,
    required this.info,
    required this.infoOpacity,
    required this.infoAccent,
    required this.warning,
    required this.warningOpacity,
    required this.warningAccent,
    required this.dark,
    required this.light,
  });

  @override
  CustomThemeColors copyWith({
    Color? transparent,
    Color? success,
    Color? successOpacity,
    Color? info,
    Color? infoOpacity,
    Color? infoAccent,
    Color? warning,
    Color? warningOpacity,
    Color? warningAccent,
    Color? dark,
    Color? light,
  }) =>
      CustomThemeColors(
        transparent: transparent ?? this.transparent,
        success: success ?? this.success,
        successOpacity: successOpacity ?? this.successOpacity,
        info: info ?? this.info,
        infoOpacity: infoOpacity ?? this.infoOpacity,
        infoAccent: infoAccent ?? this.infoAccent,
        warning: warning ?? this.warning,
        warningOpacity: warningOpacity ?? this.warningOpacity,
        warningAccent: warningAccent ?? this.warningAccent,
        dark: dark ?? this.dark,
        light: light ?? this.light,
      );

  @override
  CustomThemeColors lerp(ThemeExtension<CustomThemeColors>? other, double t) {
    if (other is! CustomThemeColors) {
      return this;
    }
    return CustomThemeColors(
      transparent: Color.lerp(transparent, other.transparent, t)!,
      success: Color.lerp(success, other.success, t)!,
      successOpacity: Color.lerp(successOpacity, other.successOpacity, t)!,
      info: Color.lerp(info, other.info, t)!,
      infoOpacity: Color.lerp(infoOpacity, other.infoOpacity, t)!,
      infoAccent: Color.lerp(infoAccent, other.infoAccent, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      warningOpacity: Color.lerp(warningOpacity, other.warningOpacity, t)!,
      warningAccent: Color.lerp(warningAccent, other.warningAccent, t)!,
      dark: Color.lerp(dark, other.dark, t)!,
      light: Color.lerp(light, other.light, t)!,
    );
  }
}
