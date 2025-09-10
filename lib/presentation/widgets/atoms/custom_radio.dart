part of 'atoms.dart';

class BaseCustomRadio extends StatelessWidget {
  const BaseCustomRadio({
    required this.isSelected,
    this.dimension = 24,
    this.selectedBorderColor,
    this.unselectedBorderColor,
    this.selectedFillColor,
    super.key,
  });

  final Color? selectedBorderColor;
  final Color? unselectedBorderColor;
  final Color? selectedFillColor;
  final bool isSelected;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    final ColorScheme cs = Theme.of(context).colorScheme;
    final Color borderClr = isSelected
        ? (selectedBorderColor ?? cs.outline)
        : (unselectedBorderColor ?? cs.surfaceContainer);

    final Color? fillClr = isSelected
        ? (selectedFillColor ?? (selectedBorderColor ?? cs.outline))
        : null;

    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BaseRadius.circular,
        border: Border.all(color: borderClr),
      ),
      child: Padding(
        padding: EdgeInsets.all(dimension / 6),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BaseRadius.circular,
            color: fillClr,
          ),
          child: SizedBox.square(dimension: dimension * 2 / 3),
        ),
      ),
    );
  }
}
