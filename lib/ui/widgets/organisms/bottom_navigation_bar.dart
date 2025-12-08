part of 'organisms.dart';

class BaseButtomNavigationBar extends StatelessWidget {
  final void Function(DashboardSection) onTapItem;
  final void Function(DashboardSection)? onLongPressItem;
  final DashboardSection current;
  final List<NavigationBarUiItem> items;
  final Color? backgroundColor;
  final List<GlobalKey> keys;

  const BaseButtomNavigationBar({
    required this.current,
    required this.onTapItem,
    required this.items,
    required this.keys,
    this.backgroundColor,
    this.mainItemSize = 56,
    this.mainItemPadding = 5,
    this.minRadiusCurve = 6,
    this.onLongPressItem,
    super.key,
  });

  final double mainItemSize;
  final double mainItemPadding;
  final double minRadiusCurve;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ColorScheme colorScheme = theme.colorScheme;
    CustomThemeColors customThemeColors = theme.extension<CustomThemeColors>()!;
    List<NavigationBarUiItem> finalItems = List<NavigationBarUiItem>.from(
      items,
    );
    final NavigationBarUiItem mainItem = finalItems.removeAt(0);

    return ClipShadowPath(
      shadow: BoxShadow(
        spreadRadius: 32,
        offset: const Offset(0, 8),
        color: theme.shadowColor,
      ),
      clipper: CustomAppBarClipper(
        mainItemSize: mainItemSize,
        mainItemPadding: mainItemPadding,
        minRadiusCurve: minRadiusCurve,
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Material(
            color: backgroundColor ?? colorScheme.surfaceBright,
            child: Row(
              children: <Widget>[
                for (int i = 0; i < (finalItems.length + 1) ~/ 2; i++)
                  CustomNaviagtionBarItem(
                    finalItems[i],
                    selected: finalItems[i].section == current,
                    onTap: () => onTapItem(finalItems[i].section),
                    targetKey: keys.getIndexOrNull(i + 1),
                  ),
                const Spacer(),
                for (
                  int i = (finalItems.length + 1) ~/ 2;
                  i < (finalItems.length + 1) ~/ 2 * 2;
                  i++
                )
                  if (i < finalItems.length)
                    CustomNaviagtionBarItem(
                      finalItems[i],
                      selected: finalItems[i].section == current,
                      onTap: () => onTapItem(finalItems[i].section),
                      targetKey: keys.getIndexOrNull(i + 1),
                    )
                  else
                    const Spacer(),
              ],
            ),
          ),
          Positioned(
            bottom: 12,
            child: GestureDetector(
              onTap: () => onTapItem(mainItem.section),
              onLongPress: () => onLongPressItem?.call(mainItem.section),
              child: Material(
                color: customThemeColors.transparent,
                child: Visibility(
                  visible: mainItem.section == current,
                  replacement: BaseText(mainItem.label, style: TypoCaption.c2),
                  child: BaseText.primary(
                    mainItem.label,
                    style: TypoCaption.c2,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            key: keys.getIndexOrNull(0),
            child: GestureDetector(
              onTap: () => onTapItem(mainItem.section),
              onLongPress: () => onLongPressItem?.call(mainItem.section),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeOutQuad,
                height: 56,
                width: mainItem.section == current ? 56 : 60,
                decoration: BoxDecoration(
                  color: mainItem.section == current
                      ? colorScheme.primary
                      : backgroundColor ?? colorScheme.surfaceBright,
                  shape: BoxShape.circle,
                  boxShadow: mainItem.section == current
                      ? <BoxShadow>[
                          BoxShadow(
                            color: colorScheme.primary.withValues(alpha: 0.4),
                            blurRadius: 10,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          ),
                        ]
                      : <BoxShadow>[],
                ),
                child: BottomNavigationBarItemIcon(
                  mainItem.icon,
                  selected: mainItem.section == current,
                ),
              ),
            ),
          ),
          SizedBox(
            height:
                60 +
                TypoButton.b3.height! * TypoButton.b3.fontSize! +
                mainItemSize / 2,
          ),
        ],
      ),
    );
  }
}

class CustomAppBarClipper extends CustomClipper<Path> {
  const CustomAppBarClipper({
    required this.mainItemSize,
    required this.mainItemPadding,
    required this.minRadiusCurve,
  });

  final double mainItemSize;
  final double mainItemPadding;
  final double minRadiusCurve;

  @override
  Path getClip(Size size) {
    final Path base = Path();

    final double w = size.width;
    final double h = size.height;

    final double h0 = mainItemSize / 2;
    final double o = minRadiusCurve;
    final double r = mainItemSize / 2 + mainItemPadding;

    final double df = sqrt(r * (r + 2 * o));
    final double dx = o * df / (r + o);
    final double dy = o * o / (r + o);

    //p1
    base.moveTo(0, h0);

    //p2
    base.lineTo(w / 2 - df, h0);

    base.arcToPoint(
      // p3
      Offset(w / 2 - df + dx, h0 + o - dy),
      radius: Radius.circular(o),
    );

    base.arcToPoint(
      //p4
      Offset(w / 2 + df - dx, h0 + o - dy),
      radius: Radius.circular(r),
      clockwise: false,
    );

    base.arcToPoint(
      //p5
      Offset(w / 2 + df, h0),
      radius: Radius.circular(o),
    );

    //p6
    base.lineTo(w, h0);

    //p7
    base.lineTo(w, h);

    //p8
    base.lineTo(0, h);
    base.close();

    Path main = Path();
    main.addOval(
      Rect.fromCircle(
        center: Offset(w / 2, mainItemSize / 2),
        radius: mainItemSize / 2,
      ),
    );

    return Path.combine(PathOperation.union, base, main);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
