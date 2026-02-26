part of 'organisms.dart';

class TeamStatistics extends StatelessWidget {
  const TeamStatistics({
    required this.cantidad,
    required this.descripcion,
    required this.color,
    super.key,
  });

  final String cantidad;
  final String descripcion;
  final Color color;

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      SizedBox(
        height: 150,
        width: 300,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.neutral.soft.withAlpha(70),
          ),
          child: Center(
            child: BaseText.noChangeStrong(cantidad, style: TypoPrimary.h1),
          ),
        ),
      ),
      SizedBox(
        height: 75,
        width: 300,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.neutral.base,
          ),
          child: Center(
            child: BaseText.noChangeStrong(
              descripcion,
              style: TypoSecondary.b1s,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
        width: 300,
        child: DecoratedBox(decoration: BoxDecoration(color: color)),
      ),
    ],
  );
}
