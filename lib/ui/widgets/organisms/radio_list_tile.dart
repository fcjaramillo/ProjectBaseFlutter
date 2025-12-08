part of 'organisms.dart';

class BaseRadioListTile extends StatelessWidget {
  final bool selected;
  final String title;
  final Widget subtitle;
  final VoidCallback? onTap;

  const BaseRadioListTile({
    required this.selected,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(
            color: selected
                ? colorScheme.outline
                : colorScheme.surfaceContainerLow,
          ),
          borderRadius: CHRadius.r_1,
        ),
        child: Padding(
          padding: BasePadding.paddingH12V16,
          child: Row(
            children: <Widget>[
              RadioGroup<int>(
                onChanged: (int? value) {},
                groupValue: selected ? 0 : 1,
                child: Radio<int>(activeColor: colorScheme.onSurface, value: 0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    BaseText(title, style: TypoCaption.c1),
                    subtitle,
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
