part of 'organisms.dart';

class BaseAlertDialog extends StatelessWidget {
  final Color? backgroundColor;
  final double? height;
  final double? width;
  final String title;
  final String subtitle;
  final bool showIcon;
  final Widget? icon;
  final String? textPrimeryButton;
  final String? textSecondaryButton;
  final VoidCallback? primaryOnPressed;
  final VoidCallback? secondaryOnPressed;
  final double radius;

  const BaseAlertDialog({
    required this.title,
    required this.subtitle,
    this.showIcon = true,
    this.icon,
    this.backgroundColor,
    this.height,
    this.width,
    this.primaryOnPressed,
    this.secondaryOnPressed,
    this.textPrimeryButton,
    this.textSecondaryButton,
    this.radius = Layout.spaceXS,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.surfaceBright,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        contentPadding: BasePadding.padding_24,
        content: SizedBox(
          height: height,
          width: width ?? Responsive.of(context).width,
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                if (showIcon && icon != null) icon!,
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: Layout.spaceM),
                  child: BaseText(title, style: TypoSubtitles.s3),
                ),
                BaseText(subtitle, style: TypoBody.b2r),
                Spacing.spacingV24,
                DecisionButton(
                  primaryText: textPrimeryButton ?? L10n.of(context).gSkip,
                  secondaryText:
                      textSecondaryButton ?? L10n.of(context).gContinue,
                  primaryOnPressed: primaryOnPressed,
                  secondaryOnPressed: secondaryOnPressed,
                  isColorReversed: true,
                ),
              ],
            ),
          ),
        ),
      );
}
