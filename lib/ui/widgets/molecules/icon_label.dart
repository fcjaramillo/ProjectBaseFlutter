part of 'molecules.dart';

class IconLabel extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? subtitle;
  final Color? iconColor;
  final TextStyleColor textColor;
  final TextStyleColor subtitleColor;
  final double? size;
  final TextStyle? style;
  final Widget? spacing;
  final double? widthText;
  final TextDecoration? decoration;
  final int? maxLines;
  final TextOverflow? overflow;
  final int? flex;
  final bool haveMaxLines;

  const IconLabel({
    required this.icon,
    required this.text,
    this.subtitle,
    this.size,
    this.iconColor,
    this.textColor = TextStyleColor.soft,
    this.subtitleColor = TextStyleColor.soft,
    this.style,
    this.spacing,
    this.widthText,
    this.decoration,
    this.maxLines,
    this.overflow,
    this.flex,
    this.haveMaxLines = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Icon(
        icon,
        size: size,
        color: iconColor ?? Theme.of(context).colorScheme.surfaceContainerHigh,
      ),
      spacing ?? Spacing.spacingH8,
      Expanded(
        flex: flex ?? 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BaseText.withTextStyleColor(
              text,
              textStyleColor: textColor,
              style: style ?? TypoCaption.c1.copyWith(decoration: decoration),
              overflow: overflow ?? TextOverflow.ellipsis,
              maxLines: haveMaxLines ? maxLines : null,
            ),
            Visibility(
              visible: subtitle != null,
              child: BaseText.withTextStyleColor(
                subtitle ?? kEmptyString,
                textStyleColor: subtitleColor,
                style: TypoSecondary.b2r,
                overflow: overflow ?? TextOverflow.ellipsis,
                maxLines: haveMaxLines ? maxLines : null,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
