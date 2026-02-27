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
      ref.read(homeViewModelProvider.notifier).getExample();
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

        // Circles Gallery Section
        _buildCirclesSection(context, responsive),

        // Strategic Axes Section
        _buildAxesSection(context, responsive),

        // Events Section
        _buildEventsSection(context, responsive),

        // News Section
        _buildNewsSection(context, responsive),

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

  Widget _buildCirclesSection(
    BuildContext context,
    Responsive responsive,
  ) => FadeImageScrollDelegate(
    images: const <String>[
      Jpgs.kCircle1,
      Jpgs.kCircle2,
      Jpgs.kCircle3,
      Jpgs.kCircle4,
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

  Widget _buildEventsSection(BuildContext context, Responsive responsive) {
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
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: isMobile ? 1.2 : 1.0,
            children: <Widget>[
              EventCard(
                title: 'Encuentro con lideres comunales',
                date: DateTime.now().add(const Duration(days: 3)),
                time: '10:00 AM',
                location: 'Centro de Convenciones',
                isFeatured: true,
                onTap: () => context.go('/agenda/1'),
              ),
              EventCard(
                title: 'Dialogo con jovenes emprendedores',
                date: DateTime.now().add(const Duration(days: 7)),
                time: '3:00 PM',
                location: 'Universidad del Cauca',
                onTap: () => context.go('/agenda/2'),
              ),
              EventCard(
                title: 'Recorrido por barrios del sur',
                date: DateTime.now().add(const Duration(days: 10)),
                time: '8:00 AM',
                location: 'Comuna 8',
                onTap: () => context.go('/agenda/3'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection(BuildContext context, Responsive responsive) {
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
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 24,
            mainAxisSpacing: 24,
            childAspectRatio: isMobile ? 0.9 : 0.8,
            children: <Widget>[
              for (int i = 0; i < min(3, newsCampino.length); i++)
                NewsCard(
                  title: newsCampino[i].title,
                  summary: newsCampino[i].description,
                  date: DateTime.now().subtract(Duration(days: i * 2)),
                  source: newsCampino[i].source,
                  onTap: () => context.go('/noticias/${i + 1}'),
                ),
            ],
          ),
        ],
      ),
    );
  }

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
