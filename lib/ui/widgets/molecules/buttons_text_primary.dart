part of 'molecules.dart';

class ButtonsTextAndPrimary extends StatelessWidget {
  const ButtonsTextAndPrimary({
    required this.titleText,
    required this.titlePrimary,
    this.isActive = true,
    this.onTapText,
    this.onTapPrimary,
    super.key,
  });

  final String titleText;
  final VoidCallback? onTapText;
  final String titlePrimary;
  final VoidCallback? onTapPrimary;
  final bool isActive;

  @override
  Widget build(BuildContext context) => AbsorbPointer(
    absorbing: !isActive,
    child: Opacity(
      opacity: isActive ? 1 : 0.7,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Center(
              child: BaseTextButton(title: titleText, onTap: onTapText),
            ),
          ),
          Spacing.spacingH12,
          Expanded(
            child: BaseFilledButton(
              text: titlePrimary,
              onPressed: isActive ? onTapPrimary : null,
            ),
          ),
        ],
      ),
    ),
  );
}
