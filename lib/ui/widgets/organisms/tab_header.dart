part of 'organisms.dart';

class TabHeader extends StatelessWidget {
  const TabHeader({
    required this.tabTitle,
    required this.currentIndex,
    required this.onPageChanged,
    super.key,
  });

  final List<String> tabTitle;
  final int currentIndex;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Row(
      children: <Widget>[
        for (int i = 0; i < tabTitle.length; i++) ...<Widget>[
          Expanded(
            child: TabButton(
              title: tabTitle[i],
              indicatorColor: currentIndex == i
                  ? colorScheme.surfaceContainerHigh
                  : colorScheme.surfaceContainer,
              textStyleColor: currentIndex == i
                  ? TextStyleColor.soft
                  : TextStyleColor.subtle,
              onTap: () => onPageChanged(i),
            ),
          ),
        ],
      ],
    );
  }
}
