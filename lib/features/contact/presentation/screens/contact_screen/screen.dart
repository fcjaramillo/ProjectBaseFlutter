part of 'contact_screen.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final ContactMessage message = ContactMessage(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      subject: _subjectController.text.trim(),
      message: _messageController.text.trim(),
    );

    await ref.read(contactViewModelProvider.notifier).sendMessage(message);
  }

  @override
  Widget build(BuildContext context) {
    final ContactState contactState = ref.watch(contactViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    ref.listen(contactViewModelProvider, (
      ContactState? previous,
      ContactState next,
    ) {
      if (next.isSent && (previous?.isSent != true)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Mensaje enviado correctamente'),
            backgroundColor: Theme.of(context).appColors.success.strong,
          ),
        );
        _nameController.clear();
        _emailController.clear();
        _subjectController.clear();
        _messageController.clear();
        ref.read(contactViewModelProvider.notifier).reset();
      }
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error!),
            backgroundColor: Theme.of(context).appColors.error.strong,
          ),
        );
      }
    });

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildContactSection(context, isMobile, contactState),
        _buildMapSection(context, isMobile),
      ],
    );
  }

  Widget _buildHeroSection(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 60 : 100,
    ),
    decoration: BoxDecoration(color: Theme.of(context).appColors.primary.soft),
    child: Column(
      children: <Widget>[
        BaseText.primary(
          'CONTACTO',
          style: TypoSecondary.b2r.copyWith(
            letterSpacing: 3,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        BaseText(
          'Queremos escucharte',
          style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: BaseText(
            'Tus ideas, propuestas y opiniones son importantes para '
            'construir juntos el Popayan que merecemos.',
            style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );

  Widget _buildContactSection(
    BuildContext context,
    bool isMobile,
    ContactState contactState,
  ) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 60 : 100,
    ),
    child: isMobile
        ? Column(
            children: <Widget>[
              _buildContactInfo(context),
              const SizedBox(height: 48),
              _buildContactForm(context, isMobile, contactState),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(flex: 2, child: _buildContactInfo(context)),
              const SizedBox(width: 60),
              Expanded(
                flex: 3,
                child: _buildContactForm(context, isMobile, contactState),
              ),
            ],
          ),
  );

  Widget _buildContactInfo(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      BaseText(
        'Informacion de contacto',
        style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 24),
      _ContactInfoItem(
        icon: Iconsax.sms,
        title: 'Correo electronico',
        content: 'contacto@gmail.com',
        onTap: () {},
      ),
      const SizedBox(height: 20),
      _ContactInfoItem(
        icon: Iconsax.call,
        title: 'Telefono',
        content: '+57 300 000 0000',
        onTap: () {},
      ),
      const SizedBox(height: 20),
      _ContactInfoItem(
        icon: Iconsax.location,
        title: 'Sede de campana',
        content: 'Calle Principal #00-00, Popayan, Cauca',
        onTap: () {},
      ),
      const SizedBox(height: 32),
      BaseText(
        'Redes sociales',
        style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      Wrap(
        spacing: 12,
        runSpacing: 12,
        children: <Widget>[
          _SocialButton(
            network: SocialNetwork.facebook,
            label: 'Facebook',
            onTap: () => launchSocialUrl(SocialLinks.facebook),
          ),
          _SocialButton(
            network: SocialNetwork.instagram,
            label: 'Instagram',
            onTap: () => launchSocialUrl(SocialLinks.instagram),
          ),
          _SocialButton(
            network: SocialNetwork.twitter,
            label: 'Twitter',
            onTap: () => launchSocialUrl(SocialLinks.twitter),
          ),
          _SocialButton(
            network: SocialNetwork.youtube,
            label: 'YouTube',
            onTap: () => launchSocialUrl(SocialLinks.youtube),
          ),
        ],
      ),
      const SizedBox(height: 32),
      BaseText(
        'Horario de atencion',
        style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 16),
      BaseText(
        'Lunes a Viernes: 8:00 AM - 6:00 PM\n'
        'Sabados: 9:00 AM - 1:00 PM',
        style: TypoSecondary.b2r.copyWith(
          color: Theme.of(context).appColors.text.scale.soft,
          height: 1.6,
        ),
      ),
    ],
  );

  Widget _buildContactForm(
    BuildContext context,
    bool isMobile,
    ContactState contactState,
  ) => Container(
    padding: const EdgeInsets.all(32),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.neutral.subtle,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: Theme.of(context).appColors.neutral.soft),
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
          BaseText(
            'Envianos un mensaje',
            style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          _FormField(
            label: 'Nombre completo',
            controller: _nameController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu nombre';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _FormField(
            label: 'Correo electronico',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu correo';
              }
              if (!value.contains('@')) {
                return 'Por favor ingresa un correo valido';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _FormField(
            label: 'Asunto',
            controller: _subjectController,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa el asunto';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          _FormField(
            label: 'Mensaje',
            controller: _messageController,
            maxLines: 5,
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingresa tu mensaje';
              }
              return null;
            },
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: contactState.isLoading ? null : _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).appColors.primary.strong,
                foregroundColor: Theme.of(
                  context,
                ).appColors.neutralNoChange.subtle,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: contactState.isLoading
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).appColors.neutralNoChange.subtle,
                        ),
                      ),
                    )
                  : const Text('Enviar mensaje'),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _buildMapSection(BuildContext context, bool isMobile) => Container(
    padding: EdgeInsets.symmetric(
      horizontal: isMobile ? 20 : 80,
      vertical: isMobile ? 40 : 60,
    ),
    decoration: BoxDecoration(
      color: Theme.of(context).appColors.tertiary.subtle,
    ),
    child: Column(
      children: <Widget>[
        const SectionHeader(
          title: 'Encuentranos',
          subtitle: 'Visita nuestra sede de campana.',
        ),
        const SizedBox(height: 32),
        CampaignMap(
          latitude: 2.4410120907941955,
          longitude: -76.60624492621537,
          zoom: 16,
          markerColor: Theme.of(context).appColors.primary.strong,
        ),
        const SizedBox(height: 16),
        BaseText(
          'Cra. 6 #5-44, Centro, Popayan, Cauca',
          style: TypoSecondary.b2r.copyWith(
            color: Theme.of(context).appColors.text.scale.soft,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

class _ContactInfoItem extends StatelessWidget {
  const _ContactInfoItem({
    required this.icon,
    required this.title,
    required this.content,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String content;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Row(
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
            color: Theme.of(context).appColors.primary.strong,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BaseText(
                title,
                style: TypoSecondary.b3r.copyWith(
                  color: Theme.of(context).appColors.text.scale.soft,
                ),
              ),
              const SizedBox(height: 4),
              BaseText(
                content,
                style: TypoSecondary.b2r.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.network,
    required this.label,
    required this.onTap,
  });

  final SocialNetwork network;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).appColors.neutral.soft),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          socialIcon(
            network: network,
            color: Theme.of(context).appColors.primary.strong,
            size: 20,
          ),
          const SizedBox(width: 8),
          BaseText(label, style: TypoSecondary.b3r),
        ],
      ),
    ),
  );
}

class _FormField extends StatelessWidget {
  const _FormField({
    required this.label,
    required this.controller,
    this.validator,
    this.keyboardType,
    this.maxLines = 1,
  });

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      BaseText(
        label,
        style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.w500),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).appColors.primary.strong,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).appColors.error.strong,
            ),
          ),
        ),
      ),
    ],
  );
}
