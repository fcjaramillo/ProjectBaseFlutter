part of 'atoms.dart';

class BaseListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final double? horizontalTitleGap;
  final double? minTileHeight;
  final EdgeInsetsGeometry contentPadding;
  final bool dense;
  final VisualDensity? visualDensity;

  const BaseListTile({
    this.onTap,
    this.title,
    this.subtitle,
    this.trailing,
    this.leading,
    this.horizontalTitleGap,
    this.minTileHeight,
    this.contentPadding = EdgeInsets.zero,
    this.dense = false,
    this.visualDensity,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ListTile(
    dense: dense,
    onTap: onTap,
    leading: leading,
    title: title,
    subtitle: subtitle,
    trailing: trailing,
    contentPadding: contentPadding,
    minTileHeight: minTileHeight,
    horizontalTitleGap: horizontalTitleGap,
    visualDensity: visualDensity,
  );
}
