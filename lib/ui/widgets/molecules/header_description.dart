part of 'molecules.dart';

class HeaderDescription extends StatelessWidget {
  const HeaderDescription({
    required this.header,
    required this.description,
    this.extra,
    this.headerStyle,
    this.headerTextStyleColor,
    this.descriptionStyle,
    this.descriptionTextStyleColor,
    this.descriptionTrailingWidget,
    this.spacing,
    this.extraVerticalWidget,
    this.descriptionFlex = 0,
    this.descriptionWithMaxLine = true,
    this.descriptionMaxLines = 0,
    this.headerMaxLines,
    this.alignment,
    super.key,
  });

  HeaderDescription.hC2({
    required this.header,
    required this.description,
    this.extra,
    this.descriptionStyle,
    this.descriptionTextStyleColor,
    this.descriptionTrailingWidget,
    this.spacing,
    this.extraVerticalWidget,
    this.descriptionFlex = 0,
    this.descriptionWithMaxLine = true,
    this.descriptionMaxLines = 0,
    this.headerMaxLines,
    this.alignment,
    super.key,
  }) : headerStyle = TypoCaption.c2,
       headerTextStyleColor = TextStyleColor.subtle;

  HeaderDescription.sBody2({
    required this.header,
    required this.description,
    this.extra,
    this.descriptionStyle,
    this.descriptionTextStyleColor,
    this.descriptionTrailingWidget,
    this.spacing,
    this.extraVerticalWidget,
    this.descriptionFlex = 0,
    this.descriptionWithMaxLine = true,
    this.descriptionMaxLines = 0,
    this.headerMaxLines,
    this.alignment,
    super.key,
  }) : headerStyle = TypoSecondary.b2s,
       headerTextStyleColor = TextStyleColor.subtle;

  HeaderDescription.body2({
    required this.header,
    required this.description,
    this.extra,
    this.descriptionTrailingWidget,
    this.spacing,
    this.extraVerticalWidget,
    this.descriptionFlex = 0,
    this.descriptionWithMaxLine = true,
    this.descriptionMaxLines = 0,
    this.headerMaxLines,
    this.alignment,
    super.key,
  }) : headerStyle = TypoSecondary.b2r,
       headerTextStyleColor = TextStyleColor.soft,
       descriptionStyle = TypoSecondary.b2s,
       descriptionTextStyleColor = TextStyleColor.strong;

  final String header;
  final String description;
  final String? extra;
  final TextStyle? headerStyle;
  final TextStyleColor? headerTextStyleColor;
  final TextStyle? descriptionStyle;
  final TextStyleColor? descriptionTextStyleColor;
  final Widget? descriptionTrailingWidget;
  final Widget? spacing;
  final Widget? extraVerticalWidget;
  final int descriptionFlex;
  final bool descriptionWithMaxLine;
  final int descriptionMaxLines;
  final int? headerMaxLines;
  final CrossAxisAlignment? alignment;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: alignment ?? CrossAxisAlignment.start,
    children: <Widget>[
      BaseText.withTextStyleColor(
        header,
        textStyleColor: headerTextStyleColor ?? TextStyleColor.soft,
        style:
            headerStyle ?? TypoSecondary.b3s.copyWith(fontSize: Layout.spaceML),
        overflow: TextOverflow.ellipsis,
        minFontSize: headerStyle?.fontSize ?? Layout.spaceML,
        maxLines: headerMaxLines ?? 1,
      ),
      spacing ?? Spacing.spacingV4,
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: descriptionFlex,
            child: BaseText.withTextStyleColor(
              description,
              textStyleColor:
                  descriptionTextStyleColor ?? TextStyleColor.strong,
              style: descriptionStyle ?? TypoSecondary.b2r,
              overflow: descriptionWithMaxLine || descriptionMaxLines > 0
                  ? TextOverflow.ellipsis
                  : TextOverflow.visible,
              minFontSize: descriptionStyle?.fontSize ?? Layout.spaceML,
              maxLines: descriptionWithMaxLine
                  ? 1
                  : descriptionMaxLines > 0
                  ? descriptionMaxLines
                  : null,
            ),
          ),
          if (descriptionTrailingWidget != null) ...<Widget>[
            Spacing.spacingH8,
            descriptionTrailingWidget ?? const SizedBox.shrink(),
          ],
        ],
      ),
      if (extra != null) ...<Widget>[
        Spacing.spacingV12,
        BaseText.soft(extra!, style: TypoCaption.c1),
      ],
      if (extraVerticalWidget != null) ...<Widget>[extraVerticalWidget!],
    ],
  );
}
