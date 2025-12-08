part of 'organisms.dart';

class FeedbackBottomSheet extends StatelessWidget {
  const FeedbackBottomSheet({
    required this.type,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onPressed,
    this.buttonTextSecondary,
    this.onPressedSecondary,
    super.key,
  });

  final FeedbackBottomSheetType type;
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback? onPressed;
  final String? buttonTextSecondary;
  final VoidCallback? onPressedSecondary;

  @override
  Widget build(BuildContext context) => Padding(
    padding: BasePadding.padding_24,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Layout.spaceML,
      children: <Widget>[
        const SizedBox.shrink(),
        Icon(
          type.icon,
          color: type.color(Theme.of(context).appColors),
          size: Responsive.of(context).width * 0.25,
        ),
        const SizedBox.shrink(),
        BaseText(title, style: TypoHeadings.h4, textAlign: TextAlign.center),
        BaseText.base(
          subtitle,
          style: TypoBody.b1r,
          textAlign: TextAlign.center,
        ),
        const SizedBox.shrink(),
        BaseFilledButton(
          text: buttonText,
          onPressed: onPressed,
          isFullWidth: true,
        ),
        if (buttonTextSecondary != null)
          BaseOutlinedButton(
            text: buttonTextSecondary!,
            onPressed: onPressedSecondary,
            isFullWidth: true,
          ),
      ],
    ),
  );
}
