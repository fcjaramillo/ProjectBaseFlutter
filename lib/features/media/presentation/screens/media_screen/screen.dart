part of 'media_screen.dart';

class MediaScreen extends ConsumerStatefulWidget {
  const MediaScreen({super.key});

  @override
  ConsumerState<MediaScreen> createState() => _MediaScreenState();
}

class _MediaScreenState extends ConsumerState<MediaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mediaViewModelProvider.notifier).loadMedia();
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MediaState mediaState = ref.watch(mediaViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet =
        responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildTabSection(context, isMobile),
        _buildContentSection(context, isMobile, isTablet, mediaState),
        _buildDownloadSection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 60 : 100,
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
          children: <Widget>[
            BaseText.noChangeSubtle(
              'GALERIA',
              style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
            ),
            const SizedBox(height: 16),
            BaseText.noChangeSubtle(
              'Multimedia',
              style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: BaseText.noChangeSubtle(
                'Fotos y videos de nuestros recorridos, eventos y encuentros '
                'con la comunidad payanesa.',
                style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );

  Widget _buildTabSection(BuildContext context, bool isMobile) => Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 24,
        ),
        child: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Iconsax.gallery), text: 'Fotos'),
            Tab(icon: Icon(Iconsax.video), text: 'Videos'),
          ],
          labelColor: Theme.of(context).appColors.primary.strong,
          unselectedLabelColor:
              Theme.of(context).appColors.neutral.strong,
          indicatorColor: Theme.of(context).appColors.primary.strong,
          indicatorSize: TabBarIndicatorSize.tab,
          onTap: (_) => setState(() {}),
        ),
      );

  Widget _buildContentSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    MediaState mediaState,
  ) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 40,
        ),
        child: mediaState.isLoading
            ? const Center(child: CircularProgressIndicator())
            : mediaState.error != null
                ? Center(
                    child: BaseText(
                      mediaState.error!,
                      style: TypoSecondary.b2r,
                    ),
                  )
                : _tabController.index == 0
                    ? _buildPhotosGrid(
                        context, isMobile, isTablet, mediaState.images)
                    : _buildVideosGrid(
                        context, isMobile, isTablet, mediaState.videos),
      );

  Widget _buildPhotosGrid(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    List<MediaItem> photos,
  ) {
    if (photos.isEmpty) {
      return Center(
        child: BaseText(
          'No hay fotos disponibles',
          style: TypoSecondary.b2r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
          ),
        ),
      );
    }

    final int crossAxisCount = isMobile ? 2 : (isTablet ? 3 : 4);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1,
      ),
      itemCount: photos.length,
      itemBuilder: (BuildContext context, int index) {
        final MediaItem photo = photos[index];
        return _PhotoCard(
          title: photo.title ?? '',
          category: photo.category ?? '',
          imageUrl: photo.thumbnailUrl ?? photo.url,
        );
      },
    );
  }

  Widget _buildVideosGrid(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    List<MediaItem> videos,
  ) {
    if (videos.isEmpty) {
      return Center(
        child: BaseText(
          'No hay videos disponibles',
          style: TypoSecondary.b2r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
          ),
        ),
      );
    }

    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: isMobile ? 1.4 : 1.2,
      ),
      itemCount: videos.length,
      itemBuilder: (BuildContext context, int index) {
        final MediaItem video = videos[index];
        return _VideoCard(
          title: video.title ?? '',
          category: video.category ?? '',
          url: video.url,
        );
      },
    );
  }

  Widget _buildDownloadSection(BuildContext context, bool isMobile) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: isMobile ? 60 : 100,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.tertiary.subtle,
        ),
        child: Column(
          children: <Widget>[
            const SectionHeader(
              title: 'Material para Descargar',
              subtitle: 'Descarga y comparte nuestro material de campana.',
            ),
            const SizedBox(height: 48),
            Wrap(
              spacing: 24,
              runSpacing: 24,
              alignment: WrapAlignment.center,
              children: <Widget>[
                _DownloadCard(
                  icon: Iconsax.document,
                  title: 'Plan de Gobierno',
                  description: 'PDF con todas las propuestas',
                  size: '2.5 MB',
                  isMobile: isMobile,
                ),
                _DownloadCard(
                  icon: Iconsax.gallery,
                  title: 'Kit de Redes',
                  description: 'Imagenes para compartir',
                  size: '15 MB',
                  isMobile: isMobile,
                ),
                _DownloadCard(
                  icon: Iconsax.image,
                  title: 'Logo y Marca',
                  description: 'Identidad visual de campana',
                  size: '5 MB',
                  isMobile: isMobile,
                ),
                _DownloadCard(
                  icon: Iconsax.microphone,
                  title: 'Jingle',
                  description: 'Cancion de campana',
                  size: '3 MB',
                  isMobile: isMobile,
                ),
              ],
            ),
          ],
        ),
      );
}

class _PhotoCard extends StatefulWidget {
  const _PhotoCard({
    required this.title,
    required this.category,
    required this.imageUrl,
  });

  final String title;
  final String category;
  final String imageUrl;

  @override
  State<_PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<_PhotoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.primary.soft,
              borderRadius: BorderRadius.circular(12),
              boxShadow: _isHovered
                  ? <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context)
                            .appColors
                            .primary
                            .strong
                            .withValues(alpha: 0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ]
                  : null,
            ),
            child: Stack(
              children: <Widget>[
                Center(
                  child: Icon(
                    Iconsax.image,
                    size: 48,
                    color: Theme.of(context).appColors.primary.strong,
                  ),
                ),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: _isHovered ? 1.0 : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .appColors
                          .secondary
                          .strong
                          .withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BaseText.noChangeSubtle(
                          widget.title,
                          style: TypoSecondary.b3r
                              .copyWith(fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .appColors
                                .neutralNoChange
                                .subtle
                                .withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: BaseText.noChangeSubtle(
                            widget.category,
                            style: TypoSecondary.b4r,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _VideoCard extends StatefulWidget {
  const _VideoCard({
    required this.title,
    required this.category,
    required this.url,
  });

  final String title;
  final String category;
  final String url;

  @override
  State<_VideoCard> createState() => _VideoCardState();
}

class _VideoCardState extends State<_VideoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.neutral.subtle,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered
                    ? Theme.of(context).appColors.primary.strong
                    : Theme.of(context).appColors.neutral.soft,
              ),
              boxShadow: _isHovered
                  ? <BoxShadow>[
                      BoxShadow(
                        color: Theme.of(context)
                            .appColors
                            .primary
                            .strong
                            .withValues(alpha: 0.2),
                        blurRadius: 16,
                        offset: const Offset(0, 8),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).appColors.secondary.strong,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                    ),
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .appColors
                              .neutralNoChange
                              .subtle
                              .withValues(alpha: 0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.play,
                          size: 32,
                          color:
                              Theme.of(context).appColors.secondary.strong,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        widget.title,
                        style: TypoSecondary.b2r
                            .copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).appColors.primary.soft,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: BaseText(
                          widget.category,
                          style: TypoSecondary.b4r.copyWith(
                            color: Theme.of(context)
                                .appColors
                                .primary
                                .strong,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _DownloadCard extends StatelessWidget {
  const _DownloadCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.size,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String description;
  final String size;
  final bool isMobile;

  @override
  Widget build(BuildContext context) => Container(
        width: isMobile ? double.infinity : 220,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.neutral.subtle,
          borderRadius: BorderRadius.circular(16),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Theme.of(context).appColors.opacity.base,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.primary.soft,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                size: 32,
                color: Theme.of(context).appColors.primary.strong,
              ),
            ),
            const SizedBox(height: 16),
            BaseText(
              title,
              style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            BaseText(
              description,
              style: TypoSecondary.b4r.copyWith(
                color: Theme.of(context).appColors.text.scale.soft,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            BaseText(
              size,
              style: TypoSecondary.b4r.copyWith(
                color: Theme.of(context).appColors.neutral.strong,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.document_download, size: 18),
                label: const Text('Descargar'),
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).appColors.primary.strong,
                  side: BorderSide(
                    color: Theme.of(context).appColors.primary.strong,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
