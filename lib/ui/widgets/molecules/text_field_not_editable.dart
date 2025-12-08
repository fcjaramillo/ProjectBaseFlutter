part of 'molecules.dart';

class TextFieldNotEditable extends StatelessWidget {
  final TextEditingController controller;
  final bool? isClickable;
  final VoidCallback? onTap;
  final String? label;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;

  const TextFieldNotEditable({
    required this.controller,
    this.isClickable = false,
    this.onTap,
    this.label,
    this.suffixIcon,
    this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: isClickable! ? onTap : null,
    child: SizedBox(
      child: AbsorbPointer(
        child: BaseTextField(
          label: label,
          controller: controller,
          suffixIcon: suffixIcon,
          onChanged: onChanged,
        ),
      ),
    ),
  );
}
