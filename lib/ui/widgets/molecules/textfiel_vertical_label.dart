part of 'molecules.dart';

class TextfieldWithVerticalLabel extends StatelessWidget {
  final String? label;
  final TextEditingController? controller;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? red;
  final TextStyleColor labelColor;
  final Color? suffixIconColor;
  final Color? fillColor;
  final Color? prefixIconColor;
  final IconData? suffixIcon;
  final Widget? prefixIcon;
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
  final bool enabled;
  final TextCapitalization textCapitalization;
  final AutovalidateMode? autovalidateMode;

  TextfieldWithVerticalLabel({
    this.controller,
    this.label,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.red,
    this.labelColor = TextStyleColor.soft,
    this.suffixIconColor,
    this.onTapTextField,
    this.prefixIconColor,
    this.suffixIcon,
    IconData? prefixIcon,
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
    this.enabled = true,
    this.labelStyle,
    this.textCapitalization = TextCapitalization.sentences,
    this.fillColor,
    this.autovalidateMode,
    super.key,
  }) : borderRadius = BorderRadius.all(Radius.circular(borderRadius)),
       prefixIcon = prefixIcon == null ? null : Icon(prefixIcon);

  TextfieldWithVerticalLabel.withCustomPrefix({
    this.controller,
    this.label,
    this.readOnly = false,
    this.borderColor,
    this.focusedBorderColor,
    this.red,
    this.labelColor = TextStyleColor.soft,
    this.suffixIconColor,
    this.onTapTextField,
    this.prefixIconColor,
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
    this.enabled = true,
    this.labelStyle,
    this.textCapitalization = TextCapitalization.sentences,
    this.fillColor,
    this.autovalidateMode,
    super.key,
  }) : borderRadius = BorderRadius.all(Radius.circular(borderRadius));

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          BaseText.withTextStyleColor(
            label!,
            textStyleColor: labelColor,
            style: labelStyle ?? TypoSecondary.b3r,
          ),
        TextFormField(
          autovalidateMode: autovalidateMode,
          onTapOutside: (PointerDownEvent event) =>
              FocusManager.instance.primaryFocus?.unfocus(),
          textCapitalization: textCapitalization,
          onTap: onTapTextField,
          obscuringCharacter: '●',
          readOnly: readOnly,
          obscureText: isObscureText,
          style: textStyle ?? TypoSecondary.b1r,
          focusNode: focusNode,
          validator: validator,
          maxLength: maxLength,
          enabled: enabled,
          controller: controller,
          textAlign: textAlign!,
          onChanged: onChanged,
          autofocus: autofocus!,
          keyboardType: keyboardType,
          maxLines: maxLines ?? 1,
          contextMenuBuilder:
              (BuildContext context, EditableTextState editableTextState) =>
                  AdaptiveTextSelectionToolbar.editableText(
                    editableTextState: editableTextState,
                  ),
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.start,
            fillColor: fillColor,
            filled: fillColor != null,
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: BasePadding.paddingH4,
                    child: IconButton(
                      onPressed: onTapSuffixIcon,
                      icon: Icon(suffixIcon, color: suffixIconColor),
                    ),
                  )
                : null,
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: BasePadding.paddingH4,
                    child: IconButton(
                      onPressed: onTapPrefixIcon,
                      icon: prefixIcon!,
                    ),
                  )
                : null,
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: borderColor ?? colorScheme.surfaceContainerLow,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(
                color: borderColor ?? colorScheme.surfaceContainerLow,
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
              borderSide: BorderSide(color: red ?? colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: BorderSide(color: red ?? colorScheme.error),
            ),
            errorStyle: TypoCaption.c1.copyWith(
              color: red ?? colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
