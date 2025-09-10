part of 'atoms.dart';

class BaseTextArea extends StatelessWidget {
  const BaseTextArea({
    this.controller,
    this.focusNode,
    this.maxLines = 4,
    this.onChanged,
    this.label,
    this.textStyle,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final int maxLines;
  final void Function(String)? onChanged;
  final String? label;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => BaseTextField(
        controller: controller,
        focusNode: focusNode,
        maxLines: maxLines,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
        label: label,
        alignLabelWithHint: true,
        labelAsWidget: true,
        textStyle: textStyle,
        labelStyle: textStyle,
      );
}
