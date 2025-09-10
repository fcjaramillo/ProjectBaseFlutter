part of 'molecules.dart';

class CustomNaviagtionBarItem extends StatelessWidget {
  const CustomNaviagtionBarItem(
    this.item, {
    required this.selected,
    this.targetKey,
    this.onTap,
    super.key,
  });

  final NavigationBarUiItem item;
  final bool selected;
  final VoidCallback? onTap;
  final GlobalKey? targetKey;

  @override
  Widget build(BuildContext context) {
    CustomThemeColors customThemeColors =
        Theme.of(context).extension<CustomThemeColors>()!;
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Expanded(
      child: IconButton(
        hoverColor: customThemeColors.transparent,
        highlightColor: customThemeColors.transparent,
        splashColor: customThemeColors.transparent,
        padding: EdgeInsets.zero,
        onPressed: onTap,
        icon: Visibility(
          visible: item.isNotEmpty,
          replacement: const SizedBox(),
          child: LayoutBuilder(
            builder: (_, BoxConstraints constrains) => Stack(
              children: <Widget>[
                Column(
                  key: targetKey,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Spacing.spacingV12,
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInQuad,
                      alignment: Alignment.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: selected
                            ? colorScheme.primary
                            : customThemeColors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: BottomNavigationBarItemIcon(
                        item.icon,
                        selected: selected,
                      ),
                    ),
                    Spacing.spacingV2,
                    Visibility(
                      visible: selected,
                      replacement: BaseText(
                        item.label,
                        style: TypoCaption.c2,
                        textAlign: TextAlign.center,
                      ),
                      child: BaseText.primary(
                        item.label,
                        style: TypoCaption.c2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Spacing.spacingV12,
                  ],
                ),
                Positioned(
                  top: 4,
                  right: constrains.maxWidth * 0.25,
                  child: NotificationNumber(
                    notificationNumber: item.notifications,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
