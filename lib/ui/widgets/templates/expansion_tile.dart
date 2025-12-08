part of 'templates.dart';

class BaseExpansionTile extends StatefulWidget {
  const BaseExpansionTile({
    required this.title,
    required this.subtitle,
    required this.children,
    this.showWhenExpanded = false,
    super.key,
  });

  final String title;
  final Widget subtitle;
  final List<Widget> children;
  final bool showWhenExpanded;

  @override
  State<BaseExpansionTile> createState() => _BaseExpansionTileState();
}

class _BaseExpansionTileState extends State<BaseExpansionTile> {
  bool expanded = false;

  void onExpandedChanged(bool value) {
    setState(() {
      expanded = value;
    });
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(top: Layout.spaceML),
    child: ExpansionTile(
      title: BaseText(widget.title, style: TypoSubtitles.s3),
      subtitle: widget.showWhenExpanded || !expanded ? widget.subtitle : null,
      trailing: Icon(
        expanded ? Iconsax.arrow_up_2 : Iconsax.arrow_down_1,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      onExpansionChanged: onExpandedChanged,
      childrenPadding: BasePadding.paddingH16,
      expandedAlignment: Alignment.topLeft,
      children: <Widget>[
        for (int i = 0; i < widget.children.length; i++) ...<Widget>[
          widget.children[i],
          Spacing.spacingV12,
        ],
      ],
    ),
  );
}
