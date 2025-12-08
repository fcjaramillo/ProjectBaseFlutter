part of 'organisms.dart';

class SnackBarItem extends StatelessWidget {
  final String message;
  final Color iconColor;
  final Color backgroundColor;
  final IconData icon;

  const SnackBarItem({
    required this.message,
    required this.iconColor,
    required this.backgroundColor,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(Layout.spaceM),
      color: backgroundColor,
      border: Border.all(color: iconColor),
    ),
    child: Padding(
      padding: BasePadding.padding_8,
      child: Row(
        children: <Widget>[
          Icon(icon, color: backgroundColor),
          Spacing.spacingH4,
          BaseText(message),
        ],
      ),
    ),
  );
}
