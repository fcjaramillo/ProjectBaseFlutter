part of 'atoms.dart';

class BottomNavigationBarItemIcon extends StatelessWidget {
  const BottomNavigationBarItemIcon(
    this.icon, {
    required this.selected,
    super.key,
  });

  final NavigationBarIcon icon;
  final bool selected;

  @override
  Widget build(BuildContext context) => Visibility(
        visible: icon.svg != null || icon.icon != null,
        replacement: const SizedBox(),
        child: Padding(
          padding: icon.offset,
          child: Visibility(
            visible: icon.icon != null,
            replacement: SvgPicture.asset(
              icon.svg ?? Svgs.kInsertSvgs,
              width: Layout.spaceL,
              fit: BoxFit.fitWidth,
            ),
            child: Icon(
              icon.icon ?? Icons.add,
              color: selected
                  ? Theme.of(context).appColors.icon.noChange.subtle
                  : Theme.of(context).appColors.icon.scale.strong,
              size: Layout.spaceL,
            ),
          ),
        ),
      );
}
