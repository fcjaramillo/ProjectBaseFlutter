part of 'molecules.dart';

class StringPopUpMenu extends StatelessWidget {
  const StringPopUpMenu({
    required this.onTapDetail,
    this.items,
    this.offset,
    this.builder,
    this.padding,
    this.itemWidth,
    this.spacing,
    super.key,
  });

  final void Function(String) onTapDetail;
  final List<StringPopUpMenuItem>? items;
  final Offset? offset;
  final Widget? builder;
  final EdgeInsets? spacing;
  final EdgeInsetsGeometry? padding;
  final double? itemWidth;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return PopupMenuButton<String>(
      onSelected: onTapDetail,
      color: Theme.of(context).appColors.neutral.subtle,
      offset: offset ?? Offset(0, responsive.height * 0.07),
      icon: builder == null
          ? Icon(
              Icons.more_vert,
              color: Theme.of(context).appColors.icon.scale.strong,
              size: Layout.spaceL,
            )
          : null,
      menuPadding: padding ?? BasePadding.padding_8,
      itemBuilder: (BuildContext context) =>
          List<PopupMenuEntry<String>>.generate(
            items?.length ?? 0,
            (int index) => PopupMenuItem<String>(
              padding: spacing,
              value: items?[index].value ?? '',
              child: SizedBox(
                width: responsive.width * (itemWidth ?? 0.4),
                child: IconLabel(
                  icon: items?[index].icon ?? Icons.person,
                  text: items?[index].text ?? '',
                  subtitle: items?[index].subtitle ?? '',
                  size: Layout.spaceML,
                  style: TypoButton.b2,
                  textColor: TextStyleColor.strong,
                  iconColor: Theme.of(context).appColors.icon.scale.strong,
                  haveMaxLines: false,
                  overflow: TextOverflow.visible,
                ),
              ),
            ),
          ),
      child: builder,
    );
  }
}
