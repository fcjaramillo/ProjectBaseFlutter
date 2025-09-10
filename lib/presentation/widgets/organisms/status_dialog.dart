part of 'organisms.dart';

class StatusDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? buttonText;
  final IconData? icon;

  const StatusDialog({
    this.title,
    this.subtitle,
    this.buttonText,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CustomThemeColors customThemeColors =
        Theme.of(context).extension<CustomThemeColors>()!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Center(
      child: Padding(
        padding: BasePadding.defaultScreen,
        child: Material(
          color: colorScheme.surface,
          borderRadius: BaseRadius.r_2,
          child: Padding(
            padding: BasePadding.defaultScreen,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  width: double.infinity,
                ),
                Spacing.spacingV16,
                Icon(
                  icon ?? Iconsax.tick_circle,
                  size: Layout.spaceXXL,
                  color: customThemeColors.success,
                ),
                Spacing.spacingV24,
                BaseText(
                  title ?? L10n.of(context).gInserText,
                  style: TypoBody.b1s,
                ),
                Spacing.spacingV16,
                BaseText(
                  subtitle ?? L10n.of(context).gInserText,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
                Spacing.spacingV16,
                BasePrimaryButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  text: buttonText ?? L10n.of(context).gInserText,
                ),
                Spacing.spacingV16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
