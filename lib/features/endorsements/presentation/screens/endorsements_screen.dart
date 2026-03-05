library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../typing/entities/campaign/endorsement.dart';
import '../../../../typing/extensions/extensions.dart';
import '../../../../typing/result/result.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'endorsements_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class EndorsementsState {
  EndorsementsState({
    required this.endorsements,
    required this.isLoading,
    this.selectedType,
    this.error,
  });

  final List<Endorsement> endorsements;
  final bool isLoading;
  final String? selectedType;
  final String? error;

  factory EndorsementsState.initial() => EndorsementsState(
        endorsements: <Endorsement>[],
        isLoading: false,
      );

  List<Endorsement> get filteredEndorsements {
    if (selectedType == null || selectedType == 'Todos') {
      return endorsements;
    }
    final EndorsementType? filterType = _typeFromLabel(selectedType);
    if (filterType == null) {
      return endorsements;
    }
    return endorsements
        .where((Endorsement e) => e.type == filterType)
        .toList();
  }

  static EndorsementType? _typeFromLabel(String? label) {
    switch (label) {
      case 'Personal':
        return EndorsementType.personal;
      case 'Organizaciones':
        return EndorsementType.organizacion;
      case 'Politico':
        return EndorsementType.politico;
      case 'Empresarial':
        return EndorsementType.empresarial;
      default:
        return null;
    }
  }

  EndorsementsState copyWith({
    List<Endorsement>? endorsements,
    bool? isLoading,
    String? selectedType,
    String? error,
    bool clearError = false,
    bool clearSelectedType = false,
  }) =>
      EndorsementsState(
        endorsements: endorsements ?? this.endorsements,
        isLoading: isLoading ?? this.isLoading,
        selectedType:
            clearSelectedType ? null : selectedType ?? this.selectedType,
        error: clearError ? null : error ?? this.error,
      );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class EndorsementsViewModel extends _$EndorsementsViewModel {
  @override
  EndorsementsState build() => EndorsementsState.initial();

  Future<void> loadEndorsements() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<List<Endorsement>> result =
        await ref.read(getEndorsementsUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar los respaldos',
        );
      },
      success: (List<Endorsement> endorsements) {
        state = state.copyWith(
          isLoading: false,
          endorsements: endorsements,
        );
      },
    );
  }

  void setTypeFilter(String? type) {
    state = state.copyWith(
      selectedType: type,
      clearSelectedType: type == null,
    );
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class EndorsementsScreen extends ConsumerStatefulWidget {
  const EndorsementsScreen({super.key});

  @override
  ConsumerState<EndorsementsScreen> createState() =>
      _EndorsementsScreenState();
}

class _EndorsementsScreenState extends ConsumerState<EndorsementsScreen> {
  final List<String> _filterTypes = <String>[
    'Todos',
    'Personal',
    'Organizaciones',
    'Politico',
    'Empresarial',
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(endorsementsViewModelProvider.notifier).loadEndorsements();
    });
  }

  @override
  Widget build(BuildContext context) {
    final EndorsementsState endorsementsState =
        ref.watch(endorsementsViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet =
        responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildFilterSection(context, isMobile, endorsementsState),
        _buildEndorsementsSection(
          context,
          isMobile,
          isTablet,
          endorsementsState,
        ),
        _buildCommunitySection(context, isMobile, isTablet),
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
            'RESPALDOS',
            style: TypoSecondary.b2r.copyWith(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          BaseText(
            'Voces que nos Apoyan',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText(
              'Ciudadanos, lideres y organizaciones que creen en nuestro '
              'proyecto y se suman al cambio que Popayan necesita.',
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
    EndorsementsState endorsementsState,
  ) {
    final String selectedType =
        endorsementsState.selectedType ?? 'Todos';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(
            'Filtrar por tipo:',
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _filterTypes.map((String type) {
              final bool isSelected = selectedType == type;
              return FilterChip(
                label: Text(type),
                selected: isSelected,
                onSelected: (bool selected) {
                  ref
                      .read(endorsementsViewModelProvider.notifier)
                      .setTypeFilter(type);
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

  Widget _buildEndorsementsSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
    EndorsementsState endorsementsState,
  ) {
    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: endorsementsState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : endorsementsState.error != null
              ? Center(
                  child: BaseText(
                    endorsementsState.error!,
                    style: TypoSecondary.b2r,
                  ),
                )
              : endorsementsState.filteredEndorsements.isEmpty
                  ? Center(
                      child: BaseText(
                        'No hay respaldos disponibles.',
                        style: TypoSecondary.b2r,
                      ),
                    )
                  : Column(
                      children: <Widget>[
                        const SectionHeader(
                          title: 'Testimonios y Respaldos',
                          subtitle:
                              'Lo que dicen quienes nos apoyan.',
                        ),
                        SizedBox(height: isMobile ? 40 : 60),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 24,
                            mainAxisSpacing: 24,
                            childAspectRatio: isMobile ? 1.3 : 1.0,
                          ),
                          itemCount: endorsementsState
                              .filteredEndorsements.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Endorsement endorsement =
                                endorsementsState
                                    .filteredEndorsements[index];
                            return TestimonialCard(
                              name: endorsement.name,
                              title: endorsement.title,
                              quote: endorsement.quote ?? '',
                              imageUrl: endorsement.imageUrl,
                              organization: endorsement.organization,
                            );
                          },
                        ),
                      ],
                    ),
    );
  }

  Widget _buildCommunitySection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    final List<Map<String, String>> stats = <Map<String, String>>[
      <String, String>{'number': '50+', 'label': 'Lideres comunales'},
      <String, String>{'number': '30+', 'label': 'Organizaciones'},
      <String, String>{'number': '1000+', 'label': 'Voluntarios'},
      <String, String>{
        'number': '9',
        'label': 'Comunas representadas',
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(
            title: 'Una Comunidad Unida',
            subtitle: 'El respaldo de Popayan en numeros.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          Wrap(
            spacing: isMobile ? 24 : 48,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: stats
                .map(
                  (Map<String, String> stat) => _StatCard(
                    number: stat['number']!,
                    label: stat['label']!,
                    isMobile: isMobile,
                  ),
                )
                .toList(),
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
        color: Theme.of(context).appColors.secondary.strong,
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'QUIERES SUMAR TU VOZ?',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 24),
          BaseText.noChangeSubtle(
            'Tu apoyo es importante. Unete al movimiento ciudadano que '
            'esta transformando Popayan.',
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 32 : 48),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.heart),
            label: const Text('Quiero apoyar'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              foregroundColor:
                  Theme.of(context).appColors.secondary.strong,
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
// Private widgets
// ---------------------------------------------------------------------------

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.number,
    required this.label,
    required this.isMobile,
  });

  final String number;
  final String label;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? 140 : 180,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.soft,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          BaseText.primary(
            number,
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          BaseText(
            label,
            style: TypoSecondary.b3r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
