part of 'molecules.dart';

class DecisionTextPopupButton extends StatelessWidget {
  const DecisionTextPopupButton({
    required this.text,
    required this.onTapText,
    required this.items,
    required this.onTapOption,
    super.key,
  });

  final String text;
  final VoidCallback onTapText;
  final List<StringPopUpMenuItem> items;
  final void Function(String) onTapOption;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Expanded(
        child: GestureDetector(
          onTap: onTapText,
          child: BaseText(
            text,
            style: TypoLink.m.copyWith(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      Spacing.spacingH16,
      Expanded(
        child: StringPopUpMenu(
          onTapDetail: onTapOption,
          builder: AbsorbPointer(
            child: BaseFilledButton(
              text: L10n.of(context).gActionNotAvailable,
              onPressed: () {},
            ),
          ),
          items: items,
          padding: BasePadding.padding_16,
          itemWidth: 0.5,
          spacing: const EdgeInsets.symmetric(vertical: Layout.spaceXS),
        ),
      ),
    ],
  );
}
