part of 'organisms.dart';

class ExpandedHeadersDescription extends StatelessWidget {
  const ExpandedHeadersDescription({
    required this.firstHeader,
    required this.secondHeader,
    required this.firstDescription,
    required this.secondDescription,
    this.firstExtra,
    this.secondExtra,
    this.firstTrailingWidget,
    this.secondTrailingWidget,
    this.firstExtraVerticalWidget,
    this.secondExtraVerticalWidget,
    this.headerStyle,
    this.descriptionStyle,
    this.descriptionFlex = 1,
    this.firstDescriptionWithMaxLine = true,
    this.firstDescriptionMaxLines = 0,
    super.key,
  });

  final String firstHeader;
  final String secondHeader;
  final String firstDescription;
  final String secondDescription;
  final String? firstExtra;
  final String? secondExtra;
  final Widget? firstTrailingWidget;
  final Widget? secondTrailingWidget;
  final Widget? firstExtraVerticalWidget;
  final Widget? secondExtraVerticalWidget;
  final TextStyle? headerStyle;
  final TextStyle? descriptionStyle;
  final int descriptionFlex;
  final bool firstDescriptionWithMaxLine;
  final int firstDescriptionMaxLines;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: HeaderDescription(
              header: firstHeader,
              description: firstDescription,
              descriptionTrailingWidget: firstTrailingWidget,
              headerStyle: headerStyle ?? TypoBody.b2r,
              descriptionStyle: descriptionStyle ?? TypoBody.b2s,
              headerTextStyleColor: TextStyleColor.soft,
              descriptionTextStyleColor: TextStyleColor.strong,
              headerMaxLines: 2,
              descriptionFlex: descriptionFlex,
              extraVerticalWidget: firstExtraVerticalWidget,
              extra: firstExtra,
              spacing: Spacing.spacingV2,
              descriptionWithMaxLine: firstDescriptionWithMaxLine,
              descriptionMaxLines: firstDescriptionMaxLines,
            ),
          ),
          Spacing.spacingH4,
          Expanded(
            child: HeaderDescription(
              header: secondHeader,
              description: secondDescription,
              descriptionTrailingWidget: secondTrailingWidget,
              headerStyle: headerStyle ?? TypoBody.b2r,
              descriptionStyle: descriptionStyle ?? TypoBody.b2s,
              headerTextStyleColor: TextStyleColor.soft,
              descriptionTextStyleColor: TextStyleColor.strong,
              headerMaxLines: 2,
              descriptionFlex: descriptionFlex,
              extraVerticalWidget: secondExtraVerticalWidget,
              extra: secondExtra,
              spacing: Spacing.spacingV2,
            ),
          ),
        ],
      );
}
