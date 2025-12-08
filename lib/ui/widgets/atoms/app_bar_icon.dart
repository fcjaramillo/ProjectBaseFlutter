part of 'atoms.dart';

class AppBarIcon extends StatelessWidget {
  final IconData iconData;
  final VoidCallback onTap;

  const AppBarIcon({
    required this.iconData,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => IconButton(
        icon: Icon(iconData),
        onPressed: onTap,
      );
}
