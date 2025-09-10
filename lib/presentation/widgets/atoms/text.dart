part of 'atoms.dart';

class BaseText extends StatelessWidget {
  const BaseText(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.style,
    this.maxLines,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.strong;

  final String data;
  final double? minFontSize;
  final double? maxFontSize;
  final TextStyle? style;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final TextOverflow? overflow;
  final TextStyleColor textStyleColor;
  final TextDecoration? decoration;

  const BaseText.base(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.base;

  const BaseText.soft(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.soft;

  const BaseText.subtle(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.subtle;

  const BaseText.disabled(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.disabled;

  const BaseText.invert(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.invert;

  const BaseText.noChangeStrong(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.noChangeStrong;

  const BaseText.noChangeSubtle(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.noChangeSubtle;

  const BaseText.primary(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.primary;

  const BaseText.secondary(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.secondary;

  const BaseText.tertiary(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.tertiary;

  const BaseText.success(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.success;

  const BaseText.warning(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.warning;

  const BaseText.informative(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.informative;

  const BaseText.error(
    this.data, {
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  }) : textStyleColor = TextStyleColor.error;

  const BaseText.withTextStyleColor(
    this.data, {
    required this.textStyleColor,
    this.minFontSize = 12,
    this.maxFontSize = double.infinity,
    this.maxLines,
    this.style,
    this.textAlign,
    this.textDirection,
    this.overflow,
    this.decoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppThemeColors theme = Theme.of(context).appColors;
    Color color = textStyleColor.getColor(theme);
    return AutoSizeText(
      data,
      minFontSize: minFontSize!,
      maxFontSize: maxFontSize!,
      style: style?.copyWith(
            color: color,
            decorationColor: color,
            decoration: decoration,
          ) ??
          TextStyle(
            color: color,
            decorationColor: color,
            decoration: decoration,
          ),
      maxLines: maxLines,
      textAlign: textAlign,
      textDirection: textDirection,
      overflow: overflow,
    );
  }
}
