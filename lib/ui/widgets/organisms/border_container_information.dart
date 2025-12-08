part of 'organisms.dart';

class BorderContainerInformation extends StatelessWidget {
  final EdgeInsetsGeometry? contentPadding;
  final BorderRadius? radius;
  final String? title;
  final TextStyle? titleStyle;
  final List<Widget> children;
  final List<BoxShadow>? boxShadow;
  final Color? colorBorder;
  final Color? backgroundColor;
  final CrossAxisAlignment? crossAxisAlignment;

  const BorderContainerInformation({
    required this.children,
    super.key,
    this.contentPadding,
    this.radius = CHRadius.r_2,
    this.title,
    this.titleStyle,
    this.boxShadow,
    this.colorBorder,
    this.backgroundColor,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: radius,
          border: Border.all(
            color: colorBorder ??
                Theme.of(context).colorScheme.surfaceContainerLow,
          ),
          color:
              backgroundColor ?? Theme.of(context).dialogTheme.backgroundColor,
          boxShadow: boxShadow,
        ),
        child: Padding(
          padding: contentPadding ?? const EdgeInsets.all(Layout.spaceML),
          child: Column(
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.start,
            spacing: Layout.spaceML,
            children: <Widget>[
              if (title != null)
                Text(
                  title!,
                  style: titleStyle ?? TypoSubtitles.s2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ...children,
            ],
          ),
        ),
      );
}
