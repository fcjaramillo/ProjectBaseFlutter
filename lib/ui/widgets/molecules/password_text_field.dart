part of 'molecules.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    required this.controller,
    required this.label,
    required this.onChanged,
    this.onTapTextField,
    this.textCapitalization,
    this.validator,
    this.errorMaxLines,
    super.key,
  });

  final TextEditingController controller;
  final VoidCallback? onTapTextField;
  final String label;
  final void Function(String)? onChanged;
  final TextCapitalization? textCapitalization;
  final String? Function(String?)? validator;
  final int? errorMaxLines;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isMaskedPassword = true;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return BaseTextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      suffixIcon: isMaskedPassword ? Iconsax.eye_slash : Iconsax.eye,
      suffixIconColor: colorScheme.surfaceContainerHigh,
      validator: widget.validator,
      label: widget.label,
      onTapSuffixIcon: () {
        setState(() {
          isMaskedPassword = !isMaskedPassword;
        });
      },
      isObscureText: isMaskedPassword,
      onTapTextField: widget.onTapTextField,
      textCapitalization:
          widget.textCapitalization ?? TextCapitalization.sentences,
      textStyle: TypoSecondary.b1r,
      errorMaxLines: widget.errorMaxLines,
    );
  }
}
