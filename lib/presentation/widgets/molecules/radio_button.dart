part of 'molecules.dart';

class BaseRadioButton<T> extends StatelessWidget {
  final String text;
  final T selected;
  final T value;
  final void Function(T?) onTap;

  const BaseRadioButton({
    required this.selected,
    required this.text,
    required this.onTap,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => onTap(value),
        child: Row(
          children: <Widget>[
            Expanded(
              child: BaseText(
                text,
                style: TypoCaption.c1,
              ),
            ),
            RadioGroup<T>(
              onChanged: onTap,
              groupValue: selected,
              child: Radio<T>(
                value: value,
                activeColor: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );
}
