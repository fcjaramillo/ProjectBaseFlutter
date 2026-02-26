import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class LifeStoryScreen extends StatefulWidget {
  const LifeStoryScreen({super.key});

  @override
  State<LifeStoryScreen> createState() => _LifeStoryScreenState();
}

class _LifeStoryScreenState extends State<LifeStoryScreen> {
  String _selectedFilter = 'Todos';

  final List<String> _filters = <String>[
    'Todos',
    'Personal',
    'Profesional',
    'Academico',
  ];

  final List<Map<String, dynamic>> _milestones = <Map<String, dynamic>>[
    <String, dynamic>{
      'year': '1975',
      'title': 'Nacimiento en Popayan',
      'description':
          'Naci en la ciudad blanca de Colombia, Popayan, Cauca. '
          'Desde pequeno, mi familia me inculco valores de servicio, '
          'honestidad y amor por nuestra tierra.',
      'category': 'Personal',
      'image': null,
    },
    <String, dynamic>{
      'year': '1993',
      'title': 'Graduacion Bachiller',
      'description':
          'Me gradue del colegio con honores, destacandome en actividades '
          'de liderazgo estudiantil y servicio comunitario.',
      'category': 'Academico',
      'image': null,
    },
    <String, dynamic>{
      'year': '1995',
      'title': 'Ingreso a la Policia Nacional',
      'description':
          'Decidi servir a mi pais ingresando a la Policia Nacional de Colombia, '
          'comenzando una carrera de mas de dos decadas dedicada a la seguridad '
          'y el bienestar de los ciudadanos.',
      'category': 'Profesional',
      'image': null,
    },
    <String, dynamic>{
      'year': '1999',
      'title': 'Especializacion en Comunicaciones',
      'description':
          'Obtuve mi especializacion en Comunicaciones Estrategicas, '
          'desarrollando habilidades para conectar con las comunidades '
          'y transmitir mensajes de paz y seguridad.',
      'category': 'Academico',
      'image': null,
    },
    <String, dynamic>{
      'year': '2002',
      'title': 'Matrimonio',
      'description':
          'Contraje matrimonio y forme mi familia, pilar fundamental '
          'que me ha acompanado y apoyado en cada etapa de mi vida.',
      'category': 'Personal',
      'image': null,
    },
    <String, dynamic>{
      'year': '2005',
      'title': 'Jefe de Comunicaciones Regionales',
      'description':
          'Fui nombrado Jefe de Comunicaciones para la region del Cauca, '
          'donde lidere equipos de trabajo y desarrolle estrategias '
          'de comunicacion efectivas para la institucion.',
      'category': 'Profesional',
      'image': null,
    },
    <String, dynamic>{
      'year': '2010',
      'title': 'Primera Condecoracion Nacional',
      'description':
          'Recibi mi primera condecoracion a nivel nacional por servicios '
          'distinguidos en operaciones de seguridad ciudadana.',
      'category': 'Profesional',
      'image': null,
    },
    <String, dynamic>{
      'year': '2015',
      'title': 'Maestria en Gestion Publica',
      'description':
          'Culmine mi maestria en Gestion Publica, preparandome para '
          'contribuir de manera mas efectiva al desarrollo de mi comunidad.',
      'category': 'Academico',
      'image': null,
    },
    <String, dynamic>{
      'year': '2018',
      'title': 'Retiro Honroso de la Policia',
      'description':
          'Despues de mas de 24 años de servicio, me retire de la Policia Nacional '
          'con multiples reconocimientos y la satisfaccion del deber cumplido.',
      'category': 'Profesional',
      'image': null,
    },
    <String, dynamic>{
      'year': '2020',
      'title': 'Trabajo Comunitario',
      'description':
          'Inicie un trabajo activo con comunidades vulnerables de Popayan, '
          'escuchando sus necesidades y buscando soluciones concretas.',
      'category': 'Personal',
      'image': null,
    },
    <String, dynamic>{
      'year': '2024',
      'title': 'Candidatura a la Alcaldia',
      'description':
          'Con el respaldo de mi comunidad, decidi postularme como candidato '
          'a la alcaldia de Popayan para servir a mi ciudad natal desde '
          'esta nueva posicion.',
      'category': 'Profesional',
      'image': null,
    },
  ];

  List<Map<String, dynamic>> get _filteredMilestones {
    if (_selectedFilter == 'Todos') {
      return _milestones;
    }
    return _milestones
        .where((Map<String, dynamic> m) => m['category'] == _selectedFilter)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Hero Section
        _buildHeroSection(context, isMobile),

        // Filter Section
        _buildFilterSection(context, isMobile),

        // Timeline Section
        _buildTimelineSection(context, isMobile),

        // Quote Section
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

  Widget _buildFilterSection(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80, vertical: 30),
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
            final bool isSelected = _selectedFilter == filter;
            return FilterChip(
              label: Text(filter),
              selected: isSelected,
              onSelected: (bool selected) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              backgroundColor: Theme.of(context).appColors.neutral.subtle,
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

  Widget _buildTimelineSection(BuildContext context, bool isMobile) {
    final List<Map<String, dynamic>> milestones = _filteredMilestones;

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
                    year: milestones[i]['year'] as String,
                    title: milestones[i]['title'] as String,
                    description: milestones[i]['description'] as String,
                    category: milestones[i]['category'] as String,
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
              style: (isMobile ? TypoSecondary.b1r : TypoPrimary.h4).copyWith(
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

  Widget _buildMobileLayout(BuildContext context, Color categoryColor) =>
      IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Timeline line
            Column(
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
                    color: Theme.of(context).appColors.neutralNoChange.subtle,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Theme.of(context).appColors.neutral.soft,
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 32),
                child: _buildCard(context, categoryColor),
              ),
            ),
          ],
        ),
      );

  Widget _buildDesktopLayout(BuildContext context, Color categoryColor) =>
      IntrinsicHeight(
        child: Row(
          children: <Widget>[
            // Left content
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
                    color: Theme.of(context).appColors.neutralNoChange.subtle,
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Theme.of(context).appColors.neutral.soft,
                    ),
                  ),
              ],
            ),
            // Right content
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
      border: Border.all(color: Theme.of(context).appColors.neutral.soft),
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
        // Year badge
        Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: categoryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: BaseText.noChangeSubtle(
                year,
                style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
        // Title
        BaseText(
          title,
          style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        // Description
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
