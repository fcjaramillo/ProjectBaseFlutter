part of 'organisms.dart';

class DecisionBottomSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  final String textPrimary;
  final String textSecondary;
  final VoidCallback onTapPrimary;
  final VoidCallback onTapSecondary;
  final IconData? icon;
  final Color? iconColor;
  final Color? iconBackgroundColor;
  final Widget? extraInfo;
  final VoidCallback? onTapIcon;
  final TextAlign? titleAligment;
  final bool? haveClose;
  final double? iconSize;
  final TextStyle? titleStyle;
  final EdgeInsetsGeometry? padding;

  const DecisionBottomSheet({
    required this.title,
    required this.subtitle,
    required this.textPrimary,
    required this.textSecondary,
    required this.onTapPrimary,
    required this.onTapSecondary,
    this.icon,
    this.extraInfo,
    this.iconColor,
    this.iconBackgroundColor,
    this.onTapIcon,
    this.titleAligment,
    this.haveClose,
    this.iconSize,
    this.titleStyle,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MessageBottomSheet(
        icon: icon,
        iconColor: iconColor ?? Theme.of(context).colorScheme.error,
        iconBackgroundColor: iconBackgroundColor,
        iconSize: iconSize,
        onTapIcon: onTapIcon,
        title: title,
        subtitle: subtitle,
        textPrimary: textPrimary,
        onTapPrimary: onTapPrimary,
        textSecondary: textSecondary,
        onTapSecondary: onTapSecondary,
        extraInfo: extraInfo,
        titleAligment: titleAligment,
        titleStyle: titleStyle,
        haveClose: haveClose ?? true,
        padding: padding,
      );
}
