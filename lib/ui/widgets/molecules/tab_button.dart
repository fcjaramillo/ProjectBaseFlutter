part of 'molecules.dart';

class TabButton extends StatelessWidget {
  final String title;
  final Color indicatorColor;
  final TextStyleColor textStyleColor;
  final VoidCallback onTap;

  const TabButton({
    required this.title,
    required this.indicatorColor,
    required this.textStyleColor,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: indicatorColor, width: 2)),
      ),
      child: Padding(
        padding: BasePadding.paddingV12,
        child: Align(
          child: BaseText.withTextStyleColor(
            title,
            textStyleColor: textStyleColor,
            style: TypoSecondary.b1s,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    ),
  );
}
