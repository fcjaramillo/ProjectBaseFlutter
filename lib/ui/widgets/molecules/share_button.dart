part of 'molecules.dart';

class BaseShareButton extends StatelessWidget {
  const BaseShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return CircleIcon(
      icon: Iconsax.send_2,
      iconSelected: Iconsax.send_2,
      backgroundColorSelected: colorScheme.surface,
      backgroundColor: colorScheme.surface,
      iconColor: colorScheme.onSurface,
      iconColorSelected: colorScheme.onSurface,
      selected: true,
    );
  }
}
