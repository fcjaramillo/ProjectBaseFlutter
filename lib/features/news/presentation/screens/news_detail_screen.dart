library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../typing/entities/campaign/campaign_news.dart';
import '../../../../typing/extensions/extensions.dart';
import '../../../../typing/result/result.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'news_detail_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class _NewsDetailState {
  const _NewsDetailState({
    this.news,
    this.isLoading = false,
    this.error,
  });

  final CampaignNews? news;
  final bool isLoading;
  final String? error;

  _NewsDetailState copyWith({
    CampaignNews? news,
    bool? isLoading,
    String? error,
  }) => _NewsDetailState(
    news: news ?? this.news,
    isLoading: isLoading ?? this.isLoading,
    error: error,
  );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class _NewsDetailViewModel extends _$NewsDetailViewModel {
  @override
  _NewsDetailState build() => const _NewsDetailState();

  Future<void> loadNews(String id) async {
    state = state.copyWith(isLoading: true);

    final ResultDef<CampaignNews?> result =
        await ref.read(getNewsByIdUseCaseProvider).call(id);

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar la noticia',
        );
      },
      success: (CampaignNews? news) {
        state = state.copyWith(
          isLoading: false,
          news: news,
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class NewsDetailScreen extends ConsumerStatefulWidget {
  const NewsDetailScreen({required this.newsId, super.key});

  final String newsId;

  @override
  ConsumerState<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends ConsumerState<NewsDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(_newsDetailViewModelProvider.notifier)
          .loadNews(widget.newsId);
    });
  }

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'Enero',
      'Febrero',
      'Marzo',
      'Abril',
      'Mayo',
      'Junio',
      'Julio',
      'Agosto',
      'Septiembre',
      'Octubre',
      'Noviembre',
      'Diciembre',
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final _NewsDetailState state = ref.watch(_newsDetailViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    if (state.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 120),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (state.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: BaseText(
            state.error!,
            style: TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    if (state.news == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: BaseText(
            'Noticia no encontrada.',
            style: TypoSecondary.b1r,
          ),
        ),
      );
    }

    final CampaignNews news = state.news!;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, news),
          _buildContent(context, isMobile, news),
          _buildShareSection(context, isMobile),
          _buildRelatedNews(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isMobile,
    CampaignNews news,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 60,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.secondary.strong,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // Breadcrumb
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => context.go(Routes.news),
              child: BaseText.noChangeSubtle(
                'Noticias',
                style: TypoSecondary.b3r,
              ),
            ),
            BaseText.noChangeSubtle(' / ', style: TypoSecondary.b3r),
            BaseText.noChangeSubtle(
              news.category ?? '',
              style: TypoSecondary.b3r.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        if (news.category != null) ...<Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.primary.strong,
              borderRadius: BorderRadius.circular(20),
            ),
            child: BaseText.noChangeSubtle(
              news.category!.toUpperCase(),
              style: TypoSecondary.b4r.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
        BaseText.noChangeSubtle(
          news.title,
          style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (news.publishedDate != null) ...<Widget>[
          const SizedBox(height: 16),
          Row(
            children: <Widget>[
              Icon(
                Iconsax.calendar,
                size: 16,
                color:
                    Theme.of(context).appColors.neutralNoChange.subtle,
              ),
              const SizedBox(width: 8),
              BaseText.noChangeSubtle(
                _formatDate(news.publishedDate!),
                style: TypoSecondary.b3r,
              ),
            ],
          ),
        ],
      ],
    ),
  );

  Widget _buildContent(
    BuildContext context,
    bool isMobile,
    CampaignNews news,
  ) {
    final String text = news.content ?? news.summary ?? '';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: text.isEmpty
            ? BaseText(
                'Contenido no disponible.',
                style: TypoSecondary.b1r,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: text
                    .split('\n\n')
                    .where((String p) => p.trim().isNotEmpty)
                    .map(
                      (String paragraph) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: BaseText(
                          paragraph.trim(),
                          style: TypoSecondary.b1r.copyWith(
                            height: 1.8,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }

  Widget _buildShareSection(BuildContext context, bool isMobile) =>
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 32,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.tertiary.subtle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BaseText(
              'Compartir:',
              style: TypoSecondary.b2r.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
            IconButton(
              onPressed: () => shareOnFacebook(Uri.base.toString()),
              icon: const Icon(Icons.facebook),
              color: Theme.of(context).appColors.primary.strong,
            ),
            IconButton(
              onPressed: () => launchSocialUrl(SocialLinks.instagram),
              icon: const Icon(Iconsax.instagram),
              color: Theme.of(context).appColors.primary.strong,
            ),
            IconButton(
              onPressed: () => shareOnWhatsApp(Uri.base.toString()),
              icon: const Icon(Iconsax.message),
              color: Theme.of(context).appColors.primary.strong,
            ),
            IconButton(
              onPressed: () => Clipboard.setData(
                ClipboardData(text: Uri.base.toString()),
              ),
              icon: const Icon(Iconsax.link),
              color: Theme.of(context).appColors.primary.strong,
            ),
          ],
        ),
      );

  Widget _buildRelatedNews(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 60,
    ),
    child: Column(
      children: <Widget>[
        BaseText(
          'Mas noticias',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        BaseText(
          'Mantente informado sobre nuestra campana.',
          style: TypoSecondary.b2r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
          ),
        ),
        const SizedBox(height: 24),
        ElevatedButton.icon(
          onPressed: () => context.go(Routes.news),
          icon: const Icon(Iconsax.arrow_left),
          label: const Text('Ver todas las noticias'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).appColors.primary.strong,
            foregroundColor:
                Theme.of(context).appColors.neutralNoChange.subtle,
          ),
        ),
      ],
    ),
  );
}
