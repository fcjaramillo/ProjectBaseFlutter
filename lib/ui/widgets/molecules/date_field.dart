part of 'molecules.dart';

class BaseDateField extends StatelessWidget {
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String label;

  const BaseDateField({
    required this.label,
    required this.controller,
    super.key,
    this.onChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) => BaseTextField(
    label: label,
    controller: controller,
    keyboardType: TextInputType.datetime,
    inputFormatters: <TextInputFormatter>[LengthLimitingTextInputFormatter(10)],
    onChanged: onChanged,
    validator: validator,
    maxLength: 10,
  );
}
