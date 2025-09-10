part of 'organisms.dart';

class AccordionCardDetailCharges extends StatelessWidget {
  const AccordionCardDetailCharges({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => BaseCustomExpansionTile(
        controlAffinity: ListTileControlAffinity.trailing,
        mainAxisAlignmentTitleExpanded: MainAxisAlignment.start,
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        titlePadding: const EdgeInsets.symmetric(
          horizontal: Layout.spaceM,
          vertical: Layout.spaceML,
        ),
        decorationTitle: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.surfaceContainerLow,
            ),
          ),
        ),
        decorationContent: const BoxDecoration(),
        titleWidget: Expanded(
          child: BaseText(
            title,
            style: TypoBody.b2s,
          ),
        ),
        children: children,
      );
}
