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
  error;

  static Color getColor(AppThemeColors theme, TextStyleColor textStyleColor) =>
      switch (textStyleColor) {
        TextStyleColor.strong => theme.text.scale.strong,
        TextStyleColor.base => theme.text.scale.base,
        TextStyleColor.soft => theme.text.scale.soft,
        TextStyleColor.subtle => theme.text.scale.subtle,
        TextStyleColor.disabled => theme.text.scale.disabled,
        TextStyleColor.invert => theme.text.scale.invert,
        TextStyleColor.primary => theme.primary.strong,
        TextStyleColor.secondary => theme.text.main.secondary,
        TextStyleColor.tertiary => theme.text.main.tertiary,
        TextStyleColor.success => theme.text.feedbacks.success,
        TextStyleColor.error => theme.text.feedbacks.error,
        TextStyleColor.informative => theme.text.feedbacks.informative,
        TextStyleColor.warning => theme.text.feedbacks.warning,
        TextStyleColor.noChangeStrong => theme.text.noChange.strong,
        TextStyleColor.noChangeSubtle => theme.text.noChange.subtle,
      };
}
