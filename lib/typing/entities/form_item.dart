part of 'entities.dart';

class FormItem {
  final String label;
  final String value;
  final bool enabled;
  final String? Function(String?)? validator;

  const FormItem({
    required this.label,
    required this.value,
    this.enabled = true,
    this.validator,
  });

  FormItem copyWith({
    String? label,
    String? value,
    bool? enabled,
    String? Function(String?)? validator,
  }) =>
      FormItem(
        label: label ?? this.label,
        value: value ?? this.value,
        enabled: enabled ?? this.enabled,
        validator: validator ?? this.validator,
      );
}
