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

  const BaseText._internal(
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

  factory BaseText.base(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.base,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.soft(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.soft,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.subtle(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.subtle,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.disabled(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.disabled,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.invert(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.invert,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.noChangeStrong(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.noChangeStrong,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.noChangeSubtle(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.noChangeSubtle,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.primary(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.primary,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.secondary(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.secondary,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.tertiary(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.tertiary,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.success(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.success,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.warning(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.warning,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.informative(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.informative,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

  factory BaseText.error(
    String data, {
    double minFontSize = 12,
    double maxFontSize = double.infinity,
    int? maxLines,
    TextStyle? style,
    TextAlign? textAlign,
    TextDirection? textDirection,
    TextOverflow? overflow,
    TextDecoration? decoration,
    Key? key,
  }) => BaseText._internal(
    data,
    textStyleColor: TextStyleColor.error,
    minFontSize: minFontSize,
    maxFontSize: maxFontSize,
    maxLines: maxLines,
    style: style,
    textAlign: textAlign,
    textDirection: textDirection,
    overflow: overflow,
    decoration: decoration,
    key: key,
  );

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
    Color color = TextStyleColor.getColor(theme, textStyleColor);
    return AutoSizeText(
      data,
      minFontSize: minFontSize!,
      maxFontSize: maxFontSize!,
      style:
          style?.copyWith(
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
