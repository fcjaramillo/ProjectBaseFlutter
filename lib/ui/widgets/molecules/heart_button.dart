part of 'molecules.dart';

class CHHeartButton extends StatelessWidget {
  final bool isFavorite;
  const CHHeartButton({
    required this.isFavorite,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CircleIcon(
      icon: Iconsax.heart5,
      iconSelected: Iconsax.heart,
      backgroundColorSelected: colorScheme.surface.withValues(alpha: 0.4),
      backgroundColor: colorScheme.surface.withValues(alpha: 0.4),
      iconColorSelected: colorScheme.onInverseSurface,
      selected: isFavorite,
    );
  }
}
