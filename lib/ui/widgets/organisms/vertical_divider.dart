part of './organisms.dart';

class CHVerticalDivider extends StatelessWidget {
  const CHVerticalDivider({
    this.padding,
    this.height,
    this.width,
    this.color,
    super.key,
  });

  final EdgeInsetsGeometry? padding;
  final double? height;
  final double? width;
  final Color? color;

  @override
  Widget build(BuildContext context) => Padding(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: Layout.spaceS),
        child: SizedBox(
          height: height ?? Layout.spaceM,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    color ?? Theme.of(context).colorScheme.surfaceContainerHigh,
                width: width ?? .3,
              ),
            ),
          ),
        ),
      );
}
