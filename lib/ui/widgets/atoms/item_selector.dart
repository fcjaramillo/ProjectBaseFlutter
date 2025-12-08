part of 'atoms.dart';

class ItemSelector extends StatelessWidget {
  final bool isSelected;
  final String title;
  const ItemSelector({
    required this.isSelected,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(right: Layout.spaceS),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Layout.spaceXS),
          border: Border.all(
            color: isSelected
                ? colorScheme.outline
                : colorScheme.surfaceContainerLowest,
          ),
        ),
        child: Padding(
          padding: BasePadding.padding_8,
          child: BaseText(title, style: TypoCaption.c1),
        ),
      ),
    );
  }
}
