library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../typing/entities/campaign/proposal.dart';
import '../../../../typing/extensions/extensions.dart';
import '../../../../typing/result/result.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'proposals_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class ProposalsState {
  ProposalsState({
    required this.proposals,
    required this.isLoading,
    this.selectedCategory,
    this.error,
  });

  final List<Proposal> proposals;
  final bool isLoading;
  final String? selectedCategory;
  final String? error;

  factory ProposalsState.initial() => ProposalsState(
        proposals: <Proposal>[],
        isLoading: false,
      );

  List<Proposal> get filteredProposals {
    if (selectedCategory == null || selectedCategory == 'Todos') {
      return proposals;
    }
    return proposals
        .where((Proposal p) => p.category == selectedCategory)
        .toList();
  }

  ProposalsState copyWith({
    List<Proposal>? proposals,
    bool? isLoading,
    String? selectedCategory,
    String? error,
    bool clearError = false,
    bool clearSelectedCategory = false,
  }) =>
      ProposalsState(
        proposals: proposals ?? this.proposals,
        isLoading: isLoading ?? this.isLoading,
        selectedCategory: clearSelectedCategory
            ? null
            : selectedCategory ?? this.selectedCategory,
        error: clearError ? null : error ?? this.error,
      );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class ProposalsViewModel extends _$ProposalsViewModel {
  @override
  ProposalsState build() => ProposalsState.initial();

  Future<void> loadProposals() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<List<Proposal>> result =
        await ref.read(getProposalsUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar las propuestas',
        );
      },
      success: (List<Proposal> proposals) {
        state = state.copyWith(isLoading: false, proposals: proposals);
      },
    );
  }

  void setFilter(String? category) {
    state = state.copyWith(
      selectedCategory: category,
      clearSelectedCategory: category == null,
    );
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class ProposalsScreen extends ConsumerStatefulWidget {
  const ProposalsScreen({super.key});

  @override
  ConsumerState<ProposalsScreen> createState() => _ProposalsScreenState();
}

class _ProposalsScreenState extends ConsumerState<ProposalsScreen> {
  final List<String> _categories = <String>[
    'Todos',
    'Seguridad',
    'Economia',
    'Educacion',
    'Salud',
    'Movilidad',
    'Cultura',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(proposalsViewModelProvider.notifier).loadProposals();
    });
  }

  Color _getCategoryColor(BuildContext context, String? category) {
    switch (category) {
      case 'Seguridad':
        return Theme.of(context).appColors.error.strong;
      case 'Economia':
        return Theme.of(context).appColors.success.strong;
      case 'Educacion':
        return Theme.of(context).appColors.informative.strong;
      case 'Salud':
        return Theme.of(context).appColors.error.strong;
      case 'Movilidad':
        return Theme.of(context).appColors.warning.strong;
      case 'Cultura':
        return Theme.of(context).appColors.primary.strong;
      default:
        return Theme.of(context).appColors.primary.strong;
    }
  }

  IconData _getCategoryIcon(String? category) {
    switch (category) {
      case 'Seguridad':
        return Iconsax.shield_tick;
      case 'Economia':
        return Iconsax.chart;
      case 'Educacion':
        return Iconsax.teacher;
      case 'Salud':
        return Iconsax.hospital;
      case 'Movilidad':
        return Iconsax.car;
      case 'Cultura':
        return Iconsax.music;
      default:
        return Iconsax.star;
    }
  }

  @override
  Widget build(BuildContext context) {
    final ProposalsState proposalsState =
        ref.watch(proposalsViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet =
        responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildFilterSection(context, isMobile, proposalsState),
        _buildProposalsGrid(
          context,
          isMobile,
          isTablet,
          proposalsState,
        ),
        _buildCitizenInvestmentBanner(context, isMobile),
        _buildCtaSection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) {
    return Container(
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
            'PLAN DE GOBIERNO',
            style: TypoSecondary.b2r.copyWith(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          BaseText(
            'Propuestas para Popayan',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText(
              'Un plan construido con la comunidad, para resolver '
              'los problemas reales de nuestra ciudad y construir '
              'el Popayan que merecemos.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
    BuildContext context,
    bool isMobile,
    ProposalsState proposalsState,
  ) {
    final String selectedCategory =
        proposalsState.selectedCategory ?? 'Todos';
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
            children: _categories.map((String category) {
              final bool isSelected = selectedCategory == category;
              return FilterChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (bool selected) {
                  ref
                      .read(proposalsViewModelProvider.notifier)
                      .setFilter(category);
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
  }

  Widget _buildProposalsGrid(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    ProposalsState proposalsState,
  ) {
    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    if (proposalsState.isLoading) {
      return const Padding(
        padding: EdgeInsets.all(40),
        child: Center(child: CircularProgressIndicator()),
      );
    }

    if (proposalsState.error != null) {
      return Padding(
        padding: const EdgeInsets.all(40),
        child: Center(
          child: BaseText(
            proposalsState.error!,
            style: TypoSecondary.b2r,
          ),
        ),
      );
    }

    final List<Proposal> proposals = proposalsState.filteredProposals;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: proposals.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: BaseText(
                  'No hay propuestas en esta categoria.',
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
                childAspectRatio: isMobile ? 1.3 : 1.1,
              ),
              itemCount: proposals.length,
              itemBuilder: (BuildContext context, int index) {
                final Proposal proposal = proposals[index];
                return _ProposalCard(
                  title: proposal.title,
                  description: proposal.description ?? '',
                  category: proposal.category ?? '',
                  icon: _getCategoryIcon(proposal.category),
                  categoryColor:
                      _getCategoryColor(context, proposal.category),
                );
              },
            ),
    );
  }

  Widget _buildCitizenInvestmentBanner(
    BuildContext context,
    bool isMobile,
  ) {
    final Color white =
        Theme.of(context).appColors.neutralNoChange.subtle;
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

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 32,
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
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
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

  Widget _buildCtaSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.secondary.base,
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'TIENES UNA PROPUESTA?',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 24),
          BaseText.noChangeSubtle(
            'Queremos escucharte. Envíanos tus ideas para construir juntos '
            'el Popayan que sonamos.',
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 32 : 48),
          ElevatedButton.icon(
            onPressed: () => context.go(Routes.contact),
            icon: const Icon(Iconsax.message),
            label: const Text('Enviar propuesta'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              foregroundColor:
                  Theme.of(context).appColors.secondary.base,
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
}

// ---------------------------------------------------------------------------
// Private widget
// ---------------------------------------------------------------------------

class _ProposalCard extends StatefulWidget {
  const _ProposalCard({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
    required this.categoryColor,
  });

  final String title;
  final String description;
  final String category;
  final IconData icon;
  final Color categoryColor;

  @override
  State<_ProposalCard> createState() => _ProposalCardState();
}

class _ProposalCardState extends State<_ProposalCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color categoryColor = widget.categoryColor;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.neutral.subtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? categoryColor
                : Theme.of(context).appColors.neutral.soft,
            width: _isHovered ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? <BoxShadow>[
                  BoxShadow(
                    color: categoryColor.withValues(alpha: 0.2),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
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
                      color: categoryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: BaseText(
                      widget.category.toUpperCase(),
                      style: TypoSecondary.b4r.copyWith(
                        color: categoryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: categoryColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      widget.icon,
                      color: categoryColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BaseText(
                widget.title,
                style: TypoSubtitles.s2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: BaseText(
                  widget.description,
                  style: TypoSecondary.b3r.copyWith(
                    color: Theme.of(context).appColors.text.scale.soft,
                    height: 1.5,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
