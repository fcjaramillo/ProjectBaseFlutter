part of 'molecules.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onTapBack;
  final IconData? leadingIcon;
  final bool showBackButton;

  final bool justClose;

  const BaseAppBar({
    required this.title,
    this.actions,
    this.onTapBack,
    this.leadingIcon,
    this.showBackButton = true,
    super.key,
  }) : justClose = false;

  const BaseAppBar.justBack({
    required this.onTapBack,
    super.key,
  })  : title = '',
        actions = null,
        leadingIcon = null,
        showBackButton = false,
        justClose = true;

  @override
  Widget build(BuildContext context) => justClose
      ? AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.close,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              onPressed: onTapBack,
            ),
          ],
          title: Row(
            children: <Widget>[
              Image.asset(
                Pngs.kInsertPngs,
                height: 50,
                width: 150,
              ),
              const Spacer(),
            ],
          ),
        )
      : AppBar(
          centerTitle: true,
          actions: actions,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: BaseDivider(),
          ),
          leading: Visibility(
            visible: showBackButton,
            child: GestureDetector(
              onTap: () {
                onTapBack != null ? onTapBack!() : context.pop();
              },
              child: Icon(
                leadingIcon ?? Iconsax.arrow_left_2,
                color: Theme.of(context).colorScheme.onSurface,
                size: Layout.spaceL,
              ),
            ),
          ),
          title: BaseText(
            title,
            style: TypoBody.b2s,
          ),
        );

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
