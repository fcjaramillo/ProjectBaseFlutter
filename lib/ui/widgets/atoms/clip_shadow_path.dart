part of 'atoms.dart';

class ClipShadowPath extends StatelessWidget {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final Widget child;

  const ClipShadowPath({
    required this.shadow,
    required this.clipper,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: ClipShadowPainter(
          clipper: clipper,
          shadow: shadow,
        ),
        child: ClipPath(
          clipper: clipper,
          child: child,
        ),
      );
}

class ClipShadowPainter extends CustomPainter {
  final BoxShadow shadow;
  final CustomClipper<Path> clipper;
  final bool shouldRebuild;

  ClipShadowPainter({
    required this.shadow,
    required this.clipper,
    this.shouldRebuild = false,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = shadow.toPaint()
      ..maskFilter = MaskFilter.blur(
        BlurStyle.normal,
        shadow.spreadRadius,
      );
    Path clipPath = clipper.getClip(size).shift(shadow.offset);
    canvas.drawPath(clipPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => shouldRebuild;
}
