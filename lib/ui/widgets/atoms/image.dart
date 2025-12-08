part of 'atoms.dart';

class BaseImage extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final BlendMode? blendMode;
  final Gradient? gradient;
  final List<BoxShadow>? boxShadow;

  const BaseImage({
    required this.url,
    this.borderRadius,
    this.height,
    this.width,
    this.radius = 20,
    this.fit,
    this.color,
    this.blendMode,
    this.gradient,
    this.boxShadow,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
    borderRadius: borderRadius ?? BorderRadius.circular(radius),
    child: DecoratedBox(
      decoration: BoxDecoration(gradient: gradient, boxShadow: boxShadow),
      child: DecoratedBox(
        position: DecorationPosition.foreground,
        decoration: BoxDecoration(gradient: gradient),
        child: CachedNetworkImage(
          width: width,
          height: height,
          imageUrl: url,
          fit: fit ?? BoxFit.cover,
          color: color,
          colorBlendMode: blendMode,
          placeholder: (_, _) => SvgPicture.asset(
            Svgs.emptyImage,
            fit: fit ?? BoxFit.cover,
            colorFilter: color != null && blendMode != null
                ? ColorFilter.mode(color!, blendMode!)
                : null,
          ),
          errorWidget: (_, _, _) => Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Image.asset(
                Pngs.pendingPhoto,
                fit: fit ?? BoxFit.cover,
                color: color,
                colorBlendMode: blendMode,
                width: width,
                height: height,
              ),
              BaseText.noChangeSubtle(
                L10n.of(context).gNotAvailable,
                style: TypoSubtitles.s3,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
