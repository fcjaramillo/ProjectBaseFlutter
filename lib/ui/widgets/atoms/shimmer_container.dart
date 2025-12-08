part of 'atoms.dart';

class ShimmerContainer extends StatelessWidget {
  final Size size;
  final double radius;

  const ShimmerContainer.custom({
    required this.size,
    required this.radius,
    super.key,
  });

  const ShimmerContainer.linear({
    required this.size,
    super.key,
  }) : radius = 0;

  const ShimmerContainer.rounded({
    required this.size,
    this.radius = Layout.spaceM,
    super.key,
  });

  const ShimmerContainer.circle({
    required this.size,
    this.radius = Layout.spaceXXXL,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: size.height,
        width: size.width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Theme.of(context).colorScheme.onInverseSurface,
          ),
        ),
      );
}
