part of 'atoms.dart';

class OutlinedBox extends StatelessWidget {
  const OutlinedBox({
    required this.child,
    this.borderRadius,
    this.color,
    super.key,
  });

  final Color? color;
  final BorderRadius? borderRadius;
  final Widget child;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(
        color: color ?? Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      borderRadius: borderRadius ?? CHRadius.r_2,
    ),
    child: Padding(padding: BasePadding.padding_16, child: child),
  );
}
