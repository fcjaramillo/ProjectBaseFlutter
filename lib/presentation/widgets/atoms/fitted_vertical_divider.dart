part of 'atoms.dart';

class FittedVerticalDivider extends StatelessWidget {
  const FittedVerticalDivider({
    required this.child,
    this.separation = Layout.spaceM,
    super.key,
  });

  final Widget child;
  final double separation;

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1.5,
              color: Theme.of(context).colorScheme.surfaceContainerHigh,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            right: separation,
          ),
          child: child,
        ),
      );
}
