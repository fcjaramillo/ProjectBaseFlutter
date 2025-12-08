part of 'molecules.dart';

class BaseOutlinedCard extends StatelessWidget {
  const BaseOutlinedCard({
    required this.children,
    this.spacing = Layout.zero,
    this.borderRadius,
    this.backgroundColor,
    this.borderColor,
    this.padding,
    this.crossAxisAlignment,
    super.key,
  });

  final List<Widget> children;
  final double spacing;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final EdgeInsetsGeometry? padding;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      border: Border.all(
        color: borderColor ?? Theme.of(context).colorScheme.surfaceContainerLow,
      ),
      color: backgroundColor,
      borderRadius: borderRadius ?? CHRadius.r_2,
    ),
    child: Padding(
      padding: padding ?? BasePadding.padding_16,
      child: Column(
        spacing: spacing,
        crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
        children: children,
      ),
    ),
  );
}
