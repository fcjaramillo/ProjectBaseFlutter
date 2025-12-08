part of 'atoms.dart';

class ClippedBorder extends StatelessWidget {
  final Widget child;
  final CustomClipper<Path> clipper;
  final BorderSide borderSide;

  const ClippedBorder({
    required this.child,
    required this.clipper,
    required this.borderSide,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _BorderPainter(clipper, borderSide),
        child: ClipPath(
          clipper: clipper,
          child: child,
        ),
      );
}

class _BorderPainter extends CustomPainter {
  final CustomClipper<Path> clipper;
  final BorderSide borderSide;

  _BorderPainter(this.clipper, this.borderSide);

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = clipper.getClip(size);
    final Paint paint = borderSide.toPaint()..style = PaintingStyle.stroke;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _BorderPainter oldDelegate) =>
      oldDelegate.clipper != clipper || oldDelegate.borderSide != borderSide;
}
