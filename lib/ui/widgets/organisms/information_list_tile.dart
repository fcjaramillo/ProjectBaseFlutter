part of 'organisms.dart';

class InformationListTile extends StatelessWidget {
  final String? name;
  final IconData? icon;
  final String? title;
  final String? subtitle;
  final VoidCallback? onTap;
  final Widget? trailing;
  final double? titleFontSize;
  final TextOverflow? textOverflow;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;

  const InformationListTile({
    this.title,
    this.name,
    this.subtitle,
    this.onTap,
    this.titleFontSize,
    this.trailing,
    this.textOverflow,
    this.icon,
    this.textStyle,
    this.subtitleStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      if (name != null) ...<Widget>[
        BaseText(
          name!,
          style: TypoSecondary.b2s.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: titleFontSize,
          ),
        ),
      ],
      ListTileDivider(
        onTap: onTap,
        leading: icon != null ? Icon(icon) : null,
        title: title,
        subtitle: subtitle,
        trailing: trailing,
        textOverflow: textOverflow,
      ),
    ],
  );
}
