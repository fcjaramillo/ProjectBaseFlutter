part of 'molecules.dart';

class TourInformationItem extends StatelessWidget {
  const TourInformationItem(
    this.text, {
    required this.total,
    required this.current,
    super.key,
  });

  final String text;
  final int total;
  final int current;

  @override
  Widget build(BuildContext context) {
    CustomThemeColors customThemeColors = Theme.of(
      context,
    ).extension<CustomThemeColors>()!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: CHRadius.r_3,
      ),
      child: Padding(
        padding: BasePadding.padding_16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BaseText(text, style: TypoBody.b2r),
            Spacing.spacingV24,
            Row(
              children: <Widget>[
                for (int i = 0; i < total; i++) ...<Widget>[
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: i == current - 1
                          ? colorScheme.primary
                          : customThemeColors.transparent,
                      borderRadius: CHRadius.circular,
                      border: Border.all(
                        color: i == current - 1
                            ? customThemeColors.transparent
                            : colorScheme.surfaceContainer,
                      ),
                    ),
                    child: SizedBox.square(
                      dimension: i == current - 1 ? 10 : 8,
                    ),
                  ),
                  if (i < total - 1) Spacing.spacingH12,
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
