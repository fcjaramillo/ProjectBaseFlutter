import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';

class CandidateScreen extends StatelessWidget {
  const CandidateScreen({super.key});

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

        // Biography Section
        _buildBiographySection(context, isMobile),

        // Values Section
        _buildValuesSection(context, isMobile, isTablet),

        // Achievements Section
        _buildAchievementsSection(context, isMobile),

        // CTA to Life Story
        _buildCtaSection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
    height: isMobile ? 400 : 500,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: <Color>[
          Theme.of(context).appColors.primary.strong,
          Theme.of(context).appColors.secondary.base,
        ],
      ),
    ),
    child: Stack(
      children: <Widget>[
        // Background pattern
        Positioned.fill(
          child: Opacity(
            opacity: 0.1,
            child: CustomPaint(painter: _PatternPainter()),
          ),
        ),
        // Content
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (!isMobile) ...<Widget>[
                  // Candidate image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      Pngs.kHome3,
                      height: 350,
                      width: 280,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 60),
                ],
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: isMobile
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      BaseText.noChangeSubtle(
                        'CONOCE A',
                        style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
                      ),
                      const SizedBox(height: 8),
                      BaseText.noChangeSubtle(
                        'WILLIAM CAMPIÑO',
                        style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1)
                            .copyWith(fontWeight: FontWeight.bold),
                        textAlign: isMobile
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                      const SizedBox(height: 16),
                      BaseText.noChangeSubtle(
                        'Un lider con experiencia, compromiso y amor por Popayan',
                        style: (isMobile
                            ? TypoSecondary.b2r
                            : TypoSecondary.b1r),
                        textAlign: isMobile
                            ? TextAlign.center
                            : TextAlign.start,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );

  Widget _buildBiographySection(
    BuildContext context,
    bool isMobile,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 60 : 100,
    ),
    child: Column(
      children: <Widget>[
        const SectionHeader(
          title: 'Biografia',
          subtitle:
              'Una vida dedicada al servicio publico y al bienestar de la comunidad.',
        ),
        SizedBox(height: isMobile ? 40 : 60),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText(
                'William Campino nacio en Popayan, Cauca, y desde joven mostro un profundo compromiso con su comunidad. Con mas de 24 años de servicio en la Policia Nacional, ha demostrado su dedicacion a la seguridad y el bienestar de los ciudadanos.',
                style: TypoSecondary.b1r.copyWith(height: 1.8),
              ),
              const SizedBox(height: 24),
              BaseText(
                'Su trayectoria profesional incluye mas de 18 años liderando equipos de Comunicaciones Estrategicas, donde desarrollo habilidades unicas para conectar con las personas y entender sus necesidades reales.',
                style: TypoSecondary.b1r.copyWith(height: 1.8),
              ),
              const SizedBox(height: 24),
              BaseText(
                'Reconocido con 111 felicitaciones especiales y 19 condecoraciones de diversas instituciones, William Campino representa el compromiso, la honestidad y el trabajo arduo que Popayan necesita para avanzar hacia un futuro mejor.',
                style: TypoSecondary.b1r.copyWith(height: 1.8),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildValuesSection(
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    final List<Map<String, dynamic>> values = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Iconsax.heart,
        'title': 'Compromiso',
        'description':
            'Dedicacion absoluta al servicio de la comunidad payanesa.',
      },
      <String, dynamic>{
        'icon': Iconsax.shield_tick,
        'title': 'Honestidad',
        'description': 'Transparencia y rectitud en cada accion y decision.',
      },
      <String, dynamic>{
        'icon': Iconsax.people,
        'title': 'Cercania',
        'description':
            'Escuchar y trabajar junto a los ciudadanos en las calles.',
      },
      <String, dynamic>{
        'icon': Iconsax.award,
        'title': 'Experiencia',
        'description': 'Mas de dos decadas de servicio publico reconocido.',
      },
    ];

    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 4);

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
            title: 'Valores',
            subtitle: 'Los principios que guian mi trabajo y mi vida.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2.5 : 1.3,
            ),
            itemCount: values.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> value = values[index];
              return _ValueCard(
                icon: value['icon'] as IconData,
                title: value['title'] as String,
                description: value['description'] as String,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsSection(BuildContext context, bool isMobile) {
    final List<Map<String, String>> achievements = <Map<String, String>>[
      <String, String>{
        'number': '+24',
        'label': 'años de servicio',
        'detail': 'en la Policia Nacional',
      },
      <String, String>{
        'number': '+18',
        'label': 'años de liderazgo',
        'detail': 'en Comunicaciones Estrategicas',
      },
      <String, String>{
        'number': '111',
        'label': 'Felicitaciones',
        'detail': 'por labor profesional',
      },
      <String, String>{
        'number': '19',
        'label': 'Condecoraciones',
        'detail': 'de instituciones',
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
            title: 'Trayectoria',
            subtitle: 'Logros y reconocimientos a lo largo de mi carrera.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          Wrap(
            spacing: isMobile ? 20 : 40,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: achievements
                .map(
                  (Map<String, String> achievement) => _AchievementCard(
                    number: achievement['number']!,
                    label: achievement['label']!,
                    detail: achievement['detail']!,
                    isMobile: isMobile,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection(BuildContext context, bool isMobile) => Container(
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
          'QUIERES CONOCER MI HISTORIA COMPLETA?',
          style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isMobile ? 16 : 24),
        BaseText.noChangeSubtle(
          'Descubre mi trayectoria de vida, desde mis inicios hasta mi compromiso con Popayan.',
          style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: isMobile ? 32 : 48),
        ElevatedButton.icon(
          onPressed: () => context.go(Routes.lifeStory),
          icon: const Icon(Iconsax.book_1),
          label: const Text('Ver mi vida'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).appColors.neutralNoChange.subtle,
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

class _ValueCard extends StatelessWidget {
  const _ValueCard({
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
            size: 32,
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
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({
    required this.number,
    required this.label,
    required this.detail,
    required this.isMobile,
  });

  final String number;
  final String label;
  final String detail;
  final bool isMobile;

  @override
  Widget build(BuildContext context) => Container(
    width: isMobile ? double.infinity : 200,
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      border: Border.all(
        color: Theme.of(context).appColors.primary.soft,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      children: <Widget>[
        BaseText.primary(
          number,
          style: TypoPrimary.h2.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        BaseText(
          label,
          style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        BaseText(
          detail,
          style: TypoSecondary.b3r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

class _PatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double spacing = 30;
    for (double i = 0; i < size.width + size.height; i += spacing) {
      canvas.drawLine(Offset(i, 0), Offset(0, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
