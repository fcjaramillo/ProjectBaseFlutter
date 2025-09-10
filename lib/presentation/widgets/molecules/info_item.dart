part of './molecules.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    required this.title,
    required this.data,
    super.key,
  });

  const InfoItem.withType({
    required this.title,
    required this.data,
    super.key,
  });

  final String title;
  final String data;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Expanded(
            child: BaseText(
              title,
              style: TypoCaption.c1.semibold,
            ),
          ),
          BaseText.soft(
            data,
            style: TypoCaption.c1,
            textAlign: TextAlign.end,
          ),
          Spacing.spacingH4,
          SvgPicture.asset(
            Svgs.kInsertSvgs,
            height: Layout.spaceML,
            width: Layout.spaceML,
          ),
        ],
      );
}
