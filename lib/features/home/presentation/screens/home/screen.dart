part of 'home.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  static Route<void> goTo() => MaterialPageRoute<void>(
    builder: (_) => const HomeScreen(),
    settings: const RouteSettings(name: Routes.kRouteHome),
  );

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).loadHomeData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Hero Section
        _buildHeroSection(context, responsive),

        // About Section
        _buildAboutSection(context, responsive),

        // Strategic Axes Section
        _buildAxesSection(context, responsive),

        // Events Section
        _buildEventsSection(context, responsive),

        // News Section
        _buildNewsSection(context, responsive),

        // Territory Section
        _buildTerritorySection(context, responsive),

        // Citizen Investment Banner
        _buildInvestmentBannerSection(context, responsive),

        // CTA Section
        _buildCtaSection(context, responsive),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, Responsive responsive) =>
      HeroSection(
        backgroundImage: Pngs.kHome3,
        subtitle:
            'Con compromiso, experiencia y amor por la tierra blanca, juntos '
            'construiremos la Popayan moderna, humana y sostenible que la '
            'ciudad merece.',
        onCtaPressed: () => context.go('/candidato'),
      );

  Widget _buildAboutSection(BuildContext context, Responsive responsive) {
    final bool isMobile =
        responsive.isMobileOrTablet && responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(
            title: 'Sobre William',
            subtitle:
                'Una trayectoria construida desde la honestidad, el trabajo '
                'en comunidad y la defensa del Cauca.',
          ),
          SizedBox(height: responsive.spacing(mobile: 40, desktop: 60)),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: responsive.maxContentWidth),
            child: ResponsiveRowColumn(
              breakpoint: Breakpoints.tablet,
              rowSpacing: 60,
              columnSpacing: 32,
              children: <Widget>[
                if (!isMobile)
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(
                        Pngs.kHome3,
                        height: 400,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildHighlight(
                        context,
                        '+24 años',
                        'de servicio en la Policia Nacional',
                      ),
                      const SizedBox(height: 20),
                      _buildHighlight(
                        context,
                        '+18 años',
                        'de liderazgo en Comunicaciones Estrategicas',
                      ),
                      const SizedBox(height: 20),
                      _buildHighlight(
                        context,
                        '111',
                        'felicitaciones especiales por labor profesional',
                      ),
                      const SizedBox(height: 20),
                      _buildHighlight(
                        context,
                        '19',
                        'condecoraciones de instituciones',
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () => context.go('/mi-vida'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).appColors.primary.strong,
                          foregroundColor: Theme.of(
                            context,
                          ).appColors.neutralNoChange.subtle,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 16,
                          ),
                        ),
                        child: const Text('Ver mi historia'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHighlight(BuildContext context, String number, String text) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText.primary(
            number,
            style: TypoPrimary.h3.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Expanded(child: BaseText(text, style: TypoSecondary.b2r)),
        ],
      );

  Widget _buildAxesSection(BuildContext context, Responsive responsive) {
    final int crossAxisCount = responsive.gridColumns(desktop: 4);
    final bool isMobile = responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.tertiary.subtle,
      ),
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: 'Ejes Estrategicos',
            subtitle:
                'Nuestra propuesta se fundamenta en cuatro pilares '
                'esenciales para transformar Popayan.',
            ctaText: 'Ver propuestas',
            onCtaPressed: () => context.go('/propuestas'),
          ),
          SizedBox(height: responsive.spacing(mobile: 40, desktop: 60)),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: isMobile ? 1.4 : 1.2,
            children: <Widget>[
              StrategicAxisCard(
                title: 'Seguridad',
                description:
                    'Una ciudad segura donde puedas caminar tranquilo '
                    'con tu familia.',
                icon: Iconsax.shield_tick,
                color: Theme.of(context).appColors.error.strong,
                onTap: () => context.go('/propuestas'),
              ),
              StrategicAxisCard(
                title: 'Economia',
                description:
                    'Impulso al emprendimiento y generacion de empleo '
                    'para todos.',
                icon: Iconsax.chart,
                color: Theme.of(context).appColors.success.strong,
                onTap: () => context.go('/propuestas'),
              ),
              StrategicAxisCard(
                title: 'Educacion',
                description:
                    'Educacion de calidad como motor del desarrollo social.',
                icon: Iconsax.teacher,
                color: Theme.of(context).appColors.informative.strong,
                onTap: () => context.go('/propuestas'),
              ),
              StrategicAxisCard(
                title: 'Movilidad',
                description:
                    'Transporte eficiente y vias que conecten a toda '
                    'la ciudad.',
                icon: Iconsax.car,
                color: Theme.of(context).appColors.warning.strong,
                onTap: () => context.go('/propuestas'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInvestmentBannerSection(
    BuildContext context,
    Responsive responsive,
  ) {
    final bool isMobile = responsive.width < Breakpoints.tablet;
    final Color white = Theme.of(context).appColors.neutralNoChange.subtle;
    final Color primary = Theme.of(context).appColors.primary.strong;
    final Color warning = Theme.of(context).appColors.warning.strong;

    final Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(Iconsax.chart_1, color: white, size: 28),
            const SizedBox(width: 12),
            BaseText.noChangeSubtle(
              'TU POPAYÁN',
              style: TypoSubtitles.s2.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        BaseText.noChangeSubtle(
          '¿Cómo invertirías 830 mil millones de pesos en Popayán? '
          'Tú decides las prioridades.',
          style: isMobile ? TypoSecondary.b3r : TypoSecondary.b2r,
        ),
        const SizedBox(height: 16),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: LinearProgressIndicator(
            value: 0.65,
            backgroundColor: white.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(
              white.withValues(alpha: 0.7),
            ),
            minHeight: 6,
          ),
        ),
        const SizedBox(height: 6),
        BaseText.noChangeSubtle(
          '~65% del presupuesto municipal',
          style: TypoSecondary.b4r.copyWith(
            color: white.withValues(alpha: 0.7),
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () => context.go(Routes.citizenInvestment),
          icon: Icon(Iconsax.calculator, color: primary),
          label: Text(
            'Calcular mi inversión',
            style: TypoSecondary.b3r.copyWith(
              color: primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: white,
            foregroundColor: primary,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 32,
              vertical: 14,
            ),
          ),
        ),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 24 : 36),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  primary,
                  Theme.of(context).appColors.secondary.strong,
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: isMobile
                ? content
                : Row(
                    children: <Widget>[
                      Expanded(child: content),
                      const SizedBox(width: 32),
                      Icon(
                        Iconsax.money_recive,
                        size: 72,
                        color: white.withValues(alpha: 0.25),
                      ),
                    ],
                  ),
          ),
          // Badge "NUEVO"
          Positioned(
            top: -12,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: warning,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(Iconsax.star, color: white, size: 14),
                  const SizedBox(width: 4),
                  BaseText.noChangeSubtle(
                    'NUEVO',
                    style: TypoSecondary.b4r.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsSection(BuildContext context, Responsive responsive) {
    final HomeState homeState = ref.watch(homeViewModelProvider);
    final int crossAxisCount = responsive.gridColumns();
    final bool isMobile = responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: 'Proximos Eventos',
            subtitle: 'Acompananos en nuestros encuentros con la comunidad.',
            ctaText: 'Ver agenda completa',
            onCtaPressed: () => context.go('/agenda'),
          ),
          SizedBox(height: responsive.spacing(mobile: 40, desktop: 60)),
          if (homeState.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (homeState.featuredEvents.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: BaseText(
                  'Próximamente nuevos eventos.',
                  style: TypoSecondary.b2r,
                ),
              ),
            )
          else
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.2 : 1.0,
              children: homeState.featuredEvents
                  .map(
                    (CampaignEvent event) => EventCard(
                      title: event.title,
                      date: event.eventDate,
                      time: event.eventTime,
                      location: event.location,
                      isFeatured: event.isFeatured,
                      onTap: () => context.go('/agenda/${event.id}'),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildNewsSection(BuildContext context, Responsive responsive) {
    final HomeState homeState = ref.watch(homeViewModelProvider);
    final int crossAxisCount = responsive.gridColumns();
    final bool isMobile = responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.secondary.base,
      ),
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: 'Noticias',
            subtitle: 'Mantente informado sobre nuestra campana.',
            ctaText: 'Ver todas las noticias',
            onCtaPressed: () => context.go('/noticias'),
            titleColor: Theme.of(context).appColors.neutralNoChange.subtle,
            subtitleColor: Theme.of(context).appColors.neutralNoChange.subtle,
          ),
          SizedBox(height: responsive.spacing(mobile: 40, desktop: 60)),
          if (homeState.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (homeState.featuredNews.isEmpty)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: BaseText.noChangeSubtle(
                  'Próximamente nuevas noticias.',
                  style: TypoSecondary.b2r,
                ),
              ),
            )
          else
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 0.9 : 0.8,
              children: homeState.featuredNews
                  .map(
                    (CampaignNews news) => NewsCard(
                      title: news.title,
                      summary: news.summary,
                      date: news.publishedDate,
                      source: news.sourceName,
                      category: news.category,
                      imageUrl: news.imageUrl,
                      isFeatured: news.isFeatured,
                      onTap: () => context.go('/noticias/${news.id}'),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildTerritorySection(BuildContext context, Responsive responsive) {
    final bool isMobile = responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.tertiary.subtle,
      ),
      child: Column(
        children: <Widget>[
          SectionHeader(
            title: 'Tu Ciudad por Comunas',
            subtitle:
                'Conoce las 9 comunas de Popayán y las propuestas '
                'para cada territorio.',
            ctaText: 'Explorar el mapa',
            onCtaPressed: () => context.go(Routes.territory),
          ),
          SizedBox(height: responsive.spacing(mobile: 32, desktop: 48)),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: List<Widget>.generate(
              9,
              (int i) => _buildCommuneChip(context, i + 1),
            ),
          ),
          SizedBox(height: responsive.spacing(mobile: 32, desktop: 48)),
          Wrap(
            spacing: responsive.spacing(mobile: 32, desktop: 60),
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: <Widget>[
              _buildTerritoryStats(context, '9', 'Comunas', responsive),
              _buildTerritoryStats(context, '182', 'Barrios', responsive),
              _buildTerritoryStats(context, '320K', 'Habitantes', responsive),
            ],
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => context.go(Routes.territory),
            icon: const Icon(Iconsax.map_1),
            label: Text(
              'Ver mapa completo',
              style: responsive
                  .value<TextStyle>(
                    mobile: TypoSecondary.b3r,
                    desktop: TypoSecondary.b2r,
                  )
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).appColors.primary.strong,
              foregroundColor: Theme.of(
                context,
              ).appColors.neutralNoChange.subtle,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 32 : 48,
                vertical: isMobile ? 16 : 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTerritoryStats(
    BuildContext context,
    String number,
    String label,
    Responsive responsive,
  ) => Column(
    children: <Widget>[
      BaseText(
        number,
        style: responsive
            .value<TextStyle>(mobile: TypoPrimary.h3, desktop: TypoPrimary.h2)
            .copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).appColors.primary.strong,
            ),
      ),
      const SizedBox(height: 8),
      BaseText(
        label.toUpperCase(),
        style: responsive
            .value<TextStyle>(
              mobile: TypoSecondary.b4r,
              desktop: TypoSecondary.b3r,
            )
            .copyWith(
              letterSpacing: 1.5,
              color: Theme.of(context).appColors.text.scale.soft,
            ),
      ),
    ],
  );

  Widget _buildCommuneChip(BuildContext context, int number) => GestureDetector(
    onTap: () => context.go(Routes.territory),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).appColors.primary.strong),
        borderRadius: BorderRadius.circular(12),
      ),
      child: BaseText(
        'C$number',
        style: TypoSecondary.b3r.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).appColors.primary.strong,
        ),
      ),
    ),
  );

  Widget _buildCtaSection(BuildContext context, Responsive responsive) {
    final bool isMobile = responsive.width < Breakpoints.tablet;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: responsive.horizontalPadding(),
        vertical: responsive.verticalPadding(),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.strong,
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'QUIERES SER PARTE DE ESTE EQUIPO?',
            style: responsive
                .value<TextStyle>(
                  mobile: TypoPrimary.h3,
                  desktop: TypoPrimary.h2,
                )
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsive.spacing(desktop: 24)),
          BaseText.noChangeSubtle(
            'Unete al movimiento ciudadano mas grande de la ciudad',
            style: responsive.value<TextStyle>(
              mobile: TypoSecondary.b2r,
              desktop: TypoSecondary.b1r,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: responsive.spacing(mobile: 32, desktop: 48)),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () => context.go('/apoyar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(
                    context,
                  ).appColors.neutralNoChange.subtle,
                  foregroundColor: Theme.of(context).appColors.primary.strong,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 40,
                    vertical: isMobile ? 16 : 20,
                  ),
                ),
                child: Text(
                  'Quiero ser voluntario',
                  style: responsive
                      .value<TextStyle>(
                        mobile: TypoSecondary.b2r,
                        desktop: TypoSecondary.b1r,
                      )
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              OutlinedButton(
                onPressed: () => context.go('/contacto'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0x00000000),
                  foregroundColor: Theme.of(
                    context,
                  ).appColors.neutralNoChange.subtle,
                  side: BorderSide(
                    color: Theme.of(context).appColors.neutralNoChange.subtle,
                    width: 2,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 24 : 40,
                    vertical: isMobile ? 16 : 20,
                  ),
                ),
                child: Text(
                  'Contactanos',
                  style: responsive
                      .value<TextStyle>(
                        mobile: TypoSecondary.b2r,
                        desktop: TypoSecondary.b1r,
                      )
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(
                          context,
                        ).appColors.neutralNoChange.subtle,
                      ),
                ),
              ),
            ],
          ),
          SizedBox(height: responsive.spacing(mobile: 48, desktop: 80)),
          // Statistics
          Wrap(
            spacing: responsive.spacing(mobile: 32, desktop: 60),
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: <Widget>[
              _buildStatistic(context, '200+', 'Barrios', responsive),
              _buildStatistic(context, '9', 'Comunas', responsive),
              _buildStatistic(context, '1000+', 'Voluntarios', responsive),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatistic(
    BuildContext context,
    String number,
    String label,
    Responsive responsive,
  ) => Column(
    children: <Widget>[
      BaseText.noChangeSubtle(
        number,
        style: responsive
            .value<TextStyle>(mobile: TypoPrimary.h2, desktop: TypoPrimary.h1)
            .copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      BaseText.noChangeSubtle(
        label.toUpperCase(),
        style: responsive
            .value<TextStyle>(
              mobile: TypoSecondary.b3r,
              desktop: TypoSecondary.b2r,
            )
            .copyWith(letterSpacing: 1.5),
      ),
    ],
  );
}
