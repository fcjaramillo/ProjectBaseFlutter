part of 'atoms.dart';

class BaseCheckBox extends StatelessWidget {
  final Color? backgroundColor;

  const BaseCheckBox(
    this.value, {
    required this.onTap,
    this.backgroundColor,
    super.key,
  });

  final bool value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    CustomThemeColors customThemeColors =
        Theme.of(context).extension<CustomThemeColors>()!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: value
              ? colorScheme.onSurface
              : backgroundColor ?? customThemeColors.transparent,
          borderRadius: BaseRadius.r_1,
          border: Border.all(
            color:
                value ? colorScheme.outline : colorScheme.surfaceContainerLow,
          ),
        ),
        child: SizedBox.square(
          dimension: Layout.spaceL,
          child: Icon(
            Icons.done,
            color: value
                ? colorScheme.onInverseSurface
                : customThemeColors.transparent,
            size: Layout.spaceML + Layout.spaceXXS,
          ),
        ),
      ),
    );
  }
}
