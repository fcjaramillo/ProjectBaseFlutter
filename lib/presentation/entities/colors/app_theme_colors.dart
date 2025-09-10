part of '../entities.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.success,
    required this.informative,
    required this.warning,
    required this.error,
    required this.neutral,
    required this.neutralNoChange,
    required this.opacity,
    required this.highContrast,
    required this.lowContrast,
    required this.text,
    required this.border,
    required this.icon,
    required this.button,
    required this.searchBar,
  });

  final ColorScale primary;
  final ColorScale secondary;
  final ColorScale tertiary;
  final ColorContrast success;
  final ColorContrast informative;
  final ColorContrast warning;
  final ColorContrast error;
  final ColorScale neutral;
  final ColorContrast neutralNoChange;
  final ColorBase opacity;
  final ColorStates highContrast;
  final ColorStates lowContrast;
  final ColorForeground text;
  final ColorForeground border;
  final ColorIconForeground icon;
  final ColorButton button;
  final ColorSearchBar searchBar;

  @override
  AppThemeColors lerp(ThemeExtension<AppThemeColors>? other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return this;
  }

  @override
  AppThemeColors copyWith({
    ColorScale? primary,
    ColorScale? secondary,
    ColorScale? tertiary,
    ColorContrast? success,
    ColorContrast? informative,
    ColorContrast? warning,
    ColorContrast? error,
    ColorScale? neutral,
    ColorContrast? neutralNoChange,
    ColorBase? opacity,
    ColorStates? highContrast,
    ColorStates? lowContrast,
    ColorForeground? text,
    ColorForeground? border,
    ColorIconForeground? icon,
    ColorButton? button,
    ColorSearchBar? searchBar,
  }) =>
      this;
}
