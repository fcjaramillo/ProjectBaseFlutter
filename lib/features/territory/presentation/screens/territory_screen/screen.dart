part of 'territory_screen.dart';

class TerritoryScreen extends ConsumerStatefulWidget {
  const TerritoryScreen({super.key});

  @override
  ConsumerState<TerritoryScreen> createState() => _TerritoryScreenState();
}

class _TerritoryScreenState extends ConsumerState<TerritoryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(territoryViewModelProvider.notifier).loadCommunes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final TerritoryState territoryState =
        ref.watch(territoryViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet =
        responsive.width >= 768 && responsive.width < 1200;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeroSection(context, isMobile),
          _buildMapSection(context, isMobile, isTablet, territoryState),
          _buildCommuneDetail(context, isMobile, territoryState),
          _buildStatsSection(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 60 : 100,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.primary.soft,
        ),
        child: Column(
          children: <Widget>[
            BaseText.primary(
              'TERRITORIO',
              style: TypoSecondary.b2r.copyWith(
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            BaseText(
              'Popayan por Comunas',
              style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: BaseText(
                'Conoce las propuestas especificas para cada comuna. '
                'Hemos caminado cada barrio para entender sus necesidades.',
                style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  Widget _buildMapSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    TerritoryState territoryState,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 40 : 60,
        ),
        child: Column(
          children: <Widget>[
            BaseText(
              'Selecciona una comuna para ver las propuestas',
              style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            if (territoryState.communes.isNotEmpty)
              CampaignMapWithMarkers(
                height: isMobile ? 300 : 400,
                center: const LatLng(2.4448, -76.6147),
                selectedLabel: territoryState.selectedCommune?.displayName,
                markers: territoryState.communes
                    .where(
                      (Commune c) =>
                          c.latitude != null && c.longitude != null,
                    )
                    .map(
                      (Commune c) => CampaignMapMarker(
                        latitude: c.latitude!,
                        longitude: c.longitude!,
                        label: c.displayName,
                        color: c.color,
                        onTap: () => ref
                            .read(territoryViewModelProvider.notifier)
                            .selectCommune(c.id),
                      ),
                    )
                    .toList(),
              )
            else
              Container(
                height: isMobile ? 300 : 400,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).appColors.tertiary.subtle,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Theme.of(context).appColors.neutral.soft,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Iconsax.map_1,
                    size: 64,
                    color: Theme.of(context).appColors.primary.soft,
                  ),
                ),
              ),
            const SizedBox(height: 32),
            if (territoryState.isLoading)
              const CircularProgressIndicator()
            else if (territoryState.error != null)
              BaseText(
                territoryState.error!,
                style: TypoSecondary.b2r,
              )
            else
              Wrap(
                spacing: 12,
                runSpacing: 12,
                alignment: WrapAlignment.center,
                children: territoryState.communes
                    .map((Commune commune) {
                      final bool isSelected =
                          territoryState.selectedCommuneId == commune.id;
                      return _CommuneButton(
                        name: commune.displayName,
                        isSelected: isSelected,
                        onTap: () {
                          ref
                              .read(territoryViewModelProvider.notifier)
                              .selectCommune(commune.id);
                        },
                      );
                    })
                    .toList(),
              ),
          ],
        ),
      );

  Widget _buildCommuneDetail(
    BuildContext context,
    bool isMobile,
    TerritoryState territoryState,
  ) {
    if (territoryState.selectedCommune == null) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 40,
        ),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.tertiary.subtle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: <Widget>[
              Icon(
                Iconsax.location,
                size: 48,
                color: Theme.of(context).appColors.primary.soft,
              ),
              const SizedBox(height: 16),
              BaseText(
                'Selecciona una comuna para ver las propuestas especificas',
                style: TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    final Commune commune = territoryState.selectedCommune!;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.neutral.subtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).appColors.primary.soft,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).appColors.primary.strong,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Iconsax.location,
                    color:
                        Theme.of(context).appColors.neutralNoChange.subtle,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        commune.displayName,
                        style: TypoPrimary.h4.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (commune.population != null)
                        BaseText(
                          '${commune.population} habitantes',
                          style: TypoSecondary.b3r.copyWith(
                            color: Theme.of(context)
                                .appColors
                                .text
                                .scale
                                .soft,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            if (commune.description != null) ...<Widget>[
              const SizedBox(height: 24),
              BaseText(
                commune.description!,
                style: TypoSecondary.b1r.copyWith(height: 1.6),
              ),
            ],
            if (commune.neighborhoods != null &&
                commune.neighborhoods!.isNotEmpty) ...<Widget>[
              const SizedBox(height: 24),
              BaseText(
                'Barrios:',
                style: TypoSubtitles.s2
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: commune.neighborhoods!
                    .map(
                      (String n) => Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appColors.primary.soft,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: BaseText(
                          n,
                          style: TypoSecondary.b4r.copyWith(
                            color: Theme.of(context)
                                .appColors
                                .primary
                                .strong,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () =>
                  context.push('${Routes.territory}/${commune.id}'),
              icon: const Icon(Iconsax.arrow_right_3, size: 18),
              label: const Text('Ver detalle completo'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).appColors.primary.strong,
                foregroundColor:
                    Theme.of(context).appColors.neutralNoChange.subtle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isMobile) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 60 : 100,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.secondary.strong,
        ),
        child: Column(
          children: <Widget>[
            BaseText.noChangeSubtle(
              'POPAYAN EN NUMEROS',
              style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
            ),
            const SizedBox(height: 16),
            BaseText.noChangeSubtle(
              'Conocemos cada rincon',
              style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile ? 40 : 60),
            Wrap(
              spacing: isMobile ? 24 : 48,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: <Widget>[
                _StatItem(number: '9', label: 'Comunas', isMobile: isMobile),
                _StatItem(
                    number: '182', label: 'Barrios', isMobile: isMobile),
                _StatItem(
                    number: '320K',
                    label: 'Habitantes',
                    isMobile: isMobile),
                _StatItem(
                    number: '100%',
                    label: 'Recorrido',
                    isMobile: isMobile),
              ],
            ),
          ],
        ),
      );
}

class _CommuneButton extends StatefulWidget {
  const _CommuneButton({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_CommuneButton> createState() => _CommuneButtonState();
}

class _CommuneButtonState extends State<_CommuneButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: widget.isSelected
                  ? Theme.of(context).appColors.primary.strong
                  : _isHovered
                      ? Theme.of(context).appColors.primary.soft
                      : Theme.of(context).appColors.neutral.subtle,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: widget.isSelected || _isHovered
                    ? Theme.of(context).appColors.primary.strong
                    : Theme.of(context).appColors.neutral.soft,
              ),
            ),
            child: BaseText(
              widget.name,
              style: TypoSecondary.b3r.copyWith(
                fontWeight: widget.isSelected
                    ? FontWeight.bold
                    : FontWeight.normal,
                color: widget.isSelected
                    ? Theme.of(context).appColors.neutralNoChange.subtle
                    : null,
              ),
            ),
          ),
        ),
      );
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.number,
    required this.label,
    required this.isMobile,
  });

  final String number;
  final String label;
  final bool isMobile;

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            number,
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          BaseText.noChangeSubtle(
            label.toUpperCase(),
            style: TypoSecondary.b3r.copyWith(letterSpacing: 1.5),
          ),
        ],
      );
}
