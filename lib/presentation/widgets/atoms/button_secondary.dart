part of 'atoms.dart';

class BaseSecondaryButton extends StatelessWidget {
  final String text;
  final bool isFullWidth;
  final bool isCollapsed;
  final VoidCallback? onPressed;
  final String? image;
  final TextDecoration? decoration;
  final double radius;
  final EdgeInsetsGeometry? buttonTextPadding;
  final double? widthText;
  final TextAlign? textAlign;
  final TextStyle? style;
  final double? maxFontSize;

  const BaseSecondaryButton({
    required this.text,
    required this.onPressed,
    this.buttonTextPadding,
    this.isFullWidth = false,
    this.isCollapsed = false,
    this.image,
    this.textAlign,
    this.style,
    this.maxFontSize,
    this.decoration,
    this.radius = 10,
    this.widthText,
    super.key,
  });

  BaseSecondaryButton.typoButton({
    required this.text,
    required this.onPressed,
    this.buttonTextPadding,
    this.textAlign,
    this.image,
    this.isFullWidth = false,
    this.isCollapsed = false,
    this.decoration,
    this.radius = 10,
    this.widthText,
    super.key,
  })  : style = TypoButton.b1,
        maxFontSize = Layout.spaceL;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
          elevation: 0,
          padding: isCollapsed ? BasePadding.paddingV8 : BasePadding.paddingV20,
          minimumSize: isFullWidth ? const Size(double.infinity, 0) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          overlayColor: Theme.of(context).extension<CustomThemeColors>()?.dark,
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
              SizedBox(
                width: widthText,
                child: BaseText(
                  text,
                  maxFontSize: maxFontSize ?? 13,
                  textAlign: textAlign ?? TextAlign.center,
                  style: style ??
                      TypoButton.b1.copyWith(
                        overflow: TextOverflow.ellipsis,
                        decoration: decoration,
                      ),
                ),
              ),
            ],
          ),
        ),
      );
}
