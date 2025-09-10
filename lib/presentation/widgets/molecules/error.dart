part of 'molecules.dart';

class BaseError extends StatelessWidget {
  const BaseError({
    this.onTap,
    this.description,
    super.key,
  });

  final VoidCallback? onTap;
  final String? description;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Iconsax.close_circle5,
              size: 40,
              color: colorScheme.error,
            ),
            Spacing.spacingV32,
            BaseText(
              L10n.of(context).gSomethingWrong,
              style: TypoHeadings.h4,
            ),
            Spacing.spacingV12,
            BaseText(
              description ?? L10n.of(context).gPleaseClickHereToRetry,
              style: TypoBody.b1r,
            ),
          ],
        ),
      ),
    );
  }
}
