part of 'molecules.dart';

class EmptyStateError extends StatelessWidget {
  const EmptyStateError({
    this.errorMessage,
    this.style,
    this.svg,
    this.textStyleColor,
    super.key,
  });

  final String? errorMessage;
  final TextStyle? style;
  final String? svg;
  final TextStyleColor? textStyleColor;
  @override
  Widget build(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      SvgPicture.asset(svg ?? Svgs.emptyState(Theme.of(context).brightness)),
      Spacing.spacingV24,
      BaseText.withTextStyleColor(
        textStyleColor: textStyleColor ?? TextStyleColor.soft,
        (errorMessage != null && errorMessage!.isNotEmpty)
            ? errorMessage!
            : L10n.of(context).gNoResultsFound,
        style:
            style ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        textAlign: TextAlign.center,
      ),
    ],
  );
}
