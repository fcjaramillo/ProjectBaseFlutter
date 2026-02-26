import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class ProposalDetailScreen extends StatelessWidget {
  const ProposalDetailScreen({required this.proposalId, super.key});

  final String proposalId;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    // Mock data - in production this would come from Supabase
    final Map<String, dynamic> proposal = _getProposalById(proposalId);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, proposal),
          _buildContent(context, isMobile, proposal),
          _buildRelatedProposals(context, isMobile),
          _buildCtaSection(context, isMobile),
        ],
      ),
    );
  }

  Map<String, dynamic> _getProposalById(String id) {
    // Mock data
    return <String, dynamic>{
      'id': id,
      'title': 'Fortalecimiento de la seguridad ciudadana',
      'category': 'Seguridad',
      'icon': Iconsax.shield_tick,
      'description':
          'Implementar un sistema integral de seguridad con camaras de '
              'vigilancia, patrullaje constante y coordinacion con la Policia '
              'Nacional para reducir los indices de criminalidad.',
      'objectives': <String>[
        'Reducir los indices de criminalidad en un 30%',
        'Instalar 500 camaras de vigilancia en zonas criticas',
        'Crear 15 nuevos CAI con tecnologia moderna',
        'Implementar patrullaje inteligente 24/7',
        'Fortalecer los frentes de seguridad barriales',
      ],
      'actions': <String>[
        'Diagnostico de zonas de alto riesgo',
        'Alianzas con la Policia Nacional',
        'Capacitacion a lideres comunitarios',
        'Sistema de alertas tempranas',
        'Iluminacion de espacios publicos',
      ],
      'timeline': '2025-2027',
      'budget': '45 mil millones COP',
      'beneficiaries': '320,000 habitantes',
    };
  }

  Widget _buildHeader(
      BuildContext context, bool isMobile, Map<String, dynamic> proposal) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.error.strong,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Breadcrumb
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
                proposal['category'] as String,
                style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
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
                  proposal['icon'] as IconData,
                  size: 32,
                  color: Theme.of(context).appColors.neutralNoChange.subtle,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: BaseText.noChangeSubtle(
                  proposal['title'] as String,
                  style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
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
      BuildContext context, bool isMobile, Map<String, dynamic> proposal) {
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

  Widget _buildMainContent(
      BuildContext context, Map<String, dynamic> proposal) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Descripcion',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        BaseText(
          proposal['description'] as String,
          style: TypoSecondary.b1r.copyWith(height: 1.8),
        ),
        const SizedBox(height: 32),
        BaseText(
          'Objetivos',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...(proposal['objectives'] as List<String>).map(
          (String objective) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Iconsax.tick_circle,
                  size: 20,
                  color: Theme.of(context).appColors.success.strong,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: BaseText(objective, style: TypoSecondary.b2r),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        BaseText(
          'Acciones a implementar',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...(proposal['actions'] as List<String>).asMap().entries.map(
          (MapEntry<int, String> entry) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appColors.primary.soft,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                    child: BaseText.primary(
                      '${entry.key + 1}',
                      style: TypoSecondary.b3r
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: BaseText(entry.value, style: TypoSecondary.b2r),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSidebar(BuildContext context, Map<String, dynamic> proposal) {
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
            Iconsax.calendar,
            'Plazo de ejecucion',
            proposal['timeline'] as String,
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            context,
            Iconsax.wallet_2,
            'Presupuesto estimado',
            proposal['budget'] as String,
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            context,
            Iconsax.people,
            'Beneficiarios',
            proposal['beneficiaries'] as String,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.document_download, size: 18),
              label: const Text('Descargar PDF'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).appColors.primary.strong,
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
                style: TypoSecondary.b2r.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRelatedProposals(BuildContext context, bool isMobile) {
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
            'Explora otras propuestas de seguridad ciudadana.',
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
              foregroundColor: Theme.of(context).appColors.primary.strong,
            ),
          ),
        ],
      ),
    );
  }
}
