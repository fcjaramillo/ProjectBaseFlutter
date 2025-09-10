part of 'atoms.dart';

class BasePrimaryButton extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final bool isCollapsed;
  final VoidCallback? onPressed;
  final IconData? trailing;
  final TextDecoration? decoration;
  final double radius;
  final EdgeInsetsGeometry? buttonTextPadding;
  final double? widthText;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final double? maxFontSize;
  final Widget? leading;

  const BasePrimaryButton({
    required this.text,
    required this.onPressed,
    this.isFullWidth = false,
    this.isCollapsed = false,
    this.radius = 10,
    this.buttonTextPadding,
    this.trailing,
    this.decoration,
    this.widthText,
    this.textAlign,
    this.textStyle,
    this.maxFontSize,
    this.leading,
    super.key,
  });

  BasePrimaryButton.typoButton({
    required this.text,
    required this.onPressed,
    this.buttonTextPadding,
    this.textAlign,
    this.isFullWidth = false,
    this.isCollapsed = false,
    this.decoration,
    this.radius = 10,
    this.widthText,
    this.trailing,
    this.leading,
    super.key,
  })  : textStyle = TypoButton.b1,
        maxFontSize = Layout.spaceL;

  @override
  Widget build(BuildContext context) => FilledButton(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: isCollapsed ? BasePadding.paddingV8 : BasePadding.paddingV20,
          minimumSize: isFullWidth ? const Size(double.infinity, 0) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          overlayColor: Theme.of(context).extension<CustomThemeColors>()?.light,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: buttonTextPadding ?? BasePadding.paddingH16,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (leading != null) ...<Widget>[
                leading!,
                Spacing.spacingH8,
              ],
              SizedBox(
                width: widthText,
                child: BaseText.invert(
                  text,
                  maxFontSize: maxFontSize ?? 13,
                  textAlign: textAlign ?? TextAlign.center,
                  style: textStyle ??
                      TypoButton.b1.copyWith(
                        overflow: TextOverflow.ellipsis,
                        decoration: decoration,
                      ),
                ),
              ),
              if (trailing != null) ...<Widget>[
                Spacing.spacingH12,
                Icon(
                  trailing,
                ),
              ],
            ],
          ),
        ),
      );
}
