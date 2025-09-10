part of 'atoms.dart';

class BaseRichText extends StatelessWidget {
  final String textPrimary;
  final String textSecondary;
  final Color? colorPrimary;
  final Color? colorSecondary;
  final VoidCallback? onTap;
  final TextStyle? stylePrimary;
  final TextStyle? styleSecondary;
  final bool? previousTextHasSpace;

  const BaseRichText({
    required this.textPrimary,
    required this.textSecondary,
    this.colorPrimary,
    this.colorSecondary,
    this.onTap,
    this.stylePrimary,
    this.styleSecondary,
    this.previousTextHasSpace = true,
    super.key,
  });

  BaseRichText.typoB2({
    required this.textPrimary,
    required this.textSecondary,
    this.colorPrimary,
    this.colorSecondary,
    this.onTap,
    this.previousTextHasSpace = true,
    super.key,
  })  : stylePrimary = TypoBody.b2s,
        styleSecondary = TypoBody.b2r;

  BaseRichText.typoB2r({
    required this.textPrimary,
    required this.textSecondary,
    this.colorPrimary,
    this.colorSecondary,
    this.onTap,
    this.previousTextHasSpace = true,
    super.key,
  })  : stylePrimary = TypoBody.b2r,
        styleSecondary = TypoBody.b2r;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: (previousTextHasSpace ?? true) ? '$textPrimary ' : textPrimary,
        style: stylePrimary?.copyWith(
              color: colorPrimary ?? colorScheme.onSurface,
            ) ??
            TypoBody.b2r.copyWith(
              color: colorPrimary ?? colorScheme.onSurface,
            ),
        children: <TextSpan>[
          TextSpan(
            text: textSecondary,
            style: styleSecondary?.copyWith(
                  color: colorSecondary ?? colorScheme.onSurface,
                ) ??
                TypoBody.b2r.copyWith(
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                  color: colorSecondary ?? colorScheme.onSurface,
                  overflow: TextOverflow.ellipsis,
                ),
            recognizer: TapGestureRecognizer()..onTap = onTap,
          ),
        ],
      ),
    );
  }
}
