part of 'atoms.dart';

class BaseBusinessIconButton extends StatelessWidget {
  const BaseBusinessIconButton({
    required this.icon,
    required this.onTap,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => IconButton(
    onPressed: onTap,
    icon: Icon(
      icon,
      color: Theme.of(context).extension<CustomThemeColors>()?.light,
    ),
    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
      shape: const WidgetStatePropertyAll<OutlinedBorder?>(CircleBorder()),
    ),
  );
}
