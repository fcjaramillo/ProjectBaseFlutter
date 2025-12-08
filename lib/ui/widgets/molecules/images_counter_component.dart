part of 'molecules.dart';

class ImagesCounterComponent extends StatelessWidget {
  final int length;
  final int positionIndex;

  const ImagesCounterComponent({
    required this.length,
    required this.positionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return PhysicalModel(
      color: colorScheme.onSurface.withValues(alpha: 0.4),
      borderRadius: BorderRadius.circular(Layout.spaceXS),
      child: Padding(
        padding: BasePadding.padding_4,
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: BasePadding.paddingH4,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Iconsax.gallery5,
                      color: colorScheme.onInverseSurface,
                      size: 16,
                    ),
                    Spacing.spacingH8,
                    BaseText.invert(
                      '$positionIndex/$length',
                      style: TypoCaption.c1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
