import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class StrategicAxesScreen extends StatelessWidget {
  const StrategicAxesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildIntroSection(context, isMobile),
        _buildAxesSection(context, isMobile),
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
        children: <Widget>[
          BaseText.noChangeSubtle(
            'PLAN DE GOBIERNO',
            style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Ejes Estrategicos',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Nuestra propuesta se fundamenta en pilares esenciales '
              'para transformar Popayan en la ciudad que merecemos.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIntroSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 900),
        child: BaseText(
          'Cada eje estrategico representa un area fundamental para el '
          'desarrollo de nuestra ciudad. Hemos identificado los principales '
          'desafios y diseñado propuestas concretas para abordarlos de manera '
          'integral y sostenible.',
          style: TypoSecondary.b1r.copyWith(height: 1.8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildAxesSection(BuildContext context, bool isMobile) {
    final List<Map<String, dynamic>> axes = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Iconsax.shield_tick,
        'title': 'Seguridad Ciudadana',
        'subtitle': 'Popayan seguro para todos',
        'color': Theme.of(context).appColors.error.strong,
        'description':
            'Implementaremos estrategias integrales de seguridad que '
                'combinen tecnologia, presencia policial y participacion '
                'ciudadana para recuperar la tranquilidad de nuestros barrios.',
        'highlights': <String>[
          'Red de camaras de vigilancia en zonas criticas',
          '15 nuevos CAI con tecnologia moderna',
          'Programas de prevencion del delito juvenil',
          'Iluminacion de espacios publicos',
          'Frentes de seguridad barriales',
        ],
      },
      <String, dynamic>{
        'icon': Iconsax.chart,
        'title': 'Desarrollo Economico',
        'subtitle': 'Empleo y oportunidades',
        'color': Theme.of(context).appColors.success.strong,
        'description':
            'Impulsaremos la economia local apoyando a emprendedores, '
                'atrayendo inversion y generando condiciones para que las '
                'empresas crezcan y generen empleo de calidad.',
        'highlights': <String>[
          'Fondo de capital semilla para emprendedores',
          'Mercados campesinos permanentes',
          'Incentivos tributarios para nuevas empresas',
          'Formacion tecnica y tecnologica',
          'Turismo como motor economico',
        ],
      },
      <String, dynamic>{
        'icon': Iconsax.teacher,
        'title': 'Educacion de Calidad',
        'subtitle': 'Futuro para nuestros jovenes',
        'color': Theme.of(context).appColors.informative.strong,
        'description':
            'La educacion es la herramienta mas poderosa para transformar '
                'vidas. Garantizaremos acceso a educacion de calidad desde '
                'la primera infancia hasta la educacion superior.',
        'highlights': <String>[
          'Mejoramiento de infraestructura escolar',
          'Dotacion tecnologica para colegios publicos',
          'Programa de alimentacion escolar universal',
          'Becas universitarias municipales',
          'Escuelas de formacion artistica y deportiva',
        ],
      },
      <String, dynamic>{
        'icon': Iconsax.hospital,
        'title': 'Salud para Todos',
        'subtitle': 'Bienestar integral',
        'color': const Color(0xFFE91E63),
        'description':
            'Un sistema de salud cercano, eficiente y humanizado que '
                'llegue a todos los rincones de la ciudad con servicios '
                'de calidad y calidez.',
        'highlights': <String>[
          'Centros de salud en cada comuna',
          'Brigadas de salud preventiva',
          'Atencion especializada para adultos mayores',
          'Programas de salud mental',
          'Telemedicina para zonas rurales',
        ],
      },
      <String, dynamic>{
        'icon': Iconsax.car,
        'title': 'Movilidad Sostenible',
        'subtitle': 'Ciudad conectada',
        'color': Theme.of(context).appColors.warning.strong,
        'description':
            'Una ciudad con vias de calidad, transporte publico eficiente '
                'y alternativas de movilidad sostenible que faciliten el '
                'desplazamiento de todos los ciudadanos.',
        'highlights': <String>[
          'Pavimentacion de vias barriales',
          'Red de ciclorutas seguras',
          'Mejoramiento del transporte publico',
          'Zonas peatonales en el centro historico',
          'Senalizacion y semaforizacion inteligente',
        ],
      },
      <String, dynamic>{
        'icon': Iconsax.music,
        'title': 'Cultura y Tradicion',
        'subtitle': 'Identidad payanesa',
        'color': Theme.of(context).appColors.primary.strong,
        'description':
            'Popayan es cuna de tradicion y cultura. Fortaleceremos nuestra '
                'identidad cultural, apoyaremos a los artistas locales y '
                'preservaremos nuestro patrimonio.',
        'highlights': <String>[
          'Apoyo a artistas y gestores culturales',
          'Restauracion del patrimonio arquitectonico',
          'Bibliotecas y centros culturales barriales',
          'Festivales y eventos culturales',
          'Escuelas de musica y artes tradicionales',
        ],
      },
    ];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: Column(
        children: axes.asMap().entries.map((MapEntry<int, Map<String, dynamic>> entry) {
          final int index = entry.key;
          final Map<String, dynamic> axis = entry.value;
          return _AxisDetailCard(
            icon: axis['icon'] as IconData,
            title: axis['title'] as String,
            subtitle: axis['subtitle'] as String,
            description: axis['description'] as String,
            highlights: axis['highlights'] as List<String>,
            color: axis['color'] as Color,
            isReversed: !isMobile && index.isOdd,
            isMobile: isMobile,
          );
        }).toList(),
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
            'CONOCE LAS PROPUESTAS EN DETALLE',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 16 : 24),
          BaseText.noChangeSubtle(
            'Explora cada una de nuestras propuestas y descubre como '
            'vamos a transformar Popayan.',
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: isMobile ? 32 : 48),
          ElevatedButton.icon(
            onPressed: () => context.go(Routes.proposals),
            icon: const Icon(Iconsax.document_text),
            label: const Text('Ver todas las propuestas'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              foregroundColor: Theme.of(context).appColors.secondary.strong,
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

class _AxisDetailCard extends StatelessWidget {
  const _AxisDetailCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.highlights,
    required this.color,
    required this.isReversed,
    required this.isMobile,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String description;
  final List<String> highlights;
  final Color color;
  final bool isReversed;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    final Widget iconSection = Container(
      width: isMobile ? double.infinity : 300,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(
              icon,
              size: 48,
              color: Theme.of(context).appColors.neutralNoChange.subtle,
            ),
          ),
          const SizedBox(height: 20),
          BaseText(
            title,
            style: TypoPrimary.h4.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BaseText(
            subtitle,
            style: TypoSecondary.b2r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );

    final Widget contentSection = Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? 0 : 32,
          vertical: isMobile ? 24 : 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            BaseText(
              description,
              style: TypoSecondary.b1r.copyWith(height: 1.6),
            ),
            const SizedBox(height: 24),
            BaseText(
              'Acciones principales:',
              style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ...highlights.map(
              (String highlight) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Iconsax.tick_circle,
                      size: 20,
                      color: color,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: BaseText(
                        highlight,
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

    return Container(
      margin: const EdgeInsets.only(bottom: 48),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).appColors.neutral.soft,
        ),
      ),
      child: isMobile
          ? Column(
              children: <Widget>[
                iconSection,
                contentSection,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: isReversed
                  ? <Widget>[contentSection, iconSection]
                  : <Widget>[iconSection, contentSection],
            ),
    );
  }
}
