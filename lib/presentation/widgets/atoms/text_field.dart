part of 'atoms.dart';

class BaseTextField extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? errorColor;
  final Color? labelColor;
  final Color? suffixIconColor;
  final Color? prefixIconColor;
  final Color? prefixBackgroundColor;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final TextAlign? textAlign;
  final int? maxLength;
  final int? maxLines;
  final VoidCallback? onTapSuffixIcon;
  final VoidCallback? onTapPrefixIcon;
  final BorderRadius borderRadius;
  final VoidCallback? onTapTextField;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final bool? autofocus;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;
  final TextStyle? textStyle;
  final TextStyle? labelStyle;
  final bool isObscureText;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final double? sufixIconSize;
  final double? prefixIconSize;
  final VoidCallback? onTapOutside;
  final AutovalidateMode? autovalidateMode;
  final bool? alignLabelWithHint;
  final bool labelAsWidget;
  final EdgeInsetsGeometry? prefixPadding;
  final Widget? suffix;
  final List<TextInputFormatter>? inputFormatters;
  final int? errorMaxLines;

  BaseTextField({
    this.controller,
    this.label,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.errorColor,
    this.labelColor,
    this.suffixIconColor,
    this.onTapTextField,
    this.prefixIconColor,
    this.prefixBackgroundColor,
    this.onTapOutside,
    this.suffixIcon,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.maxLines,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.onChanged,
    this.validator,
    double borderRadius = 10,
    this.autofocus = false,
    this.keyboardType,
    this.focusNode,
    this.textStyle,
    this.isObscureText = false,
    this.labelStyle,
    this.textCapitalization = TextCapitalization.sentences,
    this.sufixIconSize,
    this.prefixIconSize,
    this.autovalidateMode,
    this.alignLabelWithHint = false,
    this.labelAsWidget = false,
    this.prefixPadding,
    this.suffix,
    this.inputFormatters,
    this.errorMaxLines,
    super.key,
  }) : borderRadius = BorderRadius.all(
          Radius.circular(borderRadius),
        );

  const BaseTextField.withBorderRadius({
    this.sufixIconSize,
    this.prefixIconSize,
    this.onTapOutside,
    this.controller,
    this.readOnly = false,
    this.label,
    this.borderColor,
    this.focusedBorderColor,
    this.errorColor,
    this.labelColor,
    this.suffixIconColor,
    this.prefixIconColor,
    this.prefixBackgroundColor,
    this.suffixIcon,
    this.prefixIcon,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.maxLines,
    this.onTapSuffixIcon,
    this.onTapPrefixIcon,
    this.onTapTextField,
    this.onChanged,
    this.validator,
    BorderRadius? borderRadius,
    this.autofocus = false,
    this.keyboardType,
    this.focusNode,
    this.textStyle,
    this.isObscureText = false,
    this.labelStyle,
    this.textCapitalization = TextCapitalization.sentences,
    this.autovalidateMode,
    this.alignLabelWithHint = false,
    this.labelAsWidget = false,
    this.prefixPadding,
    this.suffix,
    this.inputFormatters,
    this.errorMaxLines,
    super.key,
  }) : borderRadius = borderRadius ??
            const BorderRadius.all(
              Radius.circular(10),
            );

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    Color fixedBorderColor = borderColor ?? colorScheme.surfaceContainerLow;
    Color fixedLabelColor = labelColor ?? colorScheme.surfaceContainerLow;
    Widget prefix = Padding(
      padding: prefixPadding ??
          (prefixBackgroundColor != null
              ? BasePadding.paddingH12V8
              : BasePadding.paddingH4),
      child: prefixBackgroundColor != null
          ? DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BaseRadius.circular,
                color: prefixBackgroundColor,
              ),
              child: Padding(
                padding: BasePadding.padding_8,
                child: GestureDetector(
                  onTap: onTapPrefixIcon,
                  child: Icon(
                    prefixIcon,
                    color: prefixIconColor,
                    size: prefixIconSize,
                  ),
                ),
              ),
            )
          : IconButton(
              onPressed: onTapPrefixIcon,
              padding: EdgeInsets.zero,
              icon: Icon(
                prefixIcon,
                color: prefixIconColor,
                size: prefixIconSize,
              ),
            ),
    );

    return TextFormField(
      textAlignVertical: TextAlignVertical.center,
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
        onTapOutside?.call();
      },
      textCapitalization: textCapitalization,
      onTap: onTapTextField,
      obscuringCharacter: '●',
      readOnly: readOnly,
      obscureText: isObscureText,
      style: textStyle ?? TypoBody.b1r,
      focusNode: focusNode,
      validator: validator,
      maxLength: maxLength,
      controller: controller,
      textAlign: textAlign!,
      onChanged: onChanged,
      autofocus: autofocus!,
      keyboardType: keyboardType,
      maxLines: maxLines ?? 1,
      inputFormatters: inputFormatters,
      autovalidateMode: autovalidateMode,
      decoration: InputDecoration(
        suffixIcon: suffixIcon != null
            ? Padding(
                padding: BasePadding.paddingH4,
                child: IconButton(
                  onPressed: onTapSuffixIcon,
                  icon: Icon(
                    suffixIcon,
                    color: suffixIconColor,
                    size: sufixIconSize,
                  ),
                ),
              )
            : null,
        suffix: suffix != null
            ? GestureDetector(
                onTap: onTapSuffixIcon,
                child: suffix,
              )
            : null,
        prefixIcon: prefixIcon != null ? prefix : null,
        counterText: '',
        labelText: !labelAsWidget ? label : null,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: labelStyle ??
            TypoBody.b1r.copyWith(
              color: fixedLabelColor,
            ),
        border: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: fixedBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: fixedBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: focusedBorderColor ?? colorScheme.surfaceContainerHigh,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: errorColor ?? colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: errorColor ?? colorScheme.error,
          ),
        ),
        errorStyle: TypoCaption.c1.copyWith(
          color: errorColor ?? colorScheme.error,
        ),
        errorMaxLines: errorMaxLines,
        alignLabelWithHint: alignLabelWithHint,
        label: labelAsWidget ? BaseText.subtle(label ?? '') : null,
      ),
    );
  }
}
