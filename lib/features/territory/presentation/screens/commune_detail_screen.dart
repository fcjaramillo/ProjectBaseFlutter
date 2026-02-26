import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class CommuneDetailScreen extends StatelessWidget {
  const CommuneDetailScreen({required this.communeId, super.key});

  final String communeId;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    // Mock data - in production this would come from Supabase
    final Map<String, dynamic> commune = _getCommuneById(communeId);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, commune),
          _buildOverview(context, isMobile, commune),
          _buildPriorities(context, isMobile, commune),
          _buildProposals(context, isMobile, commune),
          _buildLeaders(context, isMobile),
          _buildCtaSection(context, isMobile),
        ],
      ),
    );
  }

  Map<String, dynamic> _getCommuneById(String id) {
    final Map<String, Map<String, dynamic>> communes =
        <String, Map<String, dynamic>>{
      '1': <String, dynamic>{
        'id': '1',
        'name': 'Comuna 1 - Centro',
        'population': '25,000',
        'barrios': 15,
        'area': '3.2 km²',
        'description':
            'Corazon historico de Popayan, patrimonio arquitectonico y '
                'centro comercial de la ciudad. Hogar de las principales '
                'instituciones gubernamentales, religiosas y culturales.',
        'priorities': <Map<String, dynamic>>[
          <String, dynamic>{
            'icon': Iconsax.building,
            'title': 'Restauracion del patrimonio',
            'description':
                'Recuperar y preservar las edificaciones historicas del '
                    'centro colonial para mantener nuestra identidad cultural.',
          },
          <String, dynamic>{
            'icon': Iconsax.shield_tick,
            'title': 'Seguridad para comerciantes',
            'description':
                'Implementar sistemas de vigilancia y patrullaje constante '
                    'para proteger a los comerciantes y visitantes.',
          },
          <String, dynamic>{
            'icon': Iconsax.car,
            'title': 'Movilidad peatonal',
            'description':
                'Ampliar las zonas peatonales y mejorar la accesibilidad '
                    'para crear un centro mas amable con los ciudadanos.',
          },
        ],
        'proposals': <Map<String, dynamic>>[
          <String, dynamic>{
            'title': 'Red de camaras en el centro historico',
            'budget': '2,500 millones COP',
          },
          <String, dynamic>{
            'title': 'Peatonalizacion de la Calle 5',
            'budget': '1,800 millones COP',
          },
          <String, dynamic>{
            'title': 'Restauracion de fachadas coloniales',
            'budget': '3,200 millones COP',
          },
          <String, dynamic>{
            'title': 'Iluminacion artistica del patrimonio',
            'budget': '800 millones COP',
          },
        ],
      },
      '2': <String, dynamic>{
        'id': '2',
        'name': 'Comuna 2 - Norte',
        'population': '35,000',
        'barrios': 22,
        'area': '5.8 km²',
        'description':
            'Zona residencial en expansion con necesidades de infraestructura '
                'y servicios. Una comunidad diversa con gran potencial de '
                'desarrollo urbano planificado.',
        'priorities': <Map<String, dynamic>>[
          <String, dynamic>{
            'icon': Iconsax.routing,
            'title': 'Pavimentacion de vias',
            'description':
                'Mejorar las vias principales y secundarias para facilitar '
                    'la movilidad de los habitantes.',
          },
          <String, dynamic>{
            'icon': Iconsax.hospital,
            'title': 'Centros de salud',
            'description':
                'Construir y equipar centros de salud para atencion '
                    'primaria cercana a la comunidad.',
          },
          <String, dynamic>{
            'icon': Iconsax.teacher,
            'title': 'Educacion de calidad',
            'description':
                'Mejorar la infraestructura escolar y ampliar la cobertura '
                    'educativa en todos los niveles.',
          },
        ],
        'proposals': <Map<String, dynamic>>[
          <String, dynamic>{
            'title': 'Pavimentacion de 15 km de vias',
            'budget': '4,500 millones COP',
          },
          <String, dynamic>{
            'title': 'Centro de salud Norte',
            'budget': '2,800 millones COP',
          },
          <String, dynamic>{
            'title': 'Ampliacion IE Norte',
            'budget': '3,500 millones COP',
          },
        ],
      },
    };

    return communes[id] ??
        <String, dynamic>{
          'id': id,
          'name': 'Comuna $id',
          'population': '30,000',
          'barrios': 18,
          'area': '4.5 km²',
          'description':
              'Comunidad en desarrollo con necesidades especificas que '
                  'abordaremos con propuestas concretas y realizables.',
          'priorities': <Map<String, dynamic>>[
            <String, dynamic>{
              'icon': Iconsax.shield_tick,
              'title': 'Seguridad ciudadana',
              'description': 'Fortalecer la seguridad con tecnologia y '
                  'participacion comunitaria.',
            },
            <String, dynamic>{
              'icon': Iconsax.buildings,
              'title': 'Infraestructura basica',
              'description': 'Mejorar vias, servicios publicos y espacios '
                  'comunitarios.',
            },
            <String, dynamic>{
              'icon': Iconsax.people,
              'title': 'Desarrollo social',
              'description': 'Programas de apoyo a las familias mas '
                  'vulnerables de la comunidad.',
            },
          ],
          'proposals': <Map<String, dynamic>>[
            <String, dynamic>{
              'title': 'Mejoramiento de vias barriales',
              'budget': '2,000 millones COP',
            },
            <String, dynamic>{
              'title': 'CAI tecnologico',
              'budget': '800 millones COP',
            },
            <String, dynamic>{
              'title': 'Centro comunitario',
              'budget': '1,500 millones COP',
            },
          ],
        };
  }

  Widget _buildHeader(
      BuildContext context, bool isMobile, Map<String, dynamic> commune) {
    return Container(
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
          // Breadcrumb
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
                commune['name'] as String,
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
                  Iconsax.location,
                  size: 32,
                  color: Theme.of(context).appColors.neutralNoChange.subtle,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: BaseText.noChangeSubtle(
                  commune['name'] as String,
                  style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
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
              _buildInfoChip(
                context,
                Iconsax.people,
                '${commune['population']} habitantes',
              ),
              _buildInfoChip(
                context,
                Iconsax.buildings,
                '${commune['barrios']} barrios',
              ),
              _buildInfoChip(
                context,
                Iconsax.map,
                commune['area'] as String,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String text) {
    return Row(
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
  }

  Widget _buildOverview(
      BuildContext context, bool isMobile, Map<String, dynamic> commune) {
    return Container(
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
                  style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                BaseText(
                  commune['description'] as String,
                  style: TypoSecondary.b1r.copyWith(height: 1.8),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPriorities(
      BuildContext context, bool isMobile, Map<String, dynamic> commune) {
    final List<Map<String, dynamic>> priorities =
        commune['priorities'] as List<Map<String, dynamic>>;

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
            'Prioridades para esta comuna',
            style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          BaseText(
            'Hemos identificado las necesidades mas urgentes de tu comunidad.',
            style: TypoSecondary.b2r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
          ),
          const SizedBox(height: 32),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: priorities
                .map((Map<String, dynamic> priority) => _PriorityCard(
                      icon: priority['icon'] as IconData,
                      title: priority['title'] as String,
                      description: priority['description'] as String,
                      isMobile: isMobile,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildProposals(
      BuildContext context, bool isMobile, Map<String, dynamic> commune) {
    final List<Map<String, dynamic>> proposals =
        commune['proposals'] as List<Map<String, dynamic>>;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: <Widget>[
          BaseText(
            'Propuestas especificas',
            style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          BaseText(
            'Proyectos concretos que ejecutaremos en esta comuna.',
            style: TypoSecondary.b2r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: proposals.asMap().entries.map(
                (MapEntry<int, Map<String, dynamic>> entry) {
                  final Map<String, dynamic> proposal = entry.value;
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Theme.of(context).appColors.neutral.subtle,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Theme.of(context).appColors.neutral.soft,
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Theme.of(context).appColors.primary.soft,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: BaseText.primary(
                              '${entry.key + 1}',
                              style: TypoSecondary.b2r.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              BaseText(
                                proposal['title'] as String,
                                style: TypoSubtitles.s2.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              BaseText(
                                'Presupuesto: ${proposal['budget']}',
                                style: TypoSecondary.b3r.copyWith(
                                  color: Theme.of(context)
                                      .appColors
                                      .success
                                      .strong,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Iconsax.arrow_right_3,
                          color: Theme.of(context).appColors.primary.strong,
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeaders(BuildContext context, bool isMobile) {
    return Container(
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
                  style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                BaseText(
                  'Estamos en dialogo permanente con las JAC de cada barrio '
                  'para construir propuestas que respondan a las necesidades '
                  'reales de la comunidad.',
                  style: TypoSecondary.b2r.copyWith(
                    color: Theme.of(context).appColors.text.scale.soft,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
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
                  backgroundColor:
                      Theme.of(context).appColors.neutralNoChange.subtle,
                  foregroundColor: Theme.of(context).appColors.primary.strong,
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => context.go(Routes.territory),
                icon: const Icon(Iconsax.map),
                label: const Text('Ver otras comunas'),
                style: OutlinedButton.styleFrom(
                  foregroundColor:
                      Theme.of(context).appColors.neutralNoChange.subtle,
                  side: BorderSide(
                    color: Theme.of(context).appColors.neutralNoChange.subtle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PriorityCard extends StatelessWidget {
  const _PriorityCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String description;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).appColors.neutral.soft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.primary.soft,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 24,
              color: Theme.of(context).appColors.primary.strong,
            ),
          ),
          const SizedBox(height: 16),
          BaseText(
            title,
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          BaseText(
            description,
            style: TypoSecondary.b3r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
