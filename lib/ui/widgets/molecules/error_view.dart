part of 'molecules.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({required this.error, this.refresh = false, super.key});

  final String? error;
  final bool refresh;

  @override
  Widget build(BuildContext context) => ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      if (refresh) ...<Widget>[
        BaseText(
          L10n.of(context).gSwipeDownReload,
          textAlign: TextAlign.center,
          style: TypoBody.b1r,
        ),
        Spacing.spacingV12,
      ],
      Center(child: Lottie.asset(Animations.development)),
      Spacing.spacingV12,
      BaseText.error(
        textAlign: TextAlign.center,
        'Error',
        style: TypoBody.b1r.copyWith(fontSize: Layout.spaceL),
      ),
      Spacing.spacingV8,
      BaseText(
        textAlign: TextAlign.center,
        error ?? kEmptyString,
        style: TypoBody.b1r,
      ),
    ],
  );
}
