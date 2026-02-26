part of 'molecules.dart';

class HeaderRichText extends StatelessWidget {
  const HeaderRichText({
    required this.header,
    required this.richPrimary,
    required this.richSecondary,
    this.richPrimaryColor,
    this.richSecondaryColor,
    this.spacing,
    this.headerMaxLines,
    this.extraVerticalWidget,
    this.headerStyle,
    this.richPrimaryStyle,
    this.richSecondaryStyle,
    this.previousTextHasSpace,
    super.key,
  });

  final String header;
  final String richPrimary;
  final String richSecondary;
  final Color? richPrimaryColor;
  final Color? richSecondaryColor;
  final Widget? spacing;
  final int? headerMaxLines;
  final Widget? extraVerticalWidget;
  final TextStyle? headerStyle;
  final TextStyle? richPrimaryStyle;
  final TextStyle? richSecondaryStyle;
  final bool? previousTextHasSpace;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      BaseText.withTextStyleColor(
        header,
        textStyleColor: TextStyleColor.soft,
        style: headerStyle ?? TypoSecondary.b2r,
        overflow: TextOverflow.ellipsis,
        maxLines: headerMaxLines ?? 1,
      ),
      spacing ?? Spacing.spacingV2,
      BaseRichText(
        previousTextHasSpace: previousTextHasSpace,
        textPrimary: richPrimary,
        textSecondary: richSecondary,
        stylePrimary: richPrimaryStyle ?? TypoSecondary.b2s,
        styleSecondary: richSecondaryStyle ?? TypoSecondary.b3r,
        colorPrimary:
            richPrimaryColor ?? Theme.of(context).colorScheme.onSurface,
        colorSecondary:
            richSecondaryColor ?? Theme.of(context).colorScheme.onSurface,
      ),
      if (extraVerticalWidget != null) extraVerticalWidget!,
    ],
  );
}
