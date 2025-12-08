part of 'molecules.dart';

class SelectItem extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool haveDivider;
  final TextStyle? textStyle;

  const SelectItem({
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.haveDivider = true,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      GestureDetector(
        onTap: onTap,
        child: ListTile(
          title: BaseText(text, style: textStyle ?? TypoCaption.c1.semibold),
          trailing: Icon(
            Iconsax.tick_circle,
            color: isSelected
                ? Theme.of(context).colorScheme.onSurface
                : Theme.of(context).colorScheme.surface,
            size: Layout.spaceL,
          ),
        ),
      ),
      Visibility(visible: haveDivider, child: const BaseDivider()),
    ],
  );
}
