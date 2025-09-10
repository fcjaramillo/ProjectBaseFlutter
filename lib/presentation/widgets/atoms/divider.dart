part of 'atoms.dart';

class BaseDivider extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final double? height;
  final Color? color;

  const BaseDivider({
    this.padding,
    this.height = 1,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Divider(
          height: height,
          color: color ?? Theme.of(context).colorScheme.surfaceContainerLow,
        ),
      );
}
