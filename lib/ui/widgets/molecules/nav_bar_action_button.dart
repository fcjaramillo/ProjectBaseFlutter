part of 'molecules.dart';

class NavBarActionButton extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback? onTap;
  final double? height;
  final double? width;

  const NavBarActionButton({
    required this.icon,
    required this.onTap,
    this.height = 40,
    this.width = 40,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: colorScheme.surfaceBright,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: Color(0x1A000000),
                blurRadius: 8,
              ),
            ],
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
