part of 'organisms.dart';

class FadeImageScrollDelegate extends ConsumerStatefulWidget {
  final List<String> images;
  final bool useAsset;

  const FadeImageScrollDelegate({
    required this.images,
    this.useAsset = true,
    super.key,
  });

  @override
  ConsumerState<FadeImageScrollDelegate> createState() =>
      _FadeImageScrollDelegateState();
}

class _FadeImageScrollDelegateState
    extends ConsumerState<FadeImageScrollDelegate> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ref.read(appScrollControllerProvider);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() => setState(() {});

  double _calculateOpacity(int index, double progress, int total) {
    final double segment = 1.0 / (total - 1);
    final double targetPos = index * segment;
    final double distance = (progress - targetPos).abs();
    return (1.0 - (distance / segment)).clamp(0.0, 1.0);
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double animationHeight = responsive.value<double>(
      mobile: 900,
      tablet: 1400,
      desktop: 2000,
    );

    final double imageSize = responsive.value<double>(
      mobile: 280,
      tablet: 450,
      desktop: 680,
    );

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final RenderBox? renderBox =
            context.findRenderObject() as RenderBox?;
        final double offsetTop =
            renderBox?.localToGlobal(Offset.zero).dy ?? 0;
        final double screenHeight = MediaQuery.of(context).size.height;

        double progress = 0;
        if (offsetTop <= 0) {
          progress = (offsetTop.abs() / animationHeight).clamp(0.0, 1.0);
        }

        return SizedBox(
          height: animationHeight + screenHeight,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: offsetTop < 0 ? offsetTop.abs() : 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: screenHeight,
                  child: Center(
                    child: SizedBox(
                      width: imageSize,
                      height: imageSize,
                      child: Stack(
                        fit: StackFit.expand,
                        children: List<Widget>.generate(
                          widget.images.length,
                          (int index) => Opacity(
                            opacity: _calculateOpacity(
                              index,
                              progress,
                              widget.images.length,
                            ),
                            child: widget.useAsset
                                ? Image.asset(
                                    widget.images[index],
                                    fit: BoxFit.cover,
                                  )
                                : Image.network(
                                    widget.images[index],
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
