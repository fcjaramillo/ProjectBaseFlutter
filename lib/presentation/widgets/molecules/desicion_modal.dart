part of 'molecules.dart';

class DesicionModal extends StatelessWidget {
  const DesicionModal({
    required this.title,
    required this.description,
    this.acceptText,
    this.cancelText,
    this.icon,
    this.backgroundColor,
    super.key,
  });

  final String title;
  final String description;
  final String? acceptText;
  final String? cancelText;
  final Widget? icon;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => PhysicalModel(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: backgroundColor ?? Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: BasePadding.paddingH16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Layout.spaceML,
                ),
                child: BaseSizedBox(),
              ),
              BaseText(
                title,
                style: TypoSubtitles.s3,
              ),
              Spacing.spacingV12,
              const BaseDivider(),
              Spacing.spacingV24,
              if (icon != null) ...<Widget>[
                icon!,
                Spacing.spacingV24,
              ],
              BaseText(
                description,
                style: TypoBody.b2r,
                textAlign: TextAlign.center,
              ),
              Spacing.spacingV12,
              DecisionButton(
                isColorReversed: true,
                secondaryText: acceptText ?? L10n.of(context).gInserText,
                primaryText: cancelText ?? L10n.of(context).gInserText,
                secondaryOnPressed: () {
                  context.pop(true);
                },
                primaryOnPressed: () {
                  context.pop(false);
                },
              ),
              Spacing.spacingV12,
            ],
          ),
        ),
      );
}
