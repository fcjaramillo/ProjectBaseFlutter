part of 'atoms.dart';

class BaseTertiaryButton extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final bool isCollapsed;
  final VoidCallback? onPressed;
  final IconData? trailing;
  final String? image;
  final TextDecoration? decoration;
  final double radius;
  final EdgeInsetsGeometry? buttonTextPadding;
  final double? widthText;
  final double? maxFontSize;
  final double? trailingSize;
  final TextAlign? textAlign;
  final TextStyle? style;
  final Widget? leading;

  const BaseTertiaryButton({
    required this.text,
    required this.onPressed,
    this.buttonTextPadding,
    this.textAlign,
    this.image,
    this.isFullWidth = false,
    this.isCollapsed = false,
    this.trailing,
    this.decoration,
    this.radius = 10,
    this.widthText,
    this.maxFontSize,
    this.trailingSize,
    this.style,
    this.leading,
    super.key,
  });

  BaseTertiaryButton.fontSmall({
    required this.text,
    required this.onPressed,
    this.buttonTextPadding,
    this.textAlign,
    this.image,
    this.isFullWidth = false,
    this.isCollapsed = false,
    this.trailing,
    this.decoration,
    this.radius = 10,
    this.widthText,
    this.trailingSize,
    this.leading,
    super.key,
  })  : style = TypoButton.b1,
        maxFontSize = 14;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
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
              if (image != null) ...<Widget>[
                SvgPicture.asset(image!),
                Spacing.spacingH8,
              ],
              if (leading != null) ...<Widget>[
                leading!,
                Spacing.spacingH8,
              ],
              SizedBox(
                width: widthText,
                child: BaseText.noChangeSubtle(
                  text,
                  maxFontSize: maxFontSize ?? Layout.spaceL,
                  textAlign: textAlign ?? TextAlign.center,
                  style: style ??
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
                  size: trailingSize,
                ),
              ],
            ],
          ),
        ),
      );
}
