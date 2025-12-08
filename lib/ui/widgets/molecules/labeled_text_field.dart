part of 'molecules.dart';

class BaseLabeledTextField extends StatelessWidget {
  const BaseLabeledTextField({
    required this.header,
    required this.controller,
    required this.onChanged,
    this.formKey,
    this.validator,
    this.label,
    this.onTapTextField,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixIconColor,
    this.suffixIconColor,
    this.suffixOnTap,
    this.textCapitalization,
    this.keyboardType,
    this.readOnly,
    this.enabled = true,
    this.autovalidateMode,
    this.errorMaxLines,
    this.maxLines,
    super.key,
  }) : isPassword = false;

  const BaseLabeledTextField.password({
    required this.header,
    required this.controller,
    required this.onChanged,
    this.formKey,
    this.validator,
    this.label,
    this.onTapTextField,
    this.prefixIconColor,
    this.suffixIconColor,
    this.textCapitalization,
    this.keyboardType,
    this.readOnly,
    this.enabled = true,
    this.autovalidateMode,
    this.errorMaxLines,
    this.maxLines,
    super.key,
  }) : prefixIcon = null,
       suffixIcon = null,
       isPassword = true,
       suffixOnTap = null;

  final String header;
  final TextEditingController controller;
  final void Function(String) onChanged;
  final GlobalKey<FormState>? formKey;
  final String? Function(String?)? validator;
  final String? label;
  final bool isPassword;
  final VoidCallback? onTapTextField;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final VoidCallback? suffixOnTap;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final AutovalidateMode? autovalidateMode;
  final int? errorMaxLines;
  final int? maxLines;
  final bool enabled;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      BaseText.soft(header, style: TypoBody.b3r),
      Spacing.spacingV8,
      Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Visibility(
          visible: isPassword,
          replacement: AbsorbPointer(
            absorbing: readOnly ?? false,
            child: BaseTextField(
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor:
                  prefixIconColor ?? Theme.of(context).colorScheme.onSurface,
              suffixIconColor:
                  suffixIconColor ?? Theme.of(context).colorScheme.onSurface,
              onTapTextField: onTapTextField,
              controller: controller,
              label: label ?? header,
              validator: validator,
              onChanged: (String text) {
                onChanged(text);
                if (formKey != null) {
                  formKey!.currentState?.validate();
                }
              },
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              keyboardType: keyboardType,
              textStyle: TypoBody.b1r,
              onTapSuffixIcon: suffixOnTap,
              readOnly: readOnly ?? false,
              maxLines: maxLines,
              errorMaxLines: errorMaxLines,
              enabled: enabled,
            ),
          ),
          child: PasswordTextField(
            onTapTextField: onTapTextField,
            controller: controller,
            label: label ?? header,
            validator: validator,
            onChanged: (String text) {
              onChanged(text);
              if (formKey != null) {
                formKey!.currentState?.validate();
              }
            },
            textCapitalization: textCapitalization ?? TextCapitalization.none,
            errorMaxLines: errorMaxLines,
          ),
        ),
      ),
    ],
  );
}
