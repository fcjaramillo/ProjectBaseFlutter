part of 'atoms.dart';

class CardIconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onTap;
  final bool isHorizontal;
  final bool isSelected;

  const CardIconText.horizontal({
    required this.icon,
    required this.text,
    this.isSelected = false,
    this.onTap,
    super.key,
  }) : isHorizontal = true;

  const CardIconText.vertical({
    required this.text,
    this.icon = Icons.home_mini,
    this.onTap,
    this.isSelected = false,
    super.key,
  }) : isHorizontal = false;

  @override
  Widget build(BuildContext context) {
    final CustomThemeColors customThemeColors =
        Theme.of(context).extension<CustomThemeColors>()!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color:
                isSelected ? colorScheme.outline : colorScheme.surfaceContainer,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(Layout.spaceXS),
          ),
        ),
        child: Visibility(
          visible: isHorizontal,
          replacement: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Layout.spaceS,
              vertical: Layout.spaceXS,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                BaseText(
                  text,
                  style: TypoCaption.c1,
                ),
                Spacing.spacingH8,
                Icon(
                  icon,
                  color: isSelected
                      ? customThemeColors.warningAccent
                      : colorScheme.surfaceContainerHigh,
                  size: Layout.spaceL,
                ),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: Layout.spaceS,
              left: Layout.spaceM,
              right: Layout.spaceL,
              top: Layout.spaceS,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  icon,
                ),
                Spacing.spacingV12,
                BaseText(
                  text,
                  style: TypoCaption.c1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
