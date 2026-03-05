part of 'organisms.dart';

class AppShell extends ConsumerStatefulWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  String? _previousPath;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final String currentPath = GoRouterState.of(context).uri.path;
    if (_previousPath != null && _previousPath != currentPath) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ScrollController controller = ref.read(
          appScrollControllerProvider,
        );
        if (controller.hasClients) {
          controller.jumpTo(0);
        }
      });
    }
    _previousPath = currentPath;
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < Breakpoints.tablet;
    final ScrollController scrollController = ref.watch(
      appScrollControllerProvider,
    );

    return Scaffold(
      drawer: isMobile ? const _MobileDrawer() : null,
      body: Column(
        children: <Widget>[
          const CampaignAppBar(),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  widget.child,
                  const SizedBox(height: 20),
                  const CampaignFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CampaignAppBar extends StatelessWidget {
  const CampaignAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < Breakpoints.tablet;
    final bool isTablet =
        responsive.width >= Breakpoints.tablet &&
        responsive.width < Breakpoints.desktop;

    return Container(
      height: isMobile ? 60 : 80,
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(mobile: 16, tablet: 24),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).appColors.opacity.base,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          // Logo
          GestureDetector(
            onTap: () => context.go('/'),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(Pngs.kLogo, height: isMobile ? 40 : 50),
                if (!isMobile) ...<Widget>[
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText.primary(
                        'WILLIAM CAMPIÑO',
                        style: TypoSubtitles.s2.copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      BaseText.base(
                        'Payanes de corazon',
                        style: TypoSecondary.b4r.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
          const Spacer(),
          // Navigation
          if (isMobile)
            IconButton(
              icon: const Icon(Iconsax.menu_1),
              onPressed: () => Scaffold.of(context).openDrawer(),
            )
          else
            _DesktopNavigation(isCompact: isTablet),
        ],
      ),
    );
  }
}

class _DesktopNavigation extends StatelessWidget {
  const _DesktopNavigation({this.isCompact = false});

  final bool isCompact;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      _NavItem(label: 'Inicio', path: '/', isCompact: isCompact),
      _NavItem(label: 'Candidato', path: '/candidato', isCompact: isCompact),
      _NavItem(label: 'Propuestas', path: '/propuestas', isCompact: isCompact),
      _NavItem(label: 'Agenda', path: '/agenda', isCompact: isCompact),
      _NavItem(label: 'Noticias', path: '/noticias', isCompact: isCompact),
      _NavItem(label: 'Contacto', path: '/contacto', isCompact: isCompact),
      const SizedBox(width: 16),
      _CTAButton(isCompact: isCompact),
    ],
  );
}

class _NavItem extends StatefulWidget {
  const _NavItem({
    required this.label,
    required this.path,
    this.isCompact = false,
  });

  final String label;
  final String path;
  final bool isCompact;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.path;
    final bool isActive =
        currentPath == widget.path ||
        (widget.path != '/' && currentPath.startsWith(widget.path));

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go(widget.path),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: widget.isCompact ? 12 : 16,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive
                    ? Theme.of(context).appColors.primary.strong
                    : _isHovered
                    ? Theme.of(context).appColors.primary.base
                    : const Color(0x00000000),
                width: 2,
              ),
            ),
          ),
          child: BaseText(
            widget.label,
            style: (widget.isCompact ? TypoSecondary.b3r : TypoSecondary.b2r)
                .copyWith(
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: isActive
                      ? Theme.of(context).appColors.primary.strong
                      : _isHovered
                      ? Theme.of(context).appColors.primary.base
                      : null,
                ),
          ),
        ),
      ),
    );
  }
}

class _CTAButton extends StatelessWidget {
  const _CTAButton({this.isCompact = false});

  final bool isCompact;

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: () => context.go('/apoyar'),
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).appColors.primary.strong,
      foregroundColor: Theme.of(context).appColors.neutralNoChange.subtle,
      padding: EdgeInsets.symmetric(
        horizontal: isCompact ? 16 : 24,
        vertical: isCompact ? 10 : 14,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: Text(
      'Apoyar',
      style: (isCompact ? TypoSecondary.b3r : TypoSecondary.b2r).copyWith(
        fontWeight: FontWeight.bold,
        color: Theme.of(context).appColors.neutralNoChange.subtle,
      ),
    ),
  );
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer();

  @override
  Widget build(BuildContext context) => Drawer(
    child: SafeArea(
      child: Column(
        children: <Widget>[
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.primary.soft,
            ),
            child: Row(
              children: <Widget>[
                Image.asset(Pngs.kLogo, height: 50),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText.primary(
                        'WILLIAM CAMPIÑO',
                        style: TypoSubtitles.s2.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BaseText.base(
                        'Payanes de corazon',
                        style: TypoSecondary.b4r.copyWith(
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Navigation items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 8),
              children: const <Widget>[
                _MobileNavItem(icon: Iconsax.home, label: 'Inicio', path: '/'),
                _MobileNavItem(
                  icon: Iconsax.user,
                  label: 'Sobre William',
                  path: '/candidato',
                ),
                _MobileNavItem(
                  icon: Iconsax.chart,
                  label: 'Mi Vida',
                  path: '/mi-vida',
                ),
                _MobileNavItem(
                  icon: Iconsax.eye,
                  label: 'Vision',
                  path: '/vision',
                ),
                _MobileNavItem(
                  icon: Iconsax.diagram,
                  label: 'Ejes Estrategicos',
                  path: '/ejes',
                ),
                _MobileNavItem(
                  icon: Iconsax.document_text,
                  label: 'Propuestas',
                  path: '/propuestas',
                ),
                _MobileNavItem(
                  icon: Iconsax.calculator,
                  label: 'Tu Popayan',
                  path: '/tu-popayan',
                ),
                _MobileNavItem(
                  icon: Iconsax.people,
                  label: 'Apoyos',
                  path: '/apoyos',
                ),
                _MobileNavItem(
                  icon: Iconsax.calendar,
                  label: 'Agenda',
                  path: '/agenda',
                ),
                _MobileNavItem(
                  icon: Iconsax.heart,
                  label: 'Como Apoyar',
                  path: '/apoyar',
                ),
                _MobileNavItem(
                  icon: Iconsax.note,
                  label: 'Noticias',
                  path: '/noticias',
                ),
                _MobileNavItem(
                  icon: Iconsax.gallery,
                  label: 'Galeria',
                  path: '/galeria',
                ),
                _MobileNavItem(
                  icon: Iconsax.message,
                  label: 'Contacto',
                  path: '/contacto',
                ),
                _MobileNavItem(
                  icon: Iconsax.map,
                  label: 'Territorio',
                  path: '/territorio',
                ),
              ],
            ),
          ),
          // Social links
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _SocialIconButton(
                  network: SocialNetwork.facebook,
                  onPressed: () => launchSocialUrl(SocialLinks.facebook),
                ),
                _SocialIconButton(
                  network: SocialNetwork.instagram,
                  onPressed: () => launchSocialUrl(SocialLinks.instagram),
                ),
                _SocialIconButton(
                  network: SocialNetwork.twitter,
                  onPressed: () => launchSocialUrl(SocialLinks.twitter),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

class _MobileNavItem extends StatelessWidget {
  const _MobileNavItem({
    required this.icon,
    required this.label,
    required this.path,
  });

  final IconData icon;
  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    final String currentPath = GoRouterState.of(context).uri.path;
    final bool isActive =
        currentPath == path || (path != '/' && currentPath.startsWith(path));

    return ListTile(
      leading: Icon(
        icon,
        color: isActive
            ? Theme.of(context).appColors.primary.strong
            : Theme.of(context).appColors.neutral.strong,
      ),
      title: BaseText(
        label,
        style: TypoSecondary.b2r.copyWith(
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Theme.of(context).appColors.primary.strong : null,
        ),
      ),
      selected: isActive,
      selectedTileColor: Theme.of(context).appColors.primary.soft,
      onTap: () {
        Navigator.of(context).pop(); // Close drawer
        context.go(path);
      },
    );
  }
}

class _SocialIconButton extends StatelessWidget {
  const _SocialIconButton({
    required this.network,
    required this.onPressed,
  });

  final SocialNetwork network;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
    icon: socialIcon(
      network: network,
      color: Theme.of(context).appColors.primary.strong,
    ),
    onPressed: onPressed,
  );
}

class CampaignFooter extends StatelessWidget {
  const CampaignFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(tablet: 40),
        vertical: responsive.verticalPadding(mobile: 30, tablet: 40),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.strong,
      ),
      child: isMobile ? _MobileFooter() : _DesktopFooter(),
    );
  }
}

class _DesktopFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Logo and slogan
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(Pngs.kLogo, height: 60),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseText.noChangeSubtle(
                          'WILLIAM CAMPIÑO',
                          style: TypoPrimary.h4.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        BaseText.noChangeSubtle(
                          'Payanes de corazon',
                          style: TypoSecondary.b2r.copyWith(
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                BaseText.noChangeSubtle(
                  'Juntos construiremos la Popayan moderna,\nhumana y sostenible que la ciudad merece.',
                  style: TypoSecondary.b3r,
                ),
              ],
            ),
          ),
          // Quick links
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText.noChangeSubtle(
                  'Enlaces',
                  style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _FooterLink(label: 'Propuestas', path: '/propuestas'),
                _FooterLink(label: 'Agenda', path: '/agenda'),
                _FooterLink(label: 'Noticias', path: '/noticias'),
                _FooterLink(label: 'Contacto', path: '/contacto'),
              ],
            ),
          ),
          // Contact info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText.noChangeSubtle(
                  'Contacto',
                  style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _FooterContactItem(
                  icon: Iconsax.sms,
                  text: 'contacto@gmail.com',
                ),
                _FooterContactItem(
                  icon: Iconsax.call,
                  text: '+57 300 000 0000',
                ),
                _FooterContactItem(
                  icon: Iconsax.location,
                  text: 'Popayan, Cauca',
                ),
              ],
            ),
          ),
          // Social links
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BaseText.noChangeSubtle(
                  'Redes Sociales',
                  style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    _FooterSocialIcon(
                      network: SocialNetwork.facebook,
                      onPressed: () =>
                          launchSocialUrl(SocialLinks.facebook),
                    ),
                    _FooterSocialIcon(
                      network: SocialNetwork.instagram,
                      onPressed: () =>
                          launchSocialUrl(SocialLinks.instagram),
                    ),
                    _FooterSocialIcon(
                      network: SocialNetwork.twitter,
                      onPressed: () =>
                          launchSocialUrl(SocialLinks.twitter),
                    ),
                    _FooterSocialIcon(
                      network: SocialNetwork.youtube,
                      onPressed: () =>
                          launchSocialUrl(SocialLinks.youtube),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      const SizedBox(height: 40),
      Divider(
        color: Theme.of(
          context,
        ).appColors.neutralNoChange.subtle.withValues(alpha: 0.3),
      ),
      const SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BaseText.noChangeSubtle(
            '2025 Campana William Campino. Todos los derechos reservados.',
            style: TypoSecondary.b4r,
          ),
          BaseText.noChangeSubtle(
            'Politica de privacidad | Terminos y condiciones',
            style: TypoSecondary.b4r,
          ),
        ],
      ),
    ],
  );
}

class _MobileFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      // Logo
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(Pngs.kLogo, height: 50),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText.noChangeSubtle(
                'WILLIAM CAMPIÑO',
                style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
              ),
              BaseText.noChangeSubtle(
                'Payanes de corazon',
                style: TypoSecondary.b3r.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ],
      ),
      const SizedBox(height: 24),
      // Social links
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _FooterSocialIcon(
            network: SocialNetwork.facebook,
            onPressed: () => launchSocialUrl(SocialLinks.facebook),
          ),
          _FooterSocialIcon(
            network: SocialNetwork.instagram,
            onPressed: () => launchSocialUrl(SocialLinks.instagram),
          ),
          _FooterSocialIcon(
            network: SocialNetwork.twitter,
            onPressed: () => launchSocialUrl(SocialLinks.twitter),
          ),
        ],
      ),
      const SizedBox(height: 24),
      // Quick links
      Wrap(
        spacing: 16,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: const <Widget>[
          _FooterLinkMobile(label: 'Propuestas', path: '/propuestas'),
          _FooterLinkMobile(label: 'Agenda', path: '/agenda'),
          _FooterLinkMobile(label: 'Contacto', path: '/contacto'),
        ],
      ),
      const SizedBox(height: 24),
      Divider(
        color: Theme.of(
          context,
        ).appColors.neutralNoChange.subtle.withValues(alpha: 0.3),
      ),
      const SizedBox(height: 16),
      BaseText.noChangeSubtle(
        '2025 Campana William Campino',
        style: TypoSecondary.b4r,
        textAlign: TextAlign.center,
      ),
    ],
  );
}

class _FooterLink extends StatefulWidget {
  const _FooterLink({required this.label, required this.path});

  final String label;
  final String path;

  @override
  State<_FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<_FooterLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => _isHovered = true),
    onExit: (_) => setState(() => _isHovered = false),
    child: GestureDetector(
      onTap: () => context.go(widget.path),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: BaseText.noChangeSubtle(
          widget.label,
          style: TypoSecondary.b3r.copyWith(
            decoration: _isHovered
                ? TextDecoration.underline
                : TextDecoration.none,
          ),
        ),
      ),
    ),
  );
}

class _FooterLinkMobile extends StatelessWidget {
  const _FooterLinkMobile({required this.label, required this.path});

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => context.go(path),
    child: BaseText.noChangeSubtle(label, style: TypoSecondary.b3r),
  );
}

class _FooterContactItem extends StatelessWidget {
  const _FooterContactItem({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          size: 18,
          color: Theme.of(context).appColors.neutralNoChange.subtle,
        ),
        const SizedBox(width: 8),
        BaseText.noChangeSubtle(text, style: TypoSecondary.b3r),
      ],
    ),
  );
}

class _FooterSocialIcon extends StatelessWidget {
  const _FooterSocialIcon({
    required this.network,
    required this.onPressed,
  });

  final SocialNetwork network;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
    icon: socialIcon(
      network: network,
      color: Theme.of(context).appColors.neutralNoChange.subtle,
    ),
    onPressed: onPressed,
    iconSize: 36,
  );
}
