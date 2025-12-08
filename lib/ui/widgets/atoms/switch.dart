part of 'atoms.dart';

class BaseSwitch extends StatelessWidget {
  final bool isSelected;
  final void Function(bool) onChanged;
  final Color? activeColor;
  final Color? activeThumbColor;
  final Color? activeTrackColor;
  final Color? inactiveTrackColor;
  final Color? inactiveThumbColor;

  const BaseSwitch({
    required this.isSelected,
    required this.onChanged,
    this.activeColor,
    this.activeTrackColor,
    this.inactiveTrackColor,
    this.inactiveThumbColor,
    this.activeThumbColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color fixedInactiveThumbColor =
        inactiveThumbColor ?? colorScheme.surfaceContainer;

    return Switch(
      value: isSelected,
      onChanged: onChanged,
      activeThumbColor: activeColor ?? Theme.of(context).colorScheme.onSurface,
      activeTrackColor: activeTrackColor ?? colorScheme.surfaceContainerLowest,
      inactiveTrackColor:
          inactiveTrackColor ?? colorScheme.surfaceContainerLowest,
      trackOutlineWidth: WidgetStateProperty.all(-1),
      inactiveThumbColor: fixedInactiveThumbColor,
      thumbIcon: WidgetStateProperty.all(
        Icon(
          Icons.circle_rounded,
          size: Layout.spaceL,
          color: isSelected ? activeThumbColor : fixedInactiveThumbColor,
        ),
      ),
    );
  }
}
