part of 'atoms.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon({
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    this.iconBackgroundRadius,
    super.key,
  });

  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize;
  final double? iconBackgroundRadius;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor ??
              Theme.of(context).colorScheme.surfaceContainerLowest,
          borderRadius: BorderRadius.circular(
            iconBackgroundRadius ?? Layout.spaceXXXL,
          ),
          border: Border.all(
            color:
                Theme.of(context).extension<CustomThemeColors>()!.transparent,
          ),
        ),
        child: Padding(
          padding: BasePadding.padding_8,
          child: Icon(
            icon,
            size: iconSize ?? Layout.spaceXL,
            color: iconColor ?? Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
}
