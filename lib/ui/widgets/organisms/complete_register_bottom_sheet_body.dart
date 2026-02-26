part of 'organisms.dart';

class CompleteRegisterBottomSheetBody extends StatelessWidget {
  final VoidCallback onTapClose;
  final VoidCallback onTapContinue;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color? iconColor;
  final String buttonTitle;

  const CompleteRegisterBottomSheetBody({
    required this.onTapClose,
    required this.onTapContinue,
    required this.title,
    required this.subtitle,
    required this.buttonTitle,
    this.icon = Iconsax.airplane5,
    this.iconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    width: Responsive.of(context).width,
    child: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacing.spacingV24,
          BaseText(title, style: TypoSubtitles.s3),
          Spacing.spacingV12,
          const BaseDivider(),
          Spacing.spacingV12,
          Icon(
            icon,
            size: 40,
            color:
                iconColor ??
                Theme.of(context).extension<CustomThemeColors>()!.info,
          ),
          Spacing.spacingV24,
          BaseText(
            subtitle,
            style: TypoSecondary.b2r,
            textAlign: TextAlign.center,
          ),
          Spacing.spacingV24,
          BaseFilledButton(
            isFullWidth: true,
            text: buttonTitle,
            onPressed: onTapContinue,
          ),
          Spacing.spacingV24,
        ],
      ),
    ),
  );
}
