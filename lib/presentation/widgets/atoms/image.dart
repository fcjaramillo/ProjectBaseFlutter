part of 'atoms.dart';

class BaseImage extends StatelessWidget {
  final String url;
  final double? padding;
  final double? height;
  final double? width;
  final double radius;
  final BoxFit? fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final Color? borderColor;
  final Color? backgroundColor;
  final BlendMode? blendMode;
  final Gradient? gradient;

  const BaseImage({
    required this.url,
    this.borderRadius,
    this.padding,
    this.height,
    this.width,
    this.radius = 20,
    this.fit,
    this.color,
    this.borderColor,
    this.backgroundColor,
    this.blendMode,
    this.gradient,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: gradient,
            color: backgroundColor,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            ),
            borderRadius: borderRadius ?? BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding ?? 0),
            child: CachedNetworkImage(
              width: width,
              height: height,
              imageUrl: url,
              fit: fit ?? BoxFit.cover,
              color: color,
              colorBlendMode: blendMode,
              placeholder: (_, __) => SvgPicture.asset(
                Svgs.kInsertSvgs,
                fit: fit ?? BoxFit.cover,
                colorFilter: color != null && blendMode != null
                    ? ColorFilter.mode(
                        color!,
                        blendMode!,
                      )
                    : null,
              ),
              errorWidget: (_, __, ___) => SvgPicture.asset(
                Svgs.kInsertSvgs,
                fit: fit ?? BoxFit.cover,
                colorFilter: color != null && blendMode != null
                    ? ColorFilter.mode(
                        color!,
                        blendMode!,
                      )
                    : null,
              ),
            ),
          ),
        ),
      );
}
