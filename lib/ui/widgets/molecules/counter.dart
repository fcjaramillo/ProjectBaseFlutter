part of 'molecules.dart';

class Counter extends StatelessWidget {
  final bool selected;
  final VoidCallback? onTapLess;
  final VoidCallback? onTapAdd;
  final String text;
  final Color? backgroundColorSelected;

  const Counter({
    required this.selected,
    required this.text,
    this.onTapLess,
    this.onTapAdd,
    this.backgroundColorSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      GestureDetector(
        onTap: onTapLess,
        child: CircleIcon(
          icon: Iconsax.minus,
          selected: selected,
          backgroundColorSelected: backgroundColorSelected,
        ),
      ),
      Spacing.spacingH16,
      SizedBox(
        width: 20,
        child: Center(child: BaseText(text, style: TypoBody.b1r)),
      ),
      Spacing.spacingH16,
      GestureDetector(
        onTap: onTapAdd,
        child: CircleIcon(
          icon: Iconsax.add,
          selected: true,
          backgroundColorSelected: backgroundColorSelected,
        ),
      ),
    ],
  );
}
