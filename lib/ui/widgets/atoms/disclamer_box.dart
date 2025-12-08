part of 'atoms.dart';

class BaseDisclamerBox extends StatelessWidget {
  const BaseDisclamerBox({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surfaceContainerLowest,
      borderRadius: CHRadius.r_2,
      border: Border.all(
        color: Theme.of(context).colorScheme.surfaceContainerLow,
      ),
    ),
    child: Padding(
      padding: BasePadding.padding_12,
      child: BaseText(text, style: TypoBody.b3r),
    ),
  );
}
