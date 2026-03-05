library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../typing/entities/campaign/life_milestone.dart';
import '../../../../typing/extensions/extensions.dart';
import '../../../../typing/result/result.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'life_story_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class _LifeStoryState {
  const _LifeStoryState({
    this.milestones = const <LifeMilestone>[],
    this.selectedFilter = 'Todos',
    this.isLoading = false,
    this.error,
  });

  final List<LifeMilestone> milestones;
  final String selectedFilter;
  final bool isLoading;
  final String? error;

  List<LifeMilestone> get filteredMilestones {
    if (selectedFilter == 'Todos') {
      return milestones;
    }
    return milestones
        .where(
          (LifeMilestone m) =>
              m.category?.name == selectedFilter.toLowerCase(),
        )
        .toList();
  }

  _LifeStoryState copyWith({
    List<LifeMilestone>? milestones,
    String? selectedFilter,
    bool? isLoading,
    String? error,
  }) => _LifeStoryState(
    milestones: milestones ?? this.milestones,
    selectedFilter: selectedFilter ?? this.selectedFilter,
    isLoading: isLoading ?? this.isLoading,
    error: error,
  );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class _LifeStoryViewModel extends _$LifeStoryViewModel {
  @override
  _LifeStoryState build() => const _LifeStoryState();

  Future<void> loadMilestones() async {
    state = state.copyWith(isLoading: true);

    final ResultDef<List<LifeMilestone>> result =
        await ref.read(getLifeMilestonesUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar hitos de vida',
        );
      },
      success: (List<LifeMilestone> milestones) {
        state = state.copyWith(
          isLoading: false,
          milestones: milestones,
        );
      },
    );
  }

  void setFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class LifeStoryScreen extends ConsumerStatefulWidget {
  const LifeStoryScreen({super.key});

  @override
  ConsumerState<LifeStoryScreen> createState() => _LifeStoryScreenState();
}

class _LifeStoryScreenState extends ConsumerState<LifeStoryScreen> {
  static const List<String> _filters = <String>[
    'Todos',
    'Personal',
    'Profesional',
    'Academico',
    'Politico',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(_lifeStoryViewModelProvider.notifier).loadMilestones();
    });
  }

  @override
  Widget build(BuildContext context) {
    final _LifeStoryState state = ref.watch(_lifeStoryViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildFilterSection(context, isMobile, state),
        _buildTimelineSection(context, isMobile, state),
        _buildQuoteSection(context, isMobile),
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
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: <Color>[
          Theme.of(context).appColors.secondary.strong,
          Theme.of(context).appColors.primary.strong,
        ],
      ),
    ),
    child: Column(
      children: <Widget>[
        BaseText.noChangeSubtle(
          'MI VIDA',
          style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
        ),
        const SizedBox(height: 16),
        BaseText.noChangeSubtle(
          'Una Historia de Servicio',
          style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: BaseText.noChangeSubtle(
            'Cada momento de mi vida me ha preparado para servir a Popayan. '
            'Conoce mi trayectoria y las experiencias que forjaron '
            'mi compromiso con nuestra ciudad.',
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
    _LifeStoryState state,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: 30,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Filtrar por etapa:',
          style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: _filters.map((String filter) {
            final bool isSelected = state.selectedFilter == filter;
            return FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (bool selected) {
                ref
                    .read(_lifeStoryViewModelProvider.notifier)
                    .setFilter(filter);
              },
              backgroundColor:
                  Theme.of(context).appColors.neutral.subtle,
              selectedColor: Theme.of(context).appColors.primary.soft,
              checkmarkColor: Theme.of(context).appColors.primary.strong,
              labelStyle: TypoSecondary.b3r.copyWith(
                color: isSelected
                    ? Theme.of(context).appColors.primary.strong
                    : null,
                fontWeight:
                    isSelected ? FontWeight.bold : FontWeight.normal,
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

  Widget _buildTimelineSection(
    BuildContext context,
    bool isMobile,
    _LifeStoryState state,
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

    final List<LifeMilestone> milestones = state.filteredMilestones;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: milestones.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: BaseText(
                  'No hay hitos en esta categoria.',
                  style: TypoSecondary.b1r,
                ),
              ),
            )
          : Column(
              children: <Widget>[
                for (int i = 0; i < milestones.length; i++)
                  _TimelineMilestone(
                    year: milestones[i].year.toString(),
                    title: milestones[i].title,
                    description: milestones[i].description ?? '',
                    category: milestones[i].categoryName,
                    isFirst: i == 0,
                    isLast: i == milestones.length - 1,
                    isLeft: !isMobile && i.isEven,
                    isMobile: isMobile,
                  ),
              ],
            ),
    );
  }

  Widget _buildQuoteSection(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 60 : 100,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.tertiary.subtle,
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          children: <Widget>[
            Icon(
              Iconsax.quote_up,
              size: 48,
              color: Theme.of(context).appColors.primary.soft,
            ),
            const SizedBox(height: 24),
            BaseText(
              '"Mi vida ha sido un camino de servicio. Cada experiencia, '
              'cada reto, cada logro me ha preparado para este momento: '
              'servir a Popayan con todo mi corazon."',
              style: (isMobile
                      ? TypoSecondary.b1r
                      : TypoPrimary.h4)
                  .copyWith(
                fontStyle: FontStyle.italic,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            BaseText.primary(
              '- William Campino',
              style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

// ---------------------------------------------------------------------------
// Timeline Milestone Widget
// ---------------------------------------------------------------------------

class _TimelineMilestone extends StatelessWidget {
  const _TimelineMilestone({
    required this.year,
    required this.title,
    required this.description,
    required this.category,
    required this.isFirst,
    required this.isLast,
    required this.isLeft,
    required this.isMobile,
  });

  final String year;
  final String title;
  final String description;
  final String category;
  final bool isFirst;
  final bool isLast;
  final bool isLeft;
  final bool isMobile;

  Color _getCategoryColor(BuildContext context) {
    switch (category) {
      case 'Personal':
        return Theme.of(context).appColors.error.strong;
      case 'Profesional':
        return Theme.of(context).appColors.primary.strong;
      case 'Academico':
        return Theme.of(context).appColors.informative.strong;
      default:
        return Theme.of(context).appColors.primary.strong;
    }
  }

  IconData _getCategoryIcon() {
    switch (category) {
      case 'Personal':
        return Iconsax.heart;
      case 'Profesional':
        return Iconsax.briefcase;
      case 'Academico':
        return Iconsax.book;
      default:
        return Iconsax.flag;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Color categoryColor = _getCategoryColor(context);

    if (isMobile) {
      return _buildMobileLayout(context, categoryColor);
    }

    return _buildDesktopLayout(context, categoryColor);
  }

  Widget _buildMobileLayout(
    BuildContext context,
    Color categoryColor,
  ) => Stack(
    children: <Widget>[
      if (!isLast)
        Positioned(
          left: 7,
          top: 16,
          bottom: 0,
          child: Container(
            width: 2,
            color: Theme.of(context).appColors.neutral.soft,
          ),
        ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: categoryColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              _getCategoryIcon(),
              size: 8,
              color:
                  Theme.of(context).appColors.neutralNoChange.subtle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: _buildCard(context, categoryColor),
            ),
          ),
        ],
      ),
    ],
  );

  Widget _buildDesktopLayout(
    BuildContext context,
    Color categoryColor,
  ) => Stack(
    children: <Widget>[
      if (!isLast)
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          bottom: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                width: 3,
                color: Theme.of(context).appColors.neutral.subtle,
              ),
            ],
          ),
        ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: isLeft
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: _buildCard(context, categoryColor),
                  )
                : const SizedBox.shrink(),
          ),
          // Timeline center
          Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: categoryColor,
                  shape: BoxShape.circle,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: categoryColor.withValues(alpha: 0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Icon(
                  _getCategoryIcon(),
                  size: 12,
                  color: Theme.of(
                    context,
                  ).appColors.neutralNoChange.subtle,
                ),
              ),
            ],
          ),
          Expanded(
            child: !isLeft
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: _buildCard(context, categoryColor),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    ],
  );

  Widget _buildCard(BuildContext context, Color categoryColor) => Container(
    margin: EdgeInsets.only(
      left: isLeft || isMobile ? 0 : 24,
      right: isLeft && !isMobile ? 24 : 0,
    ),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.neutral.subtle,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: Theme.of(context).appColors.neutral.soft,
      ),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Theme.of(context).appColors.opacity.base,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BaseText.noChangeSubtle(
                year,
                style: TypoSecondary.b3r.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: categoryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: BaseText(
                category,
                style: TypoSecondary.b4r.copyWith(
                  color: categoryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        BaseText(
          title,
          style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        BaseText(
          description,
          style: TypoSecondary.b2r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
            height: 1.6,
          ),
        ),
      ],
    ),
  );
}
