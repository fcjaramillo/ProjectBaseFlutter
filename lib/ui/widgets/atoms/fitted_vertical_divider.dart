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
        decoration: const BoxDecoration(
          border: Border(
            right: BorderSide(
              width: 1.5,
              color: Color.fromRGBO(211, 211, 211, 1),
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
