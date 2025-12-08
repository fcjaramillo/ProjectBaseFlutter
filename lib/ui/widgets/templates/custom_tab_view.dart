part of 'templates.dart';

class CustomTabView extends StatefulWidget {
  const CustomTabView({
    required this.tabs,
    required this.pages,
    required this.currentIndex,
    this.onPageChange,
    this.animationReplacement,
    super.key,
  });
  final List<String> tabs;
  final List<Widget> pages;
  final void Function(int, PageController)? onPageChange;
  final Future<void> Function(int, PageController)? animationReplacement;
  final int currentIndex;

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final PageController controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            for (int i = 0; i < widget.tabs.length; i++) ...<Widget>[
              Expanded(
                child: TabButton(
                  title: widget.tabs[i],
                  indicatorColor: widget.currentIndex == i
                      ? colorScheme.surfaceContainerHigh
                      : colorScheme.surfaceContainer,
                  textStyleColor: widget.currentIndex == i
                      ? TextStyleColor.soft
                      : TextStyleColor.subtle,
                  onTap: () => widget.animationReplacement != null
                      ? widget.animationReplacement?.call(i, controller)
                      : controller
                            .animateToPage(
                              i,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.ease,
                            )
                            .then(
                              (_) => widget.onPageChange?.call(i, controller),
                            ),
                ),
              ),
              if (i != widget.tabs.length - 1) Spacing.spacingH24,
            ],
          ],
        ),
        Spacing.spacingV12,
        Expanded(
          child: PageView(
            controller: controller,
            onPageChanged: (int i) => widget.onPageChange?.call(i, controller),
            children: widget.pages,
          ),
        ),
      ],
    );
  }
}
