part of 'molecules.dart';

class CheckBoxText extends StatelessWidget {
  final String text;
  final bool? value;
  final VoidCallback? onTap;
  final bool checkFirst;

  const CheckBoxText({
    required this.text,
    required this.value,
    required this.onTap,
    this.checkFirst = true,
    super.key,
  });

  const CheckBoxText._({
    required this.text,
    required this.value,
    required this.onTap,
    this.checkFirst = true,
  });

  factory CheckBoxText.checkFirst({
    required String text,
    required bool value,
    required VoidCallback onTap,
  }) => CheckBoxText._(text: text, value: value, onTap: onTap);

  factory CheckBoxText.checkSecond({
    required String text,
    required bool value,
    required VoidCallback onTap,
  }) =>
      CheckBoxText._(text: text, value: value, onTap: onTap, checkFirst: false);

  @override
  Widget build(BuildContext context) {
    final BaseCheckBox checkbox = BaseCheckBox(value ?? false, onTap: onTap!);
    final BaseText textWidget = BaseText(text, style: TypoSecondary.b2r);
    final Widget spacing = Spacing.spacingH8;

    return Row(
      children: checkFirst
          ? <Widget>[checkbox, spacing, textWidget]
          : <Widget>[textWidget, spacing, checkbox],
    );
  }
}
