import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class TerritoryScreen extends StatefulWidget {
  const TerritoryScreen({super.key});

  @override
  State<TerritoryScreen> createState() => _TerritoryScreenState();
}

class _TerritoryScreenState extends State<TerritoryScreen> {
  int? _selectedCommune;

  final List<Map<String, dynamic>> _communes = <Map<String, dynamic>>[
    <String, dynamic>{
      'id': 1,
      'name': 'Comuna 1 - Centro',
      'population': '25,000',
      'barrios': 15,
      'description':
          'Corazon historico de Popayan, patrimonio arquitectonico y '
              'centro comercial de la ciudad.',
      'priorities': <String>[
        'Restauracion del patrimonio',
        'Seguridad para comerciantes',
        'Movilidad peatonal',
      ],
    },
    <String, dynamic>{
      'id': 2,
      'name': 'Comuna 2 - Norte',
      'population': '35,000',
      'barrios': 22,
      'description':
          'Zona residencial en expansion con necesidades de '
              'infraestructura y servicios.',
      'priorities': <String>[
        'Pavimentacion de vias',
        'Centros de salud',
        'Educacion de calidad',
      ],
    },
    <String, dynamic>{
      'id': 3,
      'name': 'Comuna 3 - Oriente',
      'population': '28,000',
      'barrios': 18,
      'description':
          'Comunidad trabajadora con fuerte presencia de comercio informal '
              'y emprendimientos locales.',
      'priorities': <String>[
        'Apoyo a emprendedores',
        'Formalizacion comercial',
        'Espacios deportivos',
      ],
    },
    <String, dynamic>{
      'id': 4,
      'name': 'Comuna 4 - Occidente',
      'population': '32,000',
      'barrios': 20,
      'description':
          'Zona de transicion entre lo urbano y lo rural con potencial '
              'turistico y agricola.',
      'priorities': <String>[
        'Conectividad vial',
        'Turismo rural',
        'Apoyo a campesinos',
      ],
    },
    <String, dynamic>{
      'id': 5,
      'name': 'Comuna 5 - Sur',
      'population': '40,000',
      'barrios': 25,
      'description':
          'Una de las comunas mas pobladas con diversidad social y '
              'economica significativa.',
      'priorities': <String>[
        'Seguridad ciudadana',
        'Centros educativos',
        'Parques recreativos',
      ],
    },
    <String, dynamic>{
      'id': 6,
      'name': 'Comuna 6 - Suroccidente',
      'population': '38,000',
      'barrios': 23,
      'description':
          'Comunidad en crecimiento con necesidades urgentes de '
              'infraestructura basica.',
      'priorities': <String>[
        'Agua y saneamiento',
        'Iluminacion publica',
        'Transporte publico',
      ],
    },
    <String, dynamic>{
      'id': 7,
      'name': 'Comuna 7 - Noroeste',
      'population': '30,000',
      'barrios': 19,
      'description':
          'Zona universitaria con gran poblacion juvenil y dinamica '
              'cultural activa.',
      'priorities': <String>[
        'Empleo juvenil',
        'Espacios culturales',
        'Ciclorutas',
      ],
    },
    <String, dynamic>{
      'id': 8,
      'name': 'Comuna 8 - Las Americas',
      'population': '45,000',
      'barrios': 28,
      'description':
          'La comuna mas extensa con comunidades diversas y retos '
              'de cobertura de servicios.',
      'priorities': <String>[
        'Cobertura de servicios',
        'Seguridad barrial',
        'Vias de acceso',
      ],
    },
    <String, dynamic>{
      'id': 9,
      'name': 'Comuna 9 - Poblado',
      'population': '20,000',
      'barrios': 12,
      'description':
          'Zona residencial consolidada con oportunidades de '
              'mejoramiento urbano.',
      'priorities': <String>[
        'Espacios verdes',
        'Movilidad sostenible',
        'Seguridad preventiva',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet = responsive.width >= 768 && responsive.width < 1200;

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeroSection(context, isMobile),
          _buildMapSection(context, isMobile, isTablet),
          _buildCommuneDetail(context, isMobile),
          _buildStatsSection(context, isMobile),
        ],
      ),
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
            'TERRITORIO',
            style: TypoSecondary.b2r.copyWith(
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          BaseText(
            'Popayan por Comunas',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText(
              'Conoce las propuestas especificas para cada comuna. '
              'Hemos caminado cada barrio para entender sus necesidades.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMapSection(BuildContext context, bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: <Widget>[
          BaseText(
            'Selecciona una comuna para ver las propuestas',
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          // Interactive map placeholder
          Container(
            height: isMobile ? 300 : 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.tertiary.subtle,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).appColors.neutral.soft,
              ),
            ),
            child: Stack(
              children: <Widget>[
                // Map placeholder
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Iconsax.map_1,
                        size: 64,
                        color: Theme.of(context).appColors.primary.soft,
                      ),
                      const SizedBox(height: 16),
                      BaseText(
                        'Mapa interactivo de Popayan',
                        style: TypoSecondary.b2r.copyWith(
                          color: Theme.of(context).appColors.text.scale.soft,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Commune buttons grid
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: _communes.map((Map<String, dynamic> commune) {
              final bool isSelected = _selectedCommune == commune['id'];
              return _CommuneButton(
                name: commune['name'] as String,
                isSelected: isSelected,
                onTap: () {
                  setState(() {
                    _selectedCommune = commune['id'] as int;
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommuneDetail(BuildContext context, bool isMobile) {
    if (_selectedCommune == null) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 20 : 80,
          vertical: 40,
        ),
        child: Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.tertiary.subtle,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: <Widget>[
              Icon(
                Iconsax.location,
                size: 48,
                color: Theme.of(context).appColors.primary.soft,
              ),
              const SizedBox(height: 16),
              BaseText(
                'Selecciona una comuna para ver las propuestas especificas',
                style: TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    final Map<String, dynamic> commune = _communes.firstWhere(
      (Map<String, dynamic> c) => c['id'] == _selectedCommune,
    );

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: Container(
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.neutral.subtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).appColors.primary.soft,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).appColors.primary.strong,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    Iconsax.location,
                    color: Theme.of(context).appColors.neutralNoChange.subtle,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText(
                        commune['name'] as String,
                        style: TypoPrimary.h4.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BaseText(
                        '${commune['population']} habitantes • '
                        '${commune['barrios']} barrios',
                        style: TypoSecondary.b3r.copyWith(
                          color: Theme.of(context).appColors.text.scale.soft,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BaseText(
              commune['description'] as String,
              style: TypoSecondary.b1r.copyWith(height: 1.6),
            ),
            const SizedBox(height: 24),
            BaseText(
              'Prioridades para esta comuna:',
              style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...(commune['priorities'] as List<String>).map(
              (String priority) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Iconsax.tick_circle,
                      size: 20,
                      color: Theme.of(context).appColors.primary.strong,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BaseText(
                        priority,
                        style: TypoSecondary.b2r,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context, bool isMobile) {
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
            'POPAYAN EN NUMEROS',
            style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Conocemos cada rincon',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 40 : 60),
          Wrap(
            spacing: isMobile ? 24 : 48,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: <Widget>[
              _StatItem(number: '9', label: 'Comunas', isMobile: isMobile),
              _StatItem(number: '182', label: 'Barrios', isMobile: isMobile),
              _StatItem(number: '320K', label: 'Habitantes', isMobile: isMobile),
              _StatItem(number: '100%', label: 'Recorrido', isMobile: isMobile),
            ],
          ),
        ],
      ),
    );
  }
}

class _CommuneButton extends StatefulWidget {
  const _CommuneButton({
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  State<_CommuneButton> createState() => _CommuneButtonState();
}

class _CommuneButtonState extends State<_CommuneButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: widget.isSelected
                ? Theme.of(context).appColors.primary.strong
                : _isHovered
                    ? Theme.of(context).appColors.primary.soft
                    : Theme.of(context).appColors.neutral.subtle,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: widget.isSelected || _isHovered
                  ? Theme.of(context).appColors.primary.strong
                  : Theme.of(context).appColors.neutral.soft,
            ),
          ),
          child: BaseText(
            widget.name,
            style: TypoSecondary.b3r.copyWith(
              fontWeight: widget.isSelected ? FontWeight.bold : FontWeight.normal,
              color: widget.isSelected
                  ? Theme.of(context).appColors.neutralNoChange.subtle
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.number,
    required this.label,
    required this.isMobile,
  });

  final String number;
  final String label;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        BaseText.noChangeSubtle(
          number,
          style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        BaseText.noChangeSubtle(
          label.toUpperCase(),
          style: TypoSecondary.b3r.copyWith(letterSpacing: 1.5),
        ),
      ],
    );
  }
}
