part of 'molecules.dart';

class SelectionChipBar extends StatelessWidget {
  const SelectionChipBar({
    required this.options,
    required this.onTap,
    required this.selectedOption,
    this.backgroundColor,
    this.pageController,
    this.controller,
    super.key,
  });

  final List<String> options;
  final void Function(int) onTap;
  final PageController? pageController;
  final ScrollController? controller;
  final String selectedOption;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: Layout.spaceL,
    ).copyWith(top: Layout.spaceS),
    child: DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).colorScheme.surfaceContainerLowest,
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          controller: controller,
          child: Row(
            children: <Widget>[
              for (int i = 0; i < options.length; i++) ...<Widget>[
                GestureDetector(
                  onTap: () {
                    onTap(i);
                    pageController?.jumpToPage(i);
                  },
                  child: TweenAnimationBuilder<Color?>(
                    tween: ColorTween(
                      begin: selectedOption == options[i]
                          ? Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest
                          : Theme.of(context).colorScheme.onSurface,
                      end: selectedOption == options[i]
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                    ),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.bounceInOut,
                    builder: (_, Color? color, Widget? child) => DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color:
                                color ??
                                Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                          ),
                        ),
                      ),
                      child: child,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Layout.spaceL),
                      child: BaseText.withTextStyleColor(
                        options[i],
                        textStyleColor: selectedOption == options[i]
                            ? TextStyleColor.strong
                            : TextStyleColor.subtle,
                        style: TypoButton.b2,
                      ),
                    ),
                  ),
                ),
                Spacing.spacingH12,
              ],
            ],
          ),
        ),
      ),
    ),
  );
}

class NewSelectionChipBar extends StatelessWidget {
  const NewSelectionChipBar({
    required this.options,
    required this.onTap,
    required this.selectedOption,
    this.backgroundColor,
    this.pageController,
    this.controller,
    this.padding,
    super.key,
  });

  final List<String> options;
  final void Function(int) onTap;
  final PageController? pageController;
  final ScrollController? controller;
  final String selectedOption;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) => Padding(
    padding: padding ?? const EdgeInsets.only(top: Layout.spaceML),
    child: SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        controller: controller,
        child: Row(
          children: <Widget>[
            for (int i = 0; i < options.length; i++) ...<Widget>[
              GestureDetector(
                onTap: () {
                  onTap(i);
                  pageController?.jumpToPage(i);
                },
                child: BaseChip.selection(
                  selected: selectedOption == options[i],
                  textStyleColor: selectedOption == options[i]
                      ? TextStyleColor.invert
                      : TextStyleColor.strong,
                  text: options[i],
                  padding: BasePadding.paddingH16V8,
                ),
              ),
              Spacing.spacingH12,
            ],
          ],
        ),
      ),
    ),
  );
}
