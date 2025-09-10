part of 'molecules.dart';

class BaseRadioTile extends StatelessWidget {
  const BaseRadioTile({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String text;
  final bool isSelected;
  final void Function(bool) onTap;

  @override
  Widget build(BuildContext context) {
    final CustomThemeColors customThemeColors =
        Theme.of(context).extension<CustomThemeColors>()!;
    return GestureDetector(
      onTap: () => onTap(!isSelected),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: customThemeColors.transparent,
        ),
        child: Padding(
          padding: BasePadding.paddingV8,
          child: Row(
            children: <Widget>[
              BaseCustomRadio(
                isSelected: isSelected,
              ),
              Spacing.spacingH8,
              BaseText(
                text,
                style: TypoBody.b2s,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
