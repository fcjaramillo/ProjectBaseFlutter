part of 'atoms.dart';

class TextWithVerticalDivider extends StatelessWidget {
  const TextWithVerticalDivider(
    this.text, {
    this.style,
    this.separation = Layout.spaceM,
    super.key,
  });

  final String text;
  final TextStyle? style;
  final double separation;

  @override
  Widget build(BuildContext context) => FittedVerticalDivider(
    separation: separation,
    child: BaseText.soft(text, style: style ?? TypoCaption.c1.semibold),
  );
}
