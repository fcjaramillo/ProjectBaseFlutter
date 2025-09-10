part of 'atoms.dart';

class BaseChip extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isCollapsed;
  final TextStyle? style;
  final TextStyleColor? textStyleColor;
  final BorderRadiusGeometry? borderRadius;
  final Widget? icon;
  final EdgeInsetsGeometry? padding;
  final double? widthText;
  final bool solidColor;
  final Gradient? gradient;
  final double? minDoubleWith;
  final ChipType type;
  final bool? selected;
  final bool? center;
  final int? maxLines;
  final bool flexText;
  final TextOverflow? overflow;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextAlign? textAlign;
  final Widget? iconSpacing;

  const BaseChip({
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.isCollapsed = false,
    this.icon,
    this.style,
    this.textStyleColor,
    this.borderRadius,
    this.padding,
    this.widthText,
    this.solidColor = true,
    this.gradient,
    this.minDoubleWith,
    this.center,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : selected = null,
        type = ChipType.generic;

  BaseChip.error({
    required this.text,
    TextStyle? style,
    this.borderRadius,
    this.padding,
    this.icon,
    this.widthText,
    this.minDoubleWith,
    this.center = false,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : backgroundColor = null,
        borderColor = null,
        isCollapsed = true,
        style = style ?? TypoCaption.c1.semibold,
        textStyleColor = null,
        solidColor = true,
        gradient = null,
        selected = null,
        type = ChipType.error;

  BaseChip.success({
    required this.text,
    TextStyle? style,
    this.borderRadius = BaseRadius.r_1,
    this.icon,
    this.padding,
    this.widthText,
    this.minDoubleWith,
    this.borderColor,
    this.center = false,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : backgroundColor = null,
        isCollapsed = true,
        style = style ?? TypoCaption.c1,
        textStyleColor = null,
        solidColor = true,
        gradient = null,
        selected = null,
        type = ChipType.success;

  BaseChip.info({
    required this.text,
    TextStyle? style,
    this.borderRadius,
    this.icon,
    this.padding,
    this.widthText,
    this.minDoubleWith,
    this.center = false,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : backgroundColor = null,
        borderColor = null,
        isCollapsed = true,
        style = style ?? TypoCaption.c1.semibold,
        textStyleColor = null,
        solidColor = true,
        gradient = null,
        selected = null,
        type = ChipType.info;

  BaseChip.pending({
    required this.text,
    TextStyle? style,
    this.borderRadius,
    this.icon,
    this.padding,
    this.widthText,
    this.minDoubleWith,
    this.center = false,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : backgroundColor = null,
        borderColor = null,
        isCollapsed = true,
        style = style ?? TypoCaption.c1.semibold,
        textStyleColor = null,
        solidColor = true,
        gradient = null,
        selected = null,
        type = ChipType.pending;

  BaseChip.gradient({
    required this.text,
    required Gradient this.gradient,
    this.borderColor,
    TextStyle? style,
    this.textStyleColor,
    this.borderRadius,
    this.icon,
    this.padding,
    this.widthText,
    this.minDoubleWith,
    this.center = false,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : backgroundColor = null,
        isCollapsed = true,
        style = style ?? TypoCaption.c1,
        solidColor = false,
        selected = null,
        type = ChipType.gradient;

  BaseChip.selection({
    required this.text,
    required this.selected,
    TextStyle? style,
    this.borderRadius,
    this.padding,
    this.icon,
    this.widthText,
    this.minDoubleWith,
    this.center,
    this.maxLines,
    this.textStyleColor,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    super.key,
  })  : backgroundColor = null,
        borderColor = null,
        isCollapsed = true,
        style = style ?? TypoCaption.c1.semibold,
        solidColor = true,
        gradient = null,
        type = ChipType.selection;

  BaseChip.status({
    required this.text,
    required this.selected,
    TextStyle? style,
    Color? backgroundUnselected,
    Color? borderUnselected,
    Color? backgroundSelected,
    Color? borderSelected,
    this.borderRadius,
    this.padding,
    this.icon,
    this.widthText,
    this.minDoubleWith,
    this.center = false,
    this.maxLines,
    this.flexText = false,
    this.overflow,
    this.crossAxisAlignment,
    this.textAlign,
    this.iconSpacing,
    this.textStyleColor,
    super.key,
  })  : backgroundColor =
            (selected ?? false) ? backgroundSelected : backgroundUnselected,
        borderColor = (selected ?? false) ? borderSelected : borderUnselected,
        isCollapsed = true,
        style = style ?? TypoCaption.c1.semibold,
        solidColor = true,
        gradient = null,
        type = ChipType.status;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: solidColor
              ? backgroundColor ??
                  type.backgroundColor(
                    Theme.of(context),
                    selected: selected,
                  )
              : null,
          borderRadius: borderRadius ?? BorderRadius.circular(100),
          border: Border.all(
            color: borderColor ??
                type.borderColor(
                  Theme.of(context),
                  selected: selected,
                ),
          ),
          gradient: solidColor ? null : gradient,
        ),
        child: Padding(
          padding: padding != null
              ? padding!
              : isCollapsed
                  ? BasePadding.paddingH8V4
                  : BasePadding.padding_12,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: <Widget>[
              if (icon != null) ...<Widget>[
                icon!,
                iconSpacing ?? Spacing.spacingH4,
              ],
              Expanded(
                flex: flexText ? 1 : 0,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: minDoubleWith ?? 0),
                  child: SizedBox(
                    width: (widthText != null
                        ? Responsive.of(context).wp(widthText!)
                        : null),
                    child: Visibility(
                      visible: selected ?? false,
                      replacement: BaseText.withTextStyleColor(
                        text,
                        textStyleColor:
                            textStyleColor ?? TextStyleColor.noChangeStrong,
                        style: style ?? TypoCaption.c1,
                        textAlign: textAlign ?? TextAlign.center,
                        overflow: overflow ?? TextOverflow.ellipsis,
                        maxLines: maxLines,
                      ),
                      child: BaseText.withTextStyleColor(
                        text,
                        textStyleColor: textStyleColor ?? TextStyleColor.invert,
                        style: style ?? TypoCaption.c1,
                        textAlign: textAlign ?? TextAlign.center,
                        overflow: overflow ?? TextOverflow.ellipsis,
                        maxLines: maxLines,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
