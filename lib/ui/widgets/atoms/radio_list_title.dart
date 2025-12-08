part of 'atoms.dart';

class BaseRadioListTitle<T> extends StatelessWidget {
  const BaseRadioListTitle({
    required this.value,
    this.groupValue,
    this.onChanged,
    this.title,
    this.subtitle,
    this.selected = false,
    this.controlAffinity = ListTileControlAffinity.leading,
    this.contentPadding,
    this.dense = true,
    this.visualDensity,
    super.key,
  });

  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  final Widget? title;
  final Widget? subtitle;
  final bool selected;
  final ListTileControlAffinity controlAffinity;
  final EdgeInsetsGeometry? contentPadding;
  final bool dense;
  final VisualDensity? visualDensity;

  @override
  Widget build(BuildContext context) => RadioGroup<T>(
    onChanged: onChanged ?? (T? value) {},
    groupValue: groupValue,
    child: RadioListTile<T>.adaptive(
      value: value,
      activeColor: Theme.of(context).colorScheme.onSurface,
      selected: selected,
      title: title,
      subtitle: subtitle,
      controlAffinity: controlAffinity,
      contentPadding: contentPadding ?? EdgeInsets.zero,
      dense: dense,
      visualDensity: visualDensity,
    ),
  );
}
