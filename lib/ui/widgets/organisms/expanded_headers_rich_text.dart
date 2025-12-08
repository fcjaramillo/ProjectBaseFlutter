part of 'organisms.dart';

class ExpandedHeadersRichText extends StatelessWidget {
  const ExpandedHeadersRichText({
    required this.firstHeader,
    required this.secondHeader,
    required this.firstRichPrimary,
    required this.secondRichPrimary,
    this.firstRichSecondary,
    this.secondRichSecondary,
    this.firstExtraVerticalWidget,
    this.secondExtraVerticalWidget,
    this.headerStyle,
    this.richPrimaryStyle,
    this.richSecondaryStyle,
    super.key,
  });

  final String firstHeader;
  final String secondHeader;
  final String firstRichPrimary;
  final String? firstRichSecondary;
  final String secondRichPrimary;
  final String? secondRichSecondary;
  final Widget? firstExtraVerticalWidget;
  final Widget? secondExtraVerticalWidget;
  final TextStyle? headerStyle;
  final TextStyle? richPrimaryStyle;
  final TextStyle? richSecondaryStyle;

  @override
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: HeaderRichText(
              header: firstHeader,
              richPrimary: firstRichPrimary,
              richSecondary: firstRichSecondary ?? kEmptyString,
              headerMaxLines: 2,
              extraVerticalWidget: firstExtraVerticalWidget,
              headerStyle: headerStyle,
              richPrimaryStyle: richPrimaryStyle,
              richSecondaryStyle: richSecondaryStyle,
            ),
          ),
          Spacing.spacingH4,
          Expanded(
            child: HeaderRichText(
              header: secondHeader,
              richPrimary: secondRichPrimary,
              richSecondary: secondRichSecondary ?? kEmptyString,
              headerMaxLines: 2,
              extraVerticalWidget: secondExtraVerticalWidget,
              headerStyle: headerStyle,
              richPrimaryStyle: richPrimaryStyle,
              richSecondaryStyle: richSecondaryStyle,
            ),
          ),
        ],
      );
}
