import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';

class VisionScreen extends StatelessWidget {
  const VisionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet = responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildMainVisionSection(context, isMobile),
        _buildPrinciplesSection(context, isMobile, isTablet),
        _buildFutureSection(context, isMobile),
        _buildQuoteSection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
    height: isMobile ? 350 : 450,
    width: double.infinity,
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(Pngs.kHome3),
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
          Theme.of(context).appColors.secondary.strong.withValues(alpha: 0.8),
          BlendMode.multiply,
        ),
      ),
    ),
    child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BaseText.noChangeSubtle(
              'VISION DE CIUDAD',
              style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
            ),
            const SizedBox(height: 16),
            BaseText.noChangeSubtle(
              'El Popayan que Sonamos',
              style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: BaseText.noChangeSubtle(
                'Una ciudad moderna, humana y sostenible donde cada '
                'payanés pueda vivir con dignidad y esperanza.',
                style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildMainVisionSection(
    BuildContext context,
    bool isMobile,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 60 : 100,
    ),
    child: Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            children: <Widget>[
              Icon(
                Iconsax.eye,
                size: 48,
                color: Theme.of(context).appColors.primary.strong,
              ),
              const SizedBox(height: 24),
              BaseText(
                'Nuestra Vision',
                style: TypoPrimary.h3.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              BaseText(
                'Queremos transformar a Popayan en una ciudad que sea '
                'referente de desarrollo sostenible en Colombia. Una ciudad '
                'donde la seguridad, la educacion, el empleo y la calidad de '
                'vida sean una realidad para todos sus habitantes.',
                style: TypoSecondary.b1r.copyWith(height: 1.8),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              BaseText(
                'Imaginamos un Popayan que conserva su rica herencia cultural '
                'y arquitectonica, mientras abraza la innovacion y el progreso. '
                'Una ciudad que cuida a sus ciudadanos, protege su medio ambiente '
                'y genera oportunidades para las nuevas generaciones.',
                style: TypoSecondary.b1r.copyWith(height: 1.8),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildPrinciplesSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    final List<Map<String, dynamic>> principles = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Iconsax.people,
        'title': 'Ciudad Humana',
        'description':
            'Una ciudad que pone a las personas en el centro de todas '
            'las decisiones, priorizando el bienestar de las familias.',
      },
      <String, dynamic>{
        'icon': Iconsax.tree,
        'title': 'Ciudad Sostenible',
        'description':
            'Desarrollo que respeta el medio ambiente y garantiza recursos '
            'para las futuras generaciones.',
      },
      <String, dynamic>{
        'icon': Iconsax.building_4,
        'title': 'Ciudad Moderna',
        'description':
            'Infraestructura de calidad, tecnologia al servicio ciudadano '
            'y conectividad para todos.',
      },
      <String, dynamic>{
        'icon': Iconsax.shield_tick,
        'title': 'Ciudad Segura',
        'description':
            'Espacios publicos seguros donde las familias puedan caminar '
            'tranquilas a cualquier hora.',
      },
      <String, dynamic>{
        'icon': Iconsax.chart_2,
        'title': 'Ciudad Prospera',
        'description':
            'Oportunidades de empleo y emprendimiento para que nadie '
            'tenga que buscar su futuro lejos de casa.',
      },
      <String, dynamic>{
        'icon': Iconsax.heart,
        'title': 'Ciudad Incluyente',
        'description':
            'Una ciudad donde todos tengan voz y oportunidades, sin importar '
            'su origen, genero o condicion.',
      },
    ];

    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.tertiary.subtle,
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(
            title: 'Principios de Desarrollo',
            subtitle: 'Los pilares que guian nuestra vision de ciudad.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2.2 : 1.4,
            ),
            itemCount: principles.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> principle = principles[index];
              return _PrincipleCard(
                icon: principle['icon'] as IconData,
                title: principle['title'] as String,
                description: principle['description'] as String,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFutureSection(BuildContext context, bool isMobile) {
    final List<Map<String, String>> goals = <Map<String, String>>[
      <String, String>{
        'year': '2025',
        'goal': 'Reducir indices de inseguridad en un 30%',
      },
      <String, String>{
        'year': '2026',
        'goal': 'Pavimentacion del 80% de vias barriales',
      },
      <String, String>{
        'year': '2027',
        'goal': 'Cobertura total de educacion primaria de calidad',
      },
      <String, String>{
        'year': '2028',
        'goal': '5,000 nuevos empleos generados',
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
            title: 'Metas de Gobierno',
            subtitle: 'Compromisos medibles para los proximos 4 años.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: goals
                  .map(
                    (Map<String, String> goal) => _GoalItem(
                      year: goal['year']!,
                      goal: goal['goal']!,
                      isMobile: isMobile,
                    ),
                  )
                  .toList(),
            ),
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
      color: Theme.of(context).appColors.primary.strong,
    ),
    child: Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          children: <Widget>[
            Icon(
              Iconsax.quote_up,
              size: 48,
              color: Theme.of(
                context,
              ).appColors.neutralNoChange.subtle.withValues(alpha: 0.5),
            ),
            const SizedBox(height: 24),
            BaseText.noChangeSubtle(
              '"El Popayan que sonamos no es una utopia, es una meta '
              'alcanzable si trabajamos unidos. Cada calle pavimentada, '
              'cada nino educado, cada familia segura nos acerca a ese sueno."',
              style: (isMobile ? TypoSecondary.b1r : TypoPrimary.h4).copyWith(
                fontStyle: FontStyle.italic,
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            BaseText.noChangeSubtle(
              '- William Campino',
              style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}

class _PrincipleCard extends StatelessWidget {
  const _PrincipleCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.neutral.subtle,
      borderRadius: BorderRadius.circular(16),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Theme.of(context).appColors.opacity.base,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.primary.soft,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            size: 28,
            color: Theme.of(context).appColors.primary.strong,
          ),
        ),
        const SizedBox(height: 16),
        BaseText(
          title,
          style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        BaseText(
          description,
          style: TypoSecondary.b3r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
            height: 1.4,
          ),
          textAlign: TextAlign.center,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}

class _GoalItem extends StatelessWidget {
  const _GoalItem({
    required this.year,
    required this.goal,
    required this.isMobile,
  });

  final String year;
  final String goal;
  final bool isMobile;

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(bottom: 16),
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.neutral.subtle,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: Theme.of(context).appColors.primary.soft,
        width: 2,
      ),
    ),
    child: Row(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.primary.strong,
            borderRadius: BorderRadius.circular(8),
          ),
          child: BaseText.noChangeSubtle(
            year,
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: BaseText(
            goal,
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
          ),
        ),
        Icon(
          Iconsax.tick_circle,
          color: Theme.of(context).appColors.primary.soft,
          size: 24,
        ),
      ],
    ),
  );
}
