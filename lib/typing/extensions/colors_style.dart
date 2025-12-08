part of 'extensions.dart';

enum TextStyleColor {
  strong,
  base,
  soft,
  subtle,
  disabled,
  invert,
  noChangeStrong,
  noChangeSubtle,
  primary,
  secondary,
  tertiary,
  success,
  warning,
  informative,
  error,
}

extension TextStyleColorExtension on TextStyleColor {
  Color getColor(AppThemeColors theme) {
    switch (this) {
      case TextStyleColor.strong:
        return theme.text.scale.strong;
      case TextStyleColor.base:
        return theme.text.scale.base;
      case TextStyleColor.soft:
        return theme.text.scale.soft;
      case TextStyleColor.subtle:
        return theme.text.scale.subtle;
      case TextStyleColor.disabled:
        return theme.text.scale.disabled;
      case TextStyleColor.invert:
        return theme.text.scale.invert;
      case TextStyleColor.primary:
        return theme.text.main.primary;
      case TextStyleColor.secondary:
        return theme.text.main.secondary;
      case TextStyleColor.tertiary:
        return theme.text.main.tertiary;
      case TextStyleColor.success:
        return theme.text.feedbacks.success;
      case TextStyleColor.error:
        return theme.text.feedbacks.error;
      case TextStyleColor.informative:
        return theme.text.feedbacks.informative;
      case TextStyleColor.warning:
        return theme.text.feedbacks.warning;
      case TextStyleColor.noChangeStrong:
        return theme.text.noChange.strong;
      case TextStyleColor.noChangeSubtle:
        return theme.text.noChange.subtle;
    }
  }
}
