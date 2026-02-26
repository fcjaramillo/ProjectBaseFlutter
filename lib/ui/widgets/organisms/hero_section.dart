part of 'organisms.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    this.backgroundImage,
    this.title = 'WILLIAM CAMPIÑO',
    this.slogan = 'Payanes de corazon',
    this.subtitle,
    this.ctaText = 'Conoce mas',
    this.onCtaPressed,
  });

  final String? backgroundImage;
  final String title;
  final String slogan;
  final String? subtitle;
  final String ctaText;
  final VoidCallback? onCtaPressed;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final double heroHeight = isMobile ? responsive.hp(80) : responsive.hp(100);

    return SizedBox(
      height: heroHeight,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Background image
          if (backgroundImage != null)
            Image.asset(backgroundImage!, fit: BoxFit.cover)
          else
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Theme.of(context).appColors.primary.strong,
                    Theme.of(context).appColors.secondary.strong,
                  ],
                ),
              ),
            ),

          // Overlay gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  const Color(0x00000000),
                  Theme.of(
                    context,
                  ).appColors.opacity.base.withValues(alpha: 0.7),
                ],
              ),
            ),
          ),

          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  // Slogan
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 16 : 24,
                      vertical: isMobile ? 8 : 12,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).appColors.neutralNoChange.subtle.withValues(alpha: 0.9),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: BaseText.primary(
                      slogan.toUpperCase(),
                      style: (isMobile ? TypoSubtitles.s2 : TypoSubtitles.s1)
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                          ),
                    ),
                  ),
                  SizedBox(height: isMobile ? 16 : 24),
                  // Title
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      BaseText.noChangeSubtle(
                        title,
                        style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1)
                            .copyWith(
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.5,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  if (subtitle != null) ...<Widget>[
                    SizedBox(height: isMobile ? 16 : 24),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: isMobile ? double.infinity : 600,
                      ),
                      child: BaseText.noChangeSubtle(
                        subtitle!,
                        style: (isMobile
                            ? TypoSecondary.b2r
                            : TypoSecondary.b1r),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                  SizedBox(height: isMobile ? 24 : 32),
                  // CTA Button
                  if (onCtaPressed != null)
                    ElevatedButton(
                      onPressed: onCtaPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(
                          context,
                        ).appColors.primary.strong,
                        foregroundColor: Theme.of(
                          context,
                        ).appColors.neutralNoChange.subtle,
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 32 : 48,
                          vertical: isMobile ? 16 : 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        ctaText,
                        style:
                            (isMobile ? TypoSecondary.b2r : TypoSecondary.b1r)
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(
                                    context,
                                  ).appColors.neutralNoChange.subtle,
                                ),
                      ),
                    ),
                  const Spacer(),
                  // Scroll indicator
                  Column(
                    children: <Widget>[
                      BaseText.noChangeSubtle(
                        'Desliza hacia abajo',
                        style: TypoSecondary.b4r,
                      ),
                      const SizedBox(height: 8),
                      Icon(
                        Iconsax.arrow_down_1,
                        color: Theme.of(
                          context,
                        ).appColors.neutralNoChange.subtle,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
