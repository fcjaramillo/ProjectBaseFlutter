part of 'molecules.dart';

class BaseDisclaimer extends StatelessWidget {
  const BaseDisclaimer({
    required this.title,
    required this.description,
    this.icon = Iconsax.info_circle,
    this.iconColor,
    this.backgroundColor,
    this.titleStyle,
    this.descriptionStyle,
    this.margin,
    this.borderRadius,
    super.key,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color? iconColor;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color:
          backgroundColor ??
          Theme.of(context).extension<CustomThemeColors>()?.infoOpacity,
      borderRadius: borderRadius ?? CHRadius.r_3,
    ),
    child: Padding(
      padding: margin ?? BasePadding.padding_16,
      child: Column(
        children: <Widget>[
          IconLabel(
            icon: icon,
            text: title,
            style: titleStyle ?? TypoSecondary.b2s,
            size: Layout.spaceML,
            textColor: TextStyleColor.noChangeStrong,
            iconColor:
                iconColor ??
                Theme.of(context).extension<CustomThemeColors>()?.info,
          ),
          Spacing.spacingV12,
          BaseText.noChangeStrong(
            description,
            style: descriptionStyle ?? TypoSecondary.b2r,
          ),
        ],
      ),
    ),
  );
}
