part of 'molecules.dart';

class TagContained extends StatelessWidget {
  const TagContained({
    required this.text,
    required this.color,
    this.borderRadius = BaseRadius.rRl2,
    super.key,
  });

  final String text;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: BasePadding.padding_8,
          child: BaseText.invert(
            text,
            style: TypoCaption.c1,
          ),
        ),
      );
}
