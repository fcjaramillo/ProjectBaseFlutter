import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../../../ui/widgets/organisms/organisms.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedCommune;
  final List<String> _selectedSkills = <String>[];

  bool _isSubmitting = false;

  final List<String> _communes = <String>[
    'Comuna 1 - Centro',
    'Comuna 2 - Norte',
    'Comuna 3 - Oriente',
    'Comuna 4 - Occidente',
    'Comuna 5 - Sur',
    'Comuna 6 - Suroccidente',
    'Comuna 7 - Noroeste',
    'Comuna 8 - Las Americas',
    'Comuna 9 - Poblado',
  ];

  final List<String> _skills = <String>[
    'Redes sociales',
    'Fotografia',
    'Video',
    'Diseno',
    'Logistica',
    'Comunicacion',
    'Puerta a puerta',
    'Transporte',
    'Otro',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);

    // Simulate API call
    await Future<void>.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    setState(() => _isSubmitting = false);

    // Show success dialog
    if (!mounted) return;
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Iconsax.tick_circle,
              size: 64,
              color: Theme.of(context).appColors.success.strong,
            ),
            const SizedBox(height: 24),
            BaseText(
              'Gracias por unirte!',
              style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            BaseText(
              'Hemos recibido tu registro. Pronto nos comunicaremos contigo.',
              style: TypoSecondary.b2r,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).appColors.primary.strong,
                foregroundColor:
                    Theme.of(context).appColors.neutralNoChange.subtle,
              ),
              child: const Text('Entendido'),
            ),
          ],
        ),
      ),
    );

    // Clear form
    _nameController.clear();
    _emailController.clear();
    _phoneController.clear();
    setState(() {
      _selectedCommune = null;
      _selectedSkills.clear();
    });
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

        // Ways to support
        _buildWaysToSupport(context, isMobile, isTablet),

        // Volunteer Form
        _buildVolunteerSection(context, isMobile),

        // Donation Info
        _buildDonationSection(context, isMobile),

        // Material Section
        _buildMaterialSection(context, isMobile, isTablet),
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
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Theme.of(context).appColors.primary.strong,
            Theme.of(context).appColors.secondary.strong,
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          BaseText.noChangeSubtle(
            'UNETE AL EQUIPO',
            style: TypoSecondary.b2r.copyWith(
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Como Apoyar',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Tu apoyo es fundamental para construir el Popayan que sonamos. '
              'Hay muchas formas de sumarte a este movimiento ciudadano.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWaysToSupport(
      BuildContext context, bool isMobile, bool isTablet) {
    final List<Map<String, dynamic>> ways = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Iconsax.people,
        'title': 'Se voluntario',
        'description': 'Unete al equipo de campana y apoya en '
            'diferentes actividades.',
      },
      <String, dynamic>{
        'icon': Iconsax.heart,
        'title': 'Dona a la campana',
        'description': 'Tu aporte economico nos ayuda a llevar '
            'el mensaje a mas personas.',
      },
      <String, dynamic>{
        'icon': Iconsax.share,
        'title': 'Comparte',
        'description': 'Difunde nuestras propuestas en tus redes '
            'sociales y con tu comunidad.',
      },
    ];

    final int crossAxisCount = isMobile ? 1 : 3;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(
            title: 'Formas de apoyar',
            subtitle: 'Elige como quieres ser parte del cambio.',
          ),
          SizedBox(height: isMobile ? 40 : 60),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: isMobile ? 2 : 1.2,
            ),
            itemCount: ways.length,
            itemBuilder: (BuildContext context, int index) {
              final Map<String, dynamic> way = ways[index];
              return _SupportCard(
                icon: way['icon'] as IconData,
                title: way['title'] as String,
                description: way['description'] as String,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildVolunteerSection(BuildContext context, bool isMobile) {
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
            title: 'Se voluntario',
            subtitle:
                'Registrate y forma parte de nuestro equipo de voluntarios.',
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.neutral.subtle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context).appColors.opacity.base,
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Name
                    _buildFormField(
                      'Nombre completo',
                      _nameController,
                      (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu nombre';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Email
                    _buildFormField(
                      'Correo electronico',
                      _emailController,
                      (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu correo';
                        }
                        if (!value.contains('@')) {
                          return 'Por favor ingresa un correo valido';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 20),
                    // Phone
                    _buildFormField(
                      'Telefono',
                      _phoneController,
                      (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu telefono';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 20),
                    // Commune dropdown
                    BaseText(
                      'Comuna',
                      style: TypoSecondary.b3r.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedCommune,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Theme.of(context).appColors.neutral.subtle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).appColors.neutral.soft,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color:
                                Theme.of(context).appColors.neutral.soft,
                          ),
                        ),
                      ),
                      hint: const Text('Selecciona tu comuna'),
                      items: _communes
                          .map(
                            (String commune) => DropdownMenuItem<String>(
                              value: commune,
                              child: Text(commune),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() => _selectedCommune = value);
                      },
                      validator: (String? value) {
                        if (value == null) {
                          return 'Por favor selecciona tu comuna';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    // Skills
                    BaseText(
                      'Habilidades (selecciona una o mas)',
                      style: TypoSecondary.b3r.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _skills.map((String skill) {
                        final bool isSelected = _selectedSkills.contains(skill);
                        return FilterChip(
                          label: Text(skill),
                          selected: isSelected,
                          onSelected: (bool selected) {
                            setState(() {
                              if (selected) {
                                _selectedSkills.add(skill);
                              } else {
                                _selectedSkills.remove(skill);
                              }
                            });
                          },
                          backgroundColor:
                              Theme.of(context).appColors.neutral.subtle,
                          selectedColor:
                              Theme.of(context).appColors.primary.soft,
                          checkmarkColor:
                              Theme.of(context).appColors.primary.strong,
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 32),
                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _isSubmitting ? null : _submitForm,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).appColors.primary.strong,
                          foregroundColor:
                              Theme.of(context).appColors.neutralNoChange.subtle,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: _isSubmitting
                            ? SizedBox(
                                height: 24,
                                width: 24,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context)
                                        .appColors
                                        .neutralNoChange
                                        .subtle,
                                  ),
                                ),
                              )
                            : const Text('Registrarme como voluntario'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
    String label,
    TextEditingController controller,
    String? Function(String?) validator, {
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          label,
          style: TypoSecondary.b3r.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).appColors.neutral.subtle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).appColors.neutral.soft,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).appColors.neutral.soft,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Theme.of(context).appColors.primary.strong,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDonationSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        children: <Widget>[
          const SectionHeader(
            title: 'Aportes a la campana',
            subtitle: 'Tu donacion nos ayuda a llevar el mensaje a mas '
                'rincones de Popayan.',
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).appColors.primary.soft,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: <Widget>[
                  Icon(
                    Iconsax.wallet_2,
                    size: 48,
                    color: Theme.of(context).appColors.primary.strong,
                  ),
                  const SizedBox(height: 24),
                  BaseText(
                    'Informacion bancaria',
                    style:
                        TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 24),
                  _buildDonationInfo('Banco', 'Bancolombia'),
                  _buildDonationInfo('Tipo de cuenta', 'Ahorros'),
                  _buildDonationInfo('Numero', '000-000000-00'),
                  _buildDonationInfo('Titular', 'Campana William Campino'),
                  _buildDonationInfo('NIT', '000.000.000-0'),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildPaymentMethod(
                        context,
                        'Nequi',
                        Iconsax.mobile,
                        '300 000 0000',
                      ),
                      const SizedBox(width: 24),
                      _buildPaymentMethod(
                        context,
                        'Daviplata',
                        Iconsax.card,
                        '300 000 0000',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDonationInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BaseText(
            '$label: ',
            style: TypoSecondary.b2r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
          ),
          BaseText(
            value,
            style: TypoSecondary.b2r.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentMethod(
    BuildContext context,
    String name,
    IconData icon,
    String number,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 32,
            color: Theme.of(context).appColors.primary.strong,
          ),
          const SizedBox(height: 8),
          BaseText(
            name,
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
          BaseText(
            number,
            style: TypoSecondary.b3r,
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialSection(
      BuildContext context, bool isMobile, bool isTablet) {
    final List<Map<String, dynamic>> materials = <Map<String, dynamic>>[
      <String, dynamic>{
        'icon': Iconsax.document,
        'title': 'Plan de gobierno',
        'description': 'Descarga el PDF completo de nuestras propuestas.',
      },
      <String, dynamic>{
        'icon': Iconsax.gallery,
        'title': 'Kit de redes',
        'description': 'Imagenes y videos para compartir en redes sociales.',
      },
      <String, dynamic>{
        'icon': Iconsax.microphone,
        'title': 'Jingle de campana',
        'description': 'Descarga nuestra cancion oficial.',
      },
    ];

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
          SectionHeader(
            title: 'Material de campana',
            subtitle: 'Descarga y comparte nuestro material.',
            titleColor: Theme.of(context).appColors.neutralNoChange.subtle,
            subtitleColor: Theme.of(context).appColors.neutralNoChange.subtle,
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: materials
                .map(
                  (Map<String, dynamic> material) => _MaterialCard(
                    icon: material['icon'] as IconData,
                    title: material['title'] as String,
                    description: material['description'] as String,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).appColors.neutral.soft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            title,
            style: TypoSubtitles.s1.copyWith(
              fontWeight: FontWeight.bold,
            ),
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
}

class _MaterialCard extends StatelessWidget {
  const _MaterialCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutralNoChange.subtle,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 40,
            color: Theme.of(context).appColors.secondary.strong,
          ),
          const SizedBox(height: 16),
          BaseText(
            title,
            style: TypoSubtitles.s2.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BaseText(
            description,
            style: TypoSecondary.b4r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.document_download, size: 18),
            label: const Text('Descargar'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Theme.of(context).appColors.secondary.strong,
              side: BorderSide(
                color: Theme.of(context).appColors.secondary.strong,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
