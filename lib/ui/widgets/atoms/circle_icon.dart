part of 'atoms.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final Color? backgroundColorSelected;
  final Color? backgroundColor;
  final Color? iconColor;
  final Color? iconColorSelected;
  final IconData? iconSelected;
  final double? height;
  final double? width;
  final double? size;
  final double? radius;
  final Function()? onTap;

  const CircleIcon({
    required this.icon,
    this.selected = false,
    this.backgroundColorSelected,
    this.backgroundColor,
    this.iconColor,
    this.iconColorSelected,
    this.iconSelected,
    this.height = 40,
    this.width = 40,
    this.size = 22,
    this.radius = 100,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    Color fillColor = selected
        ? (backgroundColorSelected ?? colorScheme.onSurface)
        : (backgroundColor ?? colorScheme.surfaceContainerLowest);

    Color fillIconColor = selected
        ? (iconColor ?? colorScheme.surface)
        : (iconColorSelected ?? colorScheme.surfaceContainerHigh);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: fillColor,
            borderRadius: BorderRadius.circular(radius!),
          ),
          child: Icon(
            selected ? icon : (iconSelected ?? icon),
            color: fillIconColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
