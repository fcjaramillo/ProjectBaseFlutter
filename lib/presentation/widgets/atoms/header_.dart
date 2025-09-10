part of 'atoms.dart';

class BaseSizedBox extends StatelessWidget {
  final Widget? widget;
  final double? height;
  final double? width;
  final Color? color;
  final double radius;
  const BaseSizedBox({
    this.height = 5,
    this.width = 50,
    this.color,
    this.widget,
    this.radius = Layout.spaceXXXL,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              radius,
            ),
            color: color ?? Theme.of(context).colorScheme.surfaceContainerHigh,
          ),
          child: widget,
        ),
      );
}
