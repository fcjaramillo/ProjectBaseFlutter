import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';

class EndorsementsScreen extends StatelessWidget {
  const EndorsementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;
    final bool isTablet = responsive.width >= 768 && responsive.width < 1200;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildTestimonialsSection(context, isMobile, isTablet),
        _buildOrganizationsSection(context, isMobile),
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

  Widget _buildTestimonialsSection(
      BuildContext context, bool isMobile, bool isTablet) {
    final List<Map<String, String>> testimonials = <Map<String, String>>[
      <String, String>{
        'name': 'Maria Elena Rodriguez',
        'title': 'Presidenta JAC Comuna 3',
        'quote':
            'Por primera vez veo un candidato que realmente escucha a la '
                'comunidad. William ha caminado nuestras calles y conoce '
                'nuestros problemas de primera mano.',
      },
      <String, String>{
        'name': 'Carlos Andres Munoz',
        'title': 'Empresario local',
        'quote':
            'Como empresario payanés, creo en las propuestas de desarrollo '
                'economico de William. Es momento de apostar por nuestra '
                'ciudad y generar empleo local.',
      },
      <String, String>{
        'name': 'Luz Marina Caicedo',
        'title': 'Docente',
        'quote':
            'La educacion es la base del progreso. El compromiso de William '
                'con la educacion de nuestros ninos y jovenes es lo que '
                'Popayan necesita.',
      },
      <String, String>{
        'name': 'Pedro Jose Valencia',
        'title': 'Lider juvenil',
        'quote':
            'Los jovenes de Popayan necesitamos oportunidades. Por primera '
                'vez siento que un candidato nos tiene en cuenta y quiere '
                'construir con nosotros.',
      },
      <String, String>{
        'name': 'Ana Lucia Gomez',
        'title': 'Madre de familia',
        'quote':
            'Quiero que mis hijos crezcan en una ciudad segura. La '
                'trayectoria de William en seguridad me da confianza en '
                'que puede lograrlo.',
      },
      <String, String>{
        'name': 'Roberto Sanchez',
        'title': 'Adulto mayor',
        'quote':
            'He vivido en Popayan toda mi vida. William representa los '
                'valores que necesitamos: honestidad, trabajo y compromiso '
                'con la gente.',
      },
    ];

    final int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(
            title: 'Testimonios',
            subtitle: 'Lo que dicen quienes nos apoyan.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 1.3 : 1.0,
            ),
            itemCount: testimonials.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, String> testimonial = testimonials[index];
              return TestimonialCard(
                name: testimonial['name']!,
                title: testimonial['title'],
                quote: testimonial['quote']!,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOrganizationsSection(BuildContext context, bool isMobile) {
    final List<Map<String, dynamic>> organizations = <Map<String, dynamic>>[
      <String, dynamic>{
        'name': 'Asociacion de Comerciantes',
        'icon': Iconsax.shop,
      },
      <String, dynamic>{
        'name': 'Federacion de Juntas',
        'icon': Iconsax.people,
      },
      <String, dynamic>{
        'name': 'Gremio de Artesanos',
        'icon': Iconsax.brush_1,
      },
      <String, dynamic>{
        'name': 'Asociacion de Mujeres',
        'icon': Iconsax.woman,
      },
      <String, dynamic>{
        'name': 'Colectivo Juvenil',
        'icon': Iconsax.user_octagon,
      },
      <String, dynamic>{
        'name': 'Agricultores del Cauca',
        'icon': Iconsax.tree,
      },
    ];

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
            title: 'Organizaciones que nos Respaldan',
            subtitle: 'Gremios y colectivos que creen en el cambio.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: organizations
                .map(
                  (Map<String, dynamic> org) => _OrganizationCard(
                    name: org['name'] as String,
                    icon: org['icon'] as IconData,
                    isMobile: isMobile,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCommunitySection(
      BuildContext context, bool isMobile, bool isTablet) {
    final List<Map<String, String>> stats = <Map<String, String>>[
      <String, String>{'number': '50+', 'label': 'Lideres comunales'},
      <String, String>{'number': '30+', 'label': 'Organizaciones'},
      <String, String>{'number': '1000+', 'label': 'Voluntarios'},
      <String, String>{'number': '9', 'label': 'Comunas representadas'},
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

class _OrganizationCard extends StatelessWidget {
  const _OrganizationCard({
    required this.name,
    required this.icon,
    required this.isMobile,
  });

  final String name;
  final IconData icon;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? double.infinity : 180,
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
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
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
            name,
            style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

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
