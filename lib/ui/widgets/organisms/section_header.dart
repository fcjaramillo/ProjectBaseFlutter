part of 'organisms.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    required this.title,
    super.key,
    this.subtitle,
    this.ctaText,
    this.onCtaPressed,
    this.alignment = CrossAxisAlignment.center,
    this.titleColor,
    this.subtitleColor,
  });

  final String title;
  final String? subtitle;
  final String? ctaText;
  final VoidCallback? onCtaPressed;
  final CrossAxisAlignment alignment;
  final Color? titleColor;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    return Column(
      crossAxisAlignment: alignment,
      children: <Widget>[
        BaseText(
          title.toUpperCase(),
          style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
          textAlign: alignment == CrossAxisAlignment.center
              ? TextAlign.center
              : TextAlign.start,
        ),
        if (subtitle != null) ...<Widget>[
          SizedBox(height: isMobile ? 12 : 16),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: isMobile ? double.infinity : 700,
            ),
            child: BaseText(
              subtitle!,
              style: (isMobile ? TypoSecondary.b2r : TypoSecondary.b1r).copyWith(
                color: subtitleColor,
              ),
              textAlign: alignment == CrossAxisAlignment.center
                  ? TextAlign.center
                  : TextAlign.start,
            ),
          ),
        ],
        if (ctaText != null && onCtaPressed != null) ...<Widget>[
          SizedBox(height: isMobile ? 16 : 24),
          TextButton(
            onPressed: onCtaPressed,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  ctaText!,
                  style: TypoSecondary.b2r.copyWith(
                    color: Theme.of(context).appColors.primary.strong,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Iconsax.arrow_right_1,
                  size: 18,
                  color: Theme.of(context).appColors.primary.strong,
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
