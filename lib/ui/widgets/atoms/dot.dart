part of 'atoms.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    this.color,
    super.key,
  });

  final Color? color;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.error,
          shape: BoxShape.circle,
        ),
        child: Row(
          children: <Widget>[
            Spacing.spacingH8,
            const SizedBox(
              width: Layout.spaceS,
              height: Layout.spaceS,
            ),
          ],
        ),
      );
}
