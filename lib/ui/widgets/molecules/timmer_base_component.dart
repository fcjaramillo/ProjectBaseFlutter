part of 'molecules.dart';

class TimerBaseComponent extends StatelessWidget {
  const TimerBaseComponent({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    CustomThemeColors customThemeColors = Theme.of(
      context,
    ).extension<CustomThemeColors>()!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: CHRadius.circular,
          color: colorScheme.surface,
          border: Border.all(color: colorScheme.surfaceContainerLow),
        ),
        child: Padding(
          padding: BasePadding.paddingH16V8,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                Iconsax.clock,
                color: customThemeColors.info,
                size: Layout.spaceML,
              ),
              Spacing.spacingH12,
              BaseText(text, style: TypoBody.b3r),
            ],
          ),
        ),
      ),
    );
  }
}
