part of 'templates.dart';

class NavBarTemplate extends StatefulWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final List<Widget> principalNavBarItems;
  final List<Widget> secondaryNavBarItems;
  final GestureTapCallback? onTapOpenBar;
  final bool isDrawerOpen;

  const NavBarTemplate({
    required this.body,
    required this.principalNavBarItems,
    required this.secondaryNavBarItems,
    required this.isDrawerOpen,
    required this.onTapOpenBar,
    this.appBar,
    super.key,
  });

  @override
  State<NavBarTemplate> createState() => _NavBarTemplateState();
}

class _NavBarTemplateState extends State<NavBarTemplate> {
  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: widget.appBar,
      body: Stack(
        children: <Widget>[
          mediaQuery.orientation == Orientation.portrait
              ? Column(
                  children: <Widget>[
                    Expanded(child: widget.body),
                    if (widget.isDrawerOpen)
                      ElevationNavBar(
                        width: mediaQuery.size.width,
                        height: Layout.spaceXXXL,
                        padding: BasePadding.paddingH16V8,
                        items: <Widget>[
                          SvgPicture.asset(
                            Svgs.navBarLogo,
                            height: Layout.spaceXL,
                          ),
                          Row(
                            spacing: Layout.spaceXXL,
                            children: widget.principalNavBarItems,
                          ),
                          Row(
                            spacing: Layout.spaceXXL,
                            children: widget.secondaryNavBarItems,
                          ),
                        ],
                      ),
                  ],
                )
              : Row(
                  children: <Widget>[
                    if (widget.isDrawerOpen)
                      ElevationNavBar(
                        width: Layout.spaceXXXL,
                        height: mediaQuery.size.height,
                        padding: BasePadding.paddingT8B12L8R8,
                        items: <Widget>[
                          Column(
                            spacing: Layout.spaceL,
                            children: <Widget>[
                              SvgPicture.asset(
                                Svgs.navBarLogo,
                                height: Layout.spaceL,
                              ),
                              ...widget.principalNavBarItems,
                            ],
                          ),
                          Column(
                            spacing: Layout.spaceXXL,
                            children: widget.secondaryNavBarItems,
                          ),
                        ],
                      ),
                    Expanded(child: widget.body),
                  ],
                ),
          if (!widget.isDrawerOpen)
            Positioned(
              bottom: 0,
              child: NavBarActionButton(
                icon: Iconsax.arrow_right_3,
                height: Layout.spaceXXXL,
                width: Layout.spaceXXXL,
                onTap: widget.onTapOpenBar,
              ),
            ),
        ],
      ),
    );
  }
}
