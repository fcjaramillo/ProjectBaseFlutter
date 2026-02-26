import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class ProposalsScreen extends StatefulWidget {
  const ProposalsScreen({super.key});

  @override
  State<ProposalsScreen> createState() => _ProposalsScreenState();
}

class _ProposalsScreenState extends State<ProposalsScreen> {
  String _selectedCategory = 'Todos';

  final List<String> _categories = <String>[
    'Todos',
    'Seguridad',
    'Economia',
    'Educacion',
    'Salud',
    'Movilidad',
    'Cultura',
  ];

  final List<Map<String, dynamic>> _proposals = <Map<String, dynamic>>[
    <String, dynamic>{
      'title': 'Fortalecimiento de la seguridad ciudadana',
      'description':
          'Implementar un sistema integral de seguridad con camaras de vigilancia, '
              'patrullaje constante y coordinacion con la Policia Nacional para '
              'reducir los indices de criminalidad en todos los barrios.',
      'category': 'Seguridad',
      'icon': Iconsax.shield_tick,
    },
    <String, dynamic>{
      'title': 'Red de CAI inteligentes',
      'description':
          'Construir 15 nuevos Comandos de Atencion Inmediata equipados con '
              'tecnologia de punta para una respuesta rapida ante emergencias.',
      'category': 'Seguridad',
      'icon': Iconsax.building,
    },
    <String, dynamic>{
      'title': 'Apoyo al emprendimiento local',
      'description':
          'Crear un fondo de capital semilla y asesoria empresarial para '
              'emprendedores payaneses, con enfasis en jovenes y mujeres cabeza de hogar.',
      'category': 'Economia',
      'icon': Iconsax.chart,
    },
    <String, dynamic>{
      'title': 'Mercados campesinos permanentes',
      'description':
          'Establecer espacios permanentes para que los campesinos del Cauca '
              'vendan sus productos directamente a los consumidores, eliminando intermediarios.',
      'category': 'Economia',
      'icon': Iconsax.shop,
    },
    <String, dynamic>{
      'title': 'Educacion de calidad para todos',
      'description':
          'Mejorar la infraestructura educativa, dotar de tecnologia a las escuelas '
              'publicas y garantizar programas de alimentacion escolar.',
      'category': 'Educacion',
      'icon': Iconsax.teacher,
    },
    <String, dynamic>{
      'title': 'Becas universitarias municipales',
      'description':
          'Crear un programa de becas para estudiantes destacados de estratos '
              '1, 2 y 3 que quieran acceder a educacion superior.',
      'category': 'Educacion',
      'icon': Iconsax.book,
    },
    <String, dynamic>{
      'title': 'Centros de salud barriales',
      'description':
          'Construir y equipar centros de atencion primaria en cada comuna para '
              'descongestionar el hospital universitario y acercar la salud a las familias.',
      'category': 'Salud',
      'icon': Iconsax.hospital,
    },
    <String, dynamic>{
      'title': 'Brigadas de salud comunitarias',
      'description':
          'Implementar jornadas periodicas de salud preventiva, vacunacion y '
              'atencion medica gratuita en los barrios mas vulnerables.',
      'category': 'Salud',
      'icon': Iconsax.health,
    },
    <String, dynamic>{
      'title': 'Plan de movilidad sostenible',
      'description':
          'Desarrollar ciclorutas seguras, mejorar el transporte publico y '
              'crear zonas peatonales en el centro historico.',
      'category': 'Movilidad',
      'icon': Iconsax.car,
    },
    <String, dynamic>{
      'title': 'Rehabilitacion de vias',
      'description':
          'Pavimentar y mantener las vias secundarias de los barrios, '
              'garantizando acceso digno para todas las comunidades.',
      'category': 'Movilidad',
      'icon': Iconsax.map,
    },
    <String, dynamic>{
      'title': 'Popayan: Ciudad Cultural',
      'description':
          'Fortalecer las tradiciones culturales, apoyar a artistas locales '
              'y promover eventos que resalten la identidad payanesa.',
      'category': 'Cultura',
      'icon': Iconsax.music,
    },
    <String, dynamic>{
      'title': 'Bibliotecas y centros culturales',
      'description':
          'Crear espacios de lectura y expresion artistica en cada comuna, '
              'con programas gratuitos para ninos, jovenes y adultos.',
      'category': 'Cultura',
      'icon': Iconsax.book_1,
    },
  ];

  List<Map<String, dynamic>> get _filteredProposals {
    if (_selectedCategory == 'Todos') {
      return _proposals;
    }
    return _proposals
        .where((Map<String, dynamic> p) => p['category'] == _selectedCategory)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet = responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Hero Section
        _buildHeroSection(context, isMobile),

        // Filter Section
        _buildFilterSection(context, isMobile),

        // Proposals Grid
        _buildProposalsGrid(context, isMobile, isTablet),

        // CTA Section
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
              'Un plan construido con la comunidad, para resolver los problemas '
              'reales de nuestra ciudad y construir el Popayan que merecemos.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(BuildContext context, bool isMobile) {
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
              final bool isSelected = _selectedCategory == category;
              return FilterChip(
                label: Text(category),
                selected: isSelected,
                onSelected: (bool selected) {
                  setState(() {
                    _selectedCategory = category;
                  });
                },
                backgroundColor:
                    Theme.of(context).appColors.neutral.subtle,
                selectedColor: Theme.of(context).appColors.primary.soft,
                checkmarkColor: Theme.of(context).appColors.primary.strong,
                labelStyle: TypoSecondary.b3r.copyWith(
                  color: isSelected
                      ? Theme.of(context).appColors.primary.strong
                      : null,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
  ) {
    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
    final List<Map<String, dynamic>> proposals = _filteredProposals;

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
                final Map<String, dynamic> proposal = proposals[index];
                return _ProposalCard(
                  title: proposal['title'] as String,
                  description: proposal['description'] as String,
                  category: proposal['category'] as String,
                  icon: proposal['icon'] as IconData,
                );
              },
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
            onPressed: () {},
            icon: const Icon(Iconsax.message),
            label: const Text('Enviar propuesta'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              foregroundColor: Theme.of(context).appColors.secondary.base,
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

class _ProposalCard extends StatefulWidget {
  const _ProposalCard({
    required this.title,
    required this.description,
    required this.category,
    required this.icon,
  });

  final String title;
  final String description;
  final String category;
  final IconData icon;

  @override
  State<_ProposalCard> createState() => _ProposalCardState();
}

class _ProposalCardState extends State<_ProposalCard> {
  bool _isHovered = false;

  Color _getCategoryColor(BuildContext context) {
    switch (widget.category) {
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

  @override
  Widget build(BuildContext context) {
    final Color categoryColor = _getCategoryColor(context);

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
              // Category badge and icon
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
              // Title
              BaseText(
                widget.title,
                style: TypoSubtitles.s2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              // Description
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
