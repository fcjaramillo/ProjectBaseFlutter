part of 'atoms.dart';

class ParallaxItem extends StatelessWidget {
  const ParallaxItem({
    required this.url,
    this.isHorizontal = true,
    this.radius,
    super.key,
  });

  final String url;
  final bool isHorizontal;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final GlobalKey backgroundImageKey = GlobalKey();
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? Layout.spaceS),
      child: Flow(
        delegate: _ParallaxFlowDelegate(
          backgroundImageKey: backgroundImageKey,
          listItemContext: context,
          scrollable: Scrollable.of(context),
          isHorizontal: isHorizontal,
        ),
        children: <Widget>[
          BaseImage(
            url: url,
            key: backgroundImageKey,
            fit: BoxFit.cover,
            radius: Layout.spaceS,
          ),
        ],
      ),
    );
  }
}

class _ParallaxFlowDelegate extends FlowDelegate {
  _ParallaxFlowDelegate({
    required this.scrollable,
    required this.listItemContext,
    required this.backgroundImageKey,
    required this.isHorizontal,
  }) : super(repaint: scrollable.position);

  final ScrollableState scrollable;
  final BuildContext listItemContext;
  final GlobalKey backgroundImageKey;
  final bool isHorizontal;

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) =>
      BoxConstraints.tightFor(
        width: isHorizontal ? null : constraints.maxWidth,
        height: isHorizontal ? constraints.maxHeight : null,
      );

  @override
  void paintChildren(FlowPaintingContext context) {
    final RenderBox scrollableBox =
        scrollable.context.findRenderObject() as RenderBox;
    final RenderBox listItemBox =
        listItemContext.findRenderObject() as RenderBox;
    final Offset listItemOffset = listItemBox.localToGlobal(
      isHorizontal
          ? listItemBox.size.topCenter(Offset.zero)
          : listItemBox.size.centerLeft(Offset.zero),
      ancestor: scrollableBox,
    );

    final double viewportDimension = scrollable.position.viewportDimension;
    final double scrollFraction = isHorizontal
        ? (listItemOffset.dx / viewportDimension).clamp(0.0, 1.0)
        : (listItemOffset.dy / viewportDimension).clamp(0.0, 1.0);

    final Alignment alignment = isHorizontal
        ? Alignment(scrollFraction * 2 - 1, 0)
        : Alignment(0, scrollFraction * 2 - 1);

    final Size backgroundSize =
        (backgroundImageKey.currentContext!.findRenderObject() as RenderBox)
            .size;
    final Size listItemSize = context.size;
    final Rect childRect = alignment.inscribe(
      backgroundSize,
      Offset.zero & listItemSize,
    );

    context.paintChild(
      0,
      transform: Transform.translate(
        offset: isHorizontal
            ? Offset(childRect.left, 0)
            : Offset(0, childRect.top),
      ).transform,
    );
  }

  @override
  bool shouldRepaint(_ParallaxFlowDelegate oldDelegate) =>
      scrollable != oldDelegate.scrollable ||
      listItemContext != oldDelegate.listItemContext ||
      backgroundImageKey != oldDelegate.backgroundImageKey;
}
