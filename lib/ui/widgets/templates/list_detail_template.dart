part of 'templates.dart';

class ListDetailTemplate extends StatelessWidget {
  const ListDetailTemplate({
    required this.title,
    required this.subtitle,
    required this.items,
    this.onTapItem,
    this.titleAppBar,
    this.extraWidget,
    super.key,
  });

  final String title;
  final String subtitle;
  final List<Widget> items;
  final String? titleAppBar;
  final void Function(int)? onTapItem;
  final Widget? extraWidget;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: BaseAppBar(title: titleAppBar ?? L10n.of(context).gNotAvailable),
    body: SingleChildScrollView(
      child: Padding(
        padding: BasePadding.padding_16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BaseText(title, style: TypoPrimary.h4),
            Spacing.spacingV8,
            BaseText.soft(subtitle, style: TypoSecondary.b1r),
            if (extraWidget != null) ...<Widget>[
              Spacing.spacingV4,
              extraWidget!,
            ],
            Spacing.spacingV4,
            ...List<Widget>.generate(
              items.length,
              (int index) => Padding(
                padding: const EdgeInsets.only(top: Layout.spaceM),
                child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => onTapItem?.call(index),
                    child: BaseOutlinedCard(
                      backgroundColor: Theme.of(
                        context,
                      ).colorScheme.surfaceBright,
                      children: <Widget>[items[index]],
                    ),
                  ),
                ),
              ),
            ),
            Spacing.spacingV24,
          ],
        ),
      ),
    ),
  );
}
