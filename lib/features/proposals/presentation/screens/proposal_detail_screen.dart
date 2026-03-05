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

part 'proposal_detail_screen.g.dart';

// ---------------------------------------------------------------------------
// State
// ---------------------------------------------------------------------------

class ProposalDetailState {
  ProposalDetailState({
    required this.isLoading,
    this.proposal,
    this.error,
  });

  final bool isLoading;
  final Proposal? proposal;
  final String? error;

  factory ProposalDetailState.initial() => ProposalDetailState(
        isLoading: false,
      );

  ProposalDetailState copyWith({
    bool? isLoading,
    Proposal? proposal,
    String? error,
    bool clearError = false,
  }) =>
      ProposalDetailState(
        isLoading: isLoading ?? this.isLoading,
        proposal: proposal ?? this.proposal,
        error: clearError ? null : error ?? this.error,
      );
}

// ---------------------------------------------------------------------------
// ViewModel
// ---------------------------------------------------------------------------

@riverpod
class ProposalDetailViewModel extends _$ProposalDetailViewModel {
  @override
  ProposalDetailState build() => ProposalDetailState.initial();

  Future<void> loadProposal(String id) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<Proposal?> result =
        await ref.read(getProposalByIdUseCaseProvider).call(id);

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar la propuesta',
        );
      },
      success: (Proposal? proposal) {
        state = state.copyWith(isLoading: false, proposal: proposal);
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Screen
// ---------------------------------------------------------------------------

class ProposalDetailScreen extends ConsumerStatefulWidget {
  const ProposalDetailScreen({required this.proposalId, super.key});

  final String proposalId;

  @override
  ConsumerState<ProposalDetailScreen> createState() =>
      _ProposalDetailScreenState();
}

class _ProposalDetailScreenState
    extends ConsumerState<ProposalDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(proposalDetailViewModelProvider.notifier)
          .loadProposal(widget.proposalId);
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
    final ProposalDetailState detailState =
        ref.watch(proposalDetailViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    if (detailState.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(80),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (detailState.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: BaseText(
            detailState.error!,
            style: TypoSecondary.b2r,
          ),
        ),
      );
    }

    if (detailState.proposal == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: BaseText(
            'Propuesta no encontrada.',
            style: TypoSecondary.b2r,
          ),
        ),
      );
    }

    final Proposal proposal = detailState.proposal!;
    final Color headerColor =
        _getCategoryColor(context, proposal.category);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, proposal, headerColor),
          _buildContent(context, isMobile, proposal),
          _buildRelatedProposals(context, isMobile, proposal.category),
          _buildCtaSection(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildHeader(
    BuildContext context,
    bool isMobile,
    Proposal proposal,
    Color headerColor,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(color: headerColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => context.go(Routes.proposals),
                child: BaseText.noChangeSubtle(
                  'Propuestas',
                  style: TypoSecondary.b3r,
                ),
              ),
              BaseText.noChangeSubtle(' / ', style: TypoSecondary.b3r),
              BaseText.noChangeSubtle(
                proposal.category ?? '',
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
                  _getCategoryIcon(proposal.category),
                  size: 32,
                  color:
                      Theme.of(context).appColors.neutralNoChange.subtle,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: BaseText.noChangeSubtle(
                  proposal.title,
                  style:
                      (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    bool isMobile,
    Proposal proposal,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildMainContent(context, proposal),
                const SizedBox(height: 40),
                _buildSidebar(context, proposal),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _buildMainContent(context, proposal),
                ),
                const SizedBox(width: 40),
                Expanded(child: _buildSidebar(context, proposal)),
              ],
            ),
    );
  }

  Widget _buildMainContent(BuildContext context, Proposal proposal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Descripcion',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        BaseText(
          proposal.description ?? 'Sin descripcion disponible.',
          style: TypoSecondary.b1r.copyWith(height: 1.8),
        ),
        if (proposal.category != null) ...<Widget>[
          const SizedBox(height: 32),
          BaseText(
            'Categoria',
            style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: _getCategoryColor(context, proposal.category)
                  .withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: BaseText(
              proposal.category!,
              style: TypoSecondary.b2r.copyWith(
                color: _getCategoryColor(context, proposal.category),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildSidebar(BuildContext context, Proposal proposal) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.tertiary.subtle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BaseText(
            'Informacion del proyecto',
            style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _buildInfoItem(
            context,
            Iconsax.category,
            'Categoria',
            proposal.category ?? 'Sin categoria',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            context,
            Iconsax.document_text,
            'ID de propuesta',
            proposal.id,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.document_download, size: 18),
              label: const Text('Descargar PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).appColors.primary.strong,
                foregroundColor:
                    Theme.of(context).appColors.neutralNoChange.subtle,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: 20,
          color: Theme.of(context).appColors.primary.strong,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText(
                label,
                style: TypoSecondary.b4r.copyWith(
                  color: Theme.of(context).appColors.text.scale.soft,
                ),
              ),
              BaseText(
                value,
                style: TypoSecondary.b2r
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedProposals(
    BuildContext context,
    bool isMobile,
    String? category,
  ) {
    return Container(
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
            'Propuestas relacionadas',
            style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          BaseText(
            category != null
                ? 'Explora otras propuestas de $category.'
                : 'Explora otras propuestas del plan de gobierno.',
            style: TypoSecondary.b2r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.go(Routes.proposals),
            child: const Text('Ver todas las propuestas'),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.strong,
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'QUE OPINAS DE ESTA PROPUESTA?',
            style: (isMobile ? TypoPrimary.h4 : TypoPrimary.h3).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Tu opinion es importante para mejorar nuestras propuestas.',
            style: TypoSecondary.b2r,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => context.go(Routes.contact),
            icon: const Icon(Iconsax.message),
            label: const Text('Enviar comentario'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              foregroundColor:
                  Theme.of(context).appColors.primary.strong,
            ),
          ),
        ],
      ),
    );
  }
}
