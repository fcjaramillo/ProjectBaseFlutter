part of 'atoms.dart';

class BaseIcon extends StatelessWidget {
  const BaseIcon({
    required this.icon,
    this.iconColor,
    this.backgroundColor,
    this.iconSize,
    this.iconBackgroundRadius,
    this.border,
    this.padding,
    super.key,
  });

  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? iconSize;
  final double? iconBackgroundRadius;
  final BoxBorder? border;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: backgroundColor ?? Theme.of(context).appColors.neutral.soft,
      borderRadius: BorderRadius.circular(
        iconBackgroundRadius ?? Layout.spaceXXXL,
      ),
      border:
          border ?? Border.all(color: Theme.of(context).appColors.transparent),
    ),
    child: Padding(
      padding: padding ?? BasePadding.padding_8,
      child: Icon(
        icon,
        size: iconSize ?? Layout.spaceXL,
        color: iconColor ?? Theme.of(context).appColors.icon.scale.strong,
      ),
    ),
  );
}
