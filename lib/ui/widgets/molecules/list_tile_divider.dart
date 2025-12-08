part of 'molecules.dart';

class ListTileDivider extends StatelessWidget {
  final String? title;
  final Widget? leading;
  final VoidCallback? onTap;
  final String? subtitle;
  final TextStyle? textStyle;
  final TextStyle? subtitleStyle;
  final Widget? trailing;
  final Widget? spacing;
  final bool haveDivider;
  final Widget? subtitleWidget;
  final TextDecoration? textDecoration;
  final TextOverflow? textOverflow;

  const ListTileDivider({
    this.title,
    this.onTap,
    this.subtitle,
    this.textStyle,
    this.subtitleStyle,
    this.textOverflow,
    this.trailing,
    this.spacing,
    this.leading,
    this.haveDivider = true,
    this.subtitleWidget,
    this.textDecoration,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      BaseListTile(
        onTap: onTap,
        leading: leading,
        title: title != null
            ? BaseText(
                title!,
                style:
                    textStyle ??
                    TypoBody.b1r.copyWith(
                      decoration: textDecoration,
                      overflow: textOverflow,
                    ),
              )
            : null,
        subtitle: subtitle != null
            ? BaseText(subtitle ?? '', style: subtitleStyle)
            : subtitleWidget,
        trailing: trailing,
      ),
      Visibility(
        visible: spacing != null,
        replacement: Spacing.spacingV2,
        child: spacing ?? Spacing.spacingV12,
      ),
      Visibility(
        visible: haveDivider,
        child: BaseDivider(
          color: Theme.of(context).colorScheme.surfaceContainerLow,
        ),
      ),
    ],
  );
}
