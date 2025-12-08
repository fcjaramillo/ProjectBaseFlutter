part of 'atoms.dart';

class KeyValueRow extends StatelessWidget {
  final String label;
  final String value;
  final bool enabled;
  final bool? strong;
  const KeyValueRow({
    required this.label,
    required this.value,
    required this.enabled,
    this.strong = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Opacity(
    opacity: enabled ? 1 : 0.5,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BaseText(label, style: (strong ?? false) ? TypoBody.b2s : TypoBody.b2r),
        BaseText(value, style: TypoBody.b2r),
      ],
    ),
  );
}
