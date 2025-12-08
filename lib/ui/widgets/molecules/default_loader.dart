part of 'molecules.dart';

class BaseDefaultLoader extends StatelessWidget {
  const BaseDefaultLoader({this.wp, super.key});

  final double? wp;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(
      padding: BasePadding.paddingH16,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(500),
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
        child: Padding(
          padding: BasePadding.padding_16,
          child: Lottie.asset(
            width: Responsive(context).wp(wp ?? 20),
            fit: BoxFit.fitWidth,
            Animations.loading,
          ),
        ),
      ),
    ),
  );
}
