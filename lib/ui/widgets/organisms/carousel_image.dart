part of 'organisms.dart';

class CarouselImage<T> extends StatefulWidget {
  final List<String> thumbnails;
  final void Function(T value)? onTap;
  final bool? isIconEnabled;
  final double? radius;
  final double? height;
  final bool showImagesCounter;
  final bool showAllInclusive;
  final bool enableOpenGallery;
  final double? savingPercent;
  final BorderRadiusGeometry? borderRadius;
  final T? data;
  final String? Function(String)? iconMealType;
  final bool isRecommended;
  final bool showCounterImages;
  final bool showRecomendedIcon;

  const CarouselImage({
    required this.thumbnails,
    required this.showAllInclusive,
    this.iconMealType,
    this.data,
    this.onTap,
    this.enableOpenGallery = false,
    this.savingPercent,
    this.borderRadius,
    this.isIconEnabled = true,
    this.showImagesCounter = false,
    this.radius,
    this.height,
    this.isRecommended = false,
    this.showCounterImages = true,
    this.showRecomendedIcon = true,
    super.key,
  });

  const CarouselImage.details({
    required this.thumbnails,
    this.iconMealType,
    this.data,
    this.onTap,
    this.savingPercent,
    this.height,
    this.isRecommended = false,
    this.showCounterImages = true,
    this.showRecomendedIcon = true,
    super.key,
  }) : isIconEnabled = false,
       radius = 0,
       showImagesCounter = true,
       showAllInclusive = false,
       enableOpenGallery = true,
       borderRadius = CHRadius.detailsCarrouselImage;

  @override
  State<CarouselImage<T>> createState() => _CarouselImageState<T>();
}

class _CarouselImageState<T> extends State<CarouselImage<T>> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  void dispose() {
    _controller;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(Layout.spaceS),
          child: CarouselSlider(
            controller: _controller,
            options: CarouselOptions(
              height: widget.height ?? 220,
              viewportFraction: 1,
              aspectRatio: 2,
              onPageChanged: (int index, CarouselPageChangedReason reason) {
                if (widget.showImagesCounter) {
                  setState(() {
                    _current = index;
                  });
                }
              },
            ),
            items: widget.thumbnails
                .map(
                  (String image) => Builder(
                    builder: (BuildContext context) => DecoratedBox(
                      decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: widget.borderRadius,
                      ),
                      child: BaseImage(
                        borderRadius: widget.borderRadius,
                        url: image,
                        fit: BoxFit.cover,
                        radius: widget.radius ?? 20,
                        width: double.infinity,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        if (widget.showCounterImages)
          Positioned(
            bottom: 10,
            right: 16,
            child: ImagesCounterComponent(
              length: widget.thumbnails.length,
              positionIndex: _current + 1,
            ),
          ),
        Positioned(
          top: 0,
          left: 0,
          child: Visibility(
            visible: widget.savingPercent != null,
            child: BaseChip(
              icon: Icon(
                Iconsax.discount_circle5,
                color: colorScheme.onInverseSurface,
                size: Layout.spaceML,
              ),
              text: '${widget.savingPercent}% off',
              backgroundColor: colorScheme.error,
              borderColor: colorScheme.error,
              style: TypoCaption.c1.semibold.copyWith(
                color: colorScheme.onInverseSurface,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(Layout.spaceS),
                bottomRight: Radius.circular(Layout.spaceS),
              ),
            ),
          ),
        ),
        Visibility(
          visible: widget.isRecommended,
          child: Align(
            alignment: Alignment.topRight,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Layout.spaceML,
                ).copyWith(top: Layout.spaceS),
                child: BaseChip(
                  icon: widget.showRecomendedIcon
                      ? SvgPicture.asset(Svgs.crown)
                      : null,
                  text: L10n.of(context).gRecommended,
                  backgroundColor: colorScheme.surfaceContainerLowest,
                  borderColor: colorScheme.surfaceContainerLowest,
                  style: TypoCaption.c1,
                  isCollapsed: true,
                  padding: const EdgeInsets.all(Layout.spaceS),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(Layout.spaceS),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
