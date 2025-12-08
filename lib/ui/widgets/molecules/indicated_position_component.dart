part of 'molecules.dart';

class IndicatedPositionComponent extends StatelessWidget {
  final int length;
  final int positionIndex;
  final Color? selectedColor;
  final Color? disableColor;
  final Function(int)? onTap;

  const IndicatedPositionComponent({
    required this.length,
    required this.positionIndex,
    this.selectedColor,
    this.disableColor,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        for (int i = 0; i < length; i++)
          GestureDetector(
            onTap: () {
              onTap?.call(i);
            },
            child: Visibility(
              visible: positionIndex == i,
              replacement: Padding(
                padding: BasePadding.paddingH4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: disableColor ?? colorScheme.onInverseSurface,
                    shape: BoxShape.circle,
                    border: Border.all(color: colorScheme.surfaceContainerHigh),
                  ),
                  child: const SizedBox(height: 10, width: 10),
                ),
              ),
              child: Padding(
                padding: BasePadding.paddingH4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: selectedColor ?? colorScheme.onInverseSurface,
                    ),
                  ),
                  child: const SizedBox(
                    height: Layout.spaceM,
                    width: Layout.spaceM,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
