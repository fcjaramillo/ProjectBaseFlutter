part of 'molecules.dart';

class BaseGradientCard extends StatelessWidget {
  const BaseGradientCard({
    required this.children,
    this.margin,
    this.spacing,
    this.crossAxisAlignment,
    this.primaryColor,
    this.secondaryColor,
    this.gradient,
    this.borderRadius,
    super.key,
  });

  final List<Widget> children;
  final EdgeInsetsGeometry? margin;
  final double? spacing;
  final CrossAxisAlignment? crossAxisAlignment;
  final Color? primaryColor;
  final Color? secondaryColor;
  final Gradient? gradient;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    AppThemeColors theme = Theme.of(context).appColors;
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            primaryColor ?? theme.primary.strong.withValues(alpha: 0.4),
            secondaryColor ?? theme.informative.strong.withValues(alpha: 0.4),
          ],
        ),
        borderRadius: borderRadius ?? CHRadius.r_2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: theme.neutral.soft,
            borderRadius: borderRadius ?? CHRadius.r_2,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? CHRadius.r_2,
              gradient:
                  gradient ??
                  RadialGradient(
                    center: const Alignment(-0.36, -0.61),
                    radius: 1,
                    colors: <Color>[
                      secondaryColor ??
                          theme.informative.strong.withValues(alpha: 0.1),
                      theme.neutral.soft.withValues(alpha: 0.1),
                    ],
                  ),
            ),
            child: Padding(
              padding: margin ?? BasePadding.padding_12,
              child: Column(
                crossAxisAlignment:
                    crossAxisAlignment ?? CrossAxisAlignment.center,
                spacing: spacing ?? Layout.spaceML,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
