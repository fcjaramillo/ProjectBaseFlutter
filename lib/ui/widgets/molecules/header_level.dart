part of 'molecules.dart';

class HeaderLevel extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? mainColor;
  final Color? colorBorder;
  final bool? value;
  final VoidCallback? onTap;
  final bool hasInteraction;

  const HeaderLevel({
    required this.title,
    required this.mainColor,
    required this.value,
    required this.onTap,
    super.key,
    this.titleStyle,
    this.colorBorder,
  }) : hasInteraction = true;

  const HeaderLevel.noInteraction({
    required this.title,
    required this.mainColor,
    super.key,
    this.titleStyle,
    this.colorBorder,
  }) : hasInteraction = false,
       value = null,
       onTap = null;

  @override
  Widget build(BuildContext context) => Padding(
    padding: BasePadding.padding_1,
    child: DecoratedBox(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: CHRadius.rTop_2,
      ),
      child: Padding(
        padding: hasInteraction
            ? BasePadding.paddingH16V24
            : BasePadding.padding_32,
        child: Row(
          mainAxisAlignment: hasInteraction
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: <Widget>[
            BaseText(
              title,
              style: titleStyle ?? TypoSubtitles.s3,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            if (hasInteraction)
              BaseCheckBox(
                value!,
                onTap: onTap!,
                backgroundColor: Theme.of(
                  context,
                ).extension<CustomThemeColors>()!.light,
              ),
          ],
        ),
      ),
    ),
  );
}
