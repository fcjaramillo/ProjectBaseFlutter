part of 'molecules.dart';

class ItemNavBar extends StatelessWidget {
  final bool isSelect;
  final IconData icon;
  final GestureTapCallback onTap;
  final double? iconSize;
  final double? iconBackgroundRadius;
  final Color? iconColor;
  final Color? backgroundColor;

  const ItemNavBar({
    required this.isSelect,
    required this.icon,
    required this.onTap,
    this.iconSize = Layout.spaceL,
    this.iconBackgroundRadius = Layout.spaceS,
    this.iconColor,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: BaseIcon(
      icon: icon,
      iconSize: iconSize,
      iconBackgroundRadius: iconBackgroundRadius,
      backgroundColor: isSelect
          ? backgroundColor ?? const Color(0xFFF8E7F2)
          : Theme.of(context).extension<CustomThemeColors>()!.transparent,
      iconColor: isSelect ? iconColor ?? const Color(0xFFB8538E) : null,
    ),
  );
}
