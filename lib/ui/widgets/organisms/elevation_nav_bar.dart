part of 'organisms.dart';

class ElevationNavBar extends StatelessWidget {
  final double width;
  final double height;
  final EdgeInsetsGeometry padding;
  final List<Widget> items;

  const ElevationNavBar({
    required this.width,
    required this.height,
    required this.padding,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final bool isPortrait = mediaQuery.orientation == Orientation.portrait;
    return SizedBox(
      height: height,
      width: width,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.onPrimary,
        ),
        child: Padding(
          padding: padding,
          child: isPortrait
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: items,
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: items,
                ),
        ),
      ),
    );
  }
}
