part of 'commune_detail_screen.dart';

class CommuneDetailScreen extends ConsumerStatefulWidget {
  const CommuneDetailScreen({required this.communeId, super.key});

  final String communeId;

  @override
  ConsumerState<CommuneDetailScreen> createState() =>
      _CommuneDetailScreenState();
}

class _CommuneDetailScreenState
    extends ConsumerState<CommuneDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(communeDetailViewModelProvider.notifier)
          .loadCommune(widget.communeId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final CommuneDetailState detailState =
        ref.watch(communeDetailViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    if (detailState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (detailState.error != null) {
      return Center(
        child: BaseText(
          detailState.error!,
          style: TypoSecondary.b2r,
        ),
      );
    }

    if (detailState.commune == null) {
      return Center(
        child: BaseText(
          'Comuna no encontrada',
          style: TypoSecondary.b2r,
        ),
      );
    }

    final Commune commune = detailState.commune!;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, commune),
          if (commune.latitude != null && commune.longitude != null)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 80,
                vertical: 24,
              ),
              child: CampaignMap(
                latitude: commune.latitude!,
                longitude: commune.longitude!,
                height: 250,
                zoom: 14,
                markerColor: commune.color,
              ),
            ),
          _buildOverview(context, isMobile, commune),
          if (commune.neighborhoods != null &&
              commune.neighborhoods!.isNotEmpty)
            _buildNeighborhoods(context, isMobile, commune),
          _buildLeaders(context, isMobile),
          _buildCtaSection(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isMobile,
    Commune commune,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 40 : 60,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Theme.of(context).appColors.primary.strong,
              Theme.of(context).appColors.secondary.strong,
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => context.go(Routes.territory),
                  child: BaseText.noChangeSubtle(
                    'Territorio',
                    style: TypoSecondary.b3r,
                  ),
                ),
                BaseText.noChangeSubtle(' / ', style: TypoSecondary.b3r),
                BaseText.noChangeSubtle(
                  commune.displayName,
                  style: TypoSecondary.b3r
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .appColors
                        .neutralNoChange
                        .subtle
                        .withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Icon(
                    Iconsax.location,
                    size: 32,
                    color:
                        Theme.of(context).appColors.neutralNoChange.subtle,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: BaseText.noChangeSubtle(
                    commune.displayName,
                    style:
                        (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 24,
              runSpacing: 12,
              children: <Widget>[
                if (commune.population != null)
                  _buildInfoChip(
                    context,
                    Iconsax.people,
                    '${commune.population} habitantes',
                  ),
                if (commune.neighborhoods != null)
                  _buildInfoChip(
                    context,
                    Iconsax.buildings,
                    '${commune.neighborhoods!.length} barrios',
                  ),
                if (commune.number != null)
                  _buildInfoChip(
                    context,
                    Iconsax.map,
                    'Comuna ${commune.number}',
                  ),
              ],
            ),
          ],
        ),
      );

  Widget _buildInfoChip(
    BuildContext context,
    IconData icon,
    String text,
  ) =>
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            size: 18,
            color: Theme.of(context).appColors.neutralNoChange.subtle,
          ),
          const SizedBox(width: 8),
          BaseText.noChangeSubtle(text, style: TypoSecondary.b2r),
        ],
      );

  Widget _buildOverview(
    BuildContext context,
    bool isMobile,
    Commune commune,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 40 : 60,
        ),
        child: Column(
          children: <Widget>[
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: <Widget>[
                  BaseText(
                    'Sobre la comuna',
                    style: TypoPrimary.h4
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  BaseText(
                    commune.description ??
                        'Comunidad en desarrollo con necesidades especificas '
                            'que abordaremos con propuestas concretas.',
                    style: TypoSecondary.b1r.copyWith(height: 1.8),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildNeighborhoods(
    BuildContext context,
    bool isMobile,
    Commune commune,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 40 : 60,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.neutral.subtle,
        ),
        child: Column(
          children: <Widget>[
            BaseText(
              'Barrios de la comuna',
              style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BaseText(
              'Cada barrio con propuestas concretas.',
              style: TypoSecondary.b2r.copyWith(
                color: Theme.of(context).appColors.text.scale.soft,
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: commune.neighborhoods!
                  .map(
                    (String neighborhood) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).appColors.primary.soft,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:
                              Theme.of(context).appColors.primary.strong,
                        ),
                      ),
                      child: BaseText(
                        neighborhood,
                        style: TypoSecondary.b3r.copyWith(
                          color:
                              Theme.of(context).appColors.primary.strong,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );

  Widget _buildLeaders(BuildContext context, bool isMobile) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 40 : 60,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.tertiary.subtle,
        ),
        child: Column(
          children: <Widget>[
            BaseText(
              'Lideres comunitarios',
              style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            BaseText(
              'Trabajamos de la mano con los representantes de la comunidad.',
              style: TypoSecondary.b2r.copyWith(
                color: Theme.of(context).appColors.text.scale.soft,
              ),
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.neutral.subtle,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Iconsax.people,
                    size: 48,
                    color: Theme.of(context).appColors.primary.soft,
                  ),
                  const SizedBox(height: 16),
                  BaseText(
                    'Juntas de Accion Comunal',
                    style: TypoSubtitles.s1
                        .copyWith(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  BaseText(
                    'Estamos en dialogo permanente con las JAC de cada '
                    'barrio para construir propuestas que respondan a las '
                    'necesidades reales de la comunidad.',
                    style: TypoSecondary.b2r.copyWith(
                      color:
                          Theme.of(context).appColors.text.scale.soft,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildCtaSection(BuildContext context, bool isMobile) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 60 : 100,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.primary.strong,
        ),
        child: Column(
          children: <Widget>[
            BaseText.noChangeSubtle(
              'QUIERES PROPONER ALGO PARA TU COMUNA?',
              style: (isMobile ? TypoPrimary.h4 : TypoPrimary.h3).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            BaseText.noChangeSubtle(
              'Tu voz es importante. Envianos tus ideas y propuestas.',
              style: TypoSecondary.b2r,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              alignment: WrapAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () => context.go(Routes.contact),
                  icon: const Icon(Iconsax.message),
                  label: const Text('Enviar propuesta'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context)
                        .appColors
                        .neutralNoChange
                        .subtle,
                    foregroundColor:
                        Theme.of(context).appColors.primary.strong,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () => context.go(Routes.territory),
                  icon: const Icon(Iconsax.map),
                  label: const Text('Ver otras comunas'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Theme.of(context)
                        .appColors
                        .neutralNoChange
                        .subtle,
                    side: BorderSide(
                      color: Theme.of(context)
                          .appColors
                          .neutralNoChange
                          .subtle,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
