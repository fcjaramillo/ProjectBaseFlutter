library;

import 'package:flutter/material.dart' hide Colors;
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
import '../../../../ui/widgets/organisms/organisms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'news_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class _NewsState {
  const _NewsState({
    this.allNews = const <CampaignNews>[],
    this.selectedCategory = 'Todas',
    this.isLoading = false,
    this.error,
  });

  final List<CampaignNews> allNews;
  final String selectedCategory;
  final bool isLoading;
  final String? error;

  List<CampaignNews> get filteredNews {
    if (selectedCategory == 'Todas') {
      return allNews;
    }
    return allNews
        .where(
          (CampaignNews n) => n.category == selectedCategory,
        )
        .toList();
  }

  List<String> get categories {
    final Set<String> cats = <String>{};
    for (final CampaignNews n in allNews) {
      if (n.category != null && n.category!.isNotEmpty) {
        cats.add(n.category!);
      }
    }
    return <String>['Todas', ...cats];
  }

  _NewsState copyWith({
    List<CampaignNews>? allNews,
    String? selectedCategory,
    bool? isLoading,
    String? error,
  }) => _NewsState(
    allNews: allNews ?? this.allNews,
    selectedCategory: selectedCategory ?? this.selectedCategory,
    isLoading: isLoading ?? this.isLoading,
    error: error,
  );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class _NewsViewModel extends _$NewsViewModel {
  @override
  _NewsState build() => const _NewsState();

  Future<void> loadNews() async {
    state = state.copyWith(isLoading: true);

    final ResultDef<List<CampaignNews>> result =
        await ref.read(getNewsUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar noticias',
        );
      },
      success: (List<CampaignNews> news) {
        state = state.copyWith(
          isLoading: false,
          allNews: news,
        );
      },
    );
  }

  void setCategory(String category) {
    state = state.copyWith(selectedCategory: category);
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class NewsScreen extends ConsumerStatefulWidget {
  const NewsScreen({super.key});

  @override
  ConsumerState<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends ConsumerState<NewsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_newsViewModelProvider.notifier).loadNews();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _NewsState state = ref.watch(_newsViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet =
        responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildFilterSection(context, isMobile, state),
        _buildNewsGrid(context, isMobile, isTablet, state),
        _buildSubscribeSection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
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
          'ACTUALIDAD',
          style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
        ),
        const SizedBox(height: 16),
        BaseText.noChangeSubtle(
          'Noticias de la Campana',
          style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: BaseText.noChangeSubtle(
            'Mantente informado sobre las actividades, propuestas y '
            'avances de nuestra campana.',
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Widget _buildFilterSection(
    BuildContext context,
    bool isMobile,
    _NewsState state,
  ) {
    if (state.isLoading || state.allNews.isEmpty) {
      return const SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(
            'Filtrar por categoria:',
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: state.categories.map((String category) {
              final bool isSelected =
                  state.selectedCategory == category;
              return FilterChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (bool selected) {
                  ref
                      .read(_newsViewModelProvider.notifier)
                      .setCategory(category);
                },
                backgroundColor:
                    Theme.of(context).appColors.neutral.subtle,
                selectedColor:
                    Theme.of(context).appColors.primary.soft,
                checkmarkColor:
                    Theme.of(context).appColors.primary.strong,
                labelStyle: TypoSecondary.b3r.copyWith(
                  color: isSelected
                      ? Theme.of(context).appColors.primary.strong
                      : null,
                  fontWeight: isSelected
                      ? FontWeight.bold
                      : FontWeight.normal,
                ),
                side: BorderSide(
                  color: isSelected
                      ? Theme.of(context).appColors.primary.strong
                      : Theme.of(context).appColors.neutral.soft,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsGrid(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    _NewsState state,
  ) {
    if (state.isLoading) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 80),
        child: const Center(child: CircularProgressIndicator()),
      );
    }

    if (state.error != null) {
      return Container(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: BaseText(
            state.error!,
            style: TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    final List<CampaignNews> news = state.filteredNews;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: news.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: BaseText(
                  'No hay noticias en esta categoria.',
                  style: TypoSecondary.b1r,
                ),
              ),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: isMobile ? 1.0 : 0.85,
              ),
              itemCount: news.length,
              itemBuilder: (BuildContext context, int index) {
                final CampaignNews item = news[index];
                return NewsCard(
                  title: item.title,
                  summary: item.summary,
                  imageUrl: item.imageUrl ??
                      'https://scontent.fppn1-1.fna.fbcdn.net/v/t39.30808-6'
                          '/607067791_1401151054735436_5828237345673594525_n'
                          '.jpg?_nc_cat=104&ccb=1-7&_nc_sid=1d70fc&_nc_ohc='
                          'OKfnpQ8ElYIQ7kNvwGk15Rq&_nc_oc=AdlI8hO12GvaAXAd'
                          'E9NwTSlFEsRuW6D4CbpMoyDx8C6tN27cNNYcwTeYC9QPTS1q'
                          'eEQ&_nc_zt=23&_nc_ht=scontent.fppn1-1.fna&_nc_gid'
                          '=3vUzZxLfGv3UwscwlO2bdg&_nc_ss=8&oh=00_AfzD4I_91'
                          'VwhFKBAkGb99mp_hyEhQAD84IB12yl6Dl9GMw&oe=69AC3774',
                  date: item.publishedDate,
                  category: item.category,
                  isFeatured: item.isFeatured,
                  onTap: () => context.go(
                    Routes.newsDetail.replaceAll(':id', item.id),
                  ),
                );
              },
            ),
    );
  }

  Widget _buildSubscribeSection(BuildContext context, bool isMobile) =>
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
            Icon(
              Iconsax.sms,
              size: 48,
              color: Theme.of(context).appColors.primary.strong,
            ),
            const SizedBox(height: 24),
            BaseText(
              'RECIBE LAS NOTICIAS EN TU CORREO',
              style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: isMobile ? 16 : 24),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: BaseText(
                'Suscribete a nuestro boletin y recibe las ultimas noticias '
                'de la campana directamente en tu correo.',
                style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 32),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Tu correo electronico',
                        filled: true,
                        fillColor:
                            Theme.of(context).appColors.neutral.subtle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).appColors.primary.strong,
                      foregroundColor: Theme.of(
                        context,
                      ).appColors.neutralNoChange.subtle,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Suscribirse'),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
