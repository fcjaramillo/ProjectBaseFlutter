import 'package:flutter/material.dart' hide Colors;
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  String _selectedFilter = 'Todos';

  final List<String> _filters = <String>[
    'Todos',
    'Proximos',
    'Pasados',
  ];

  final List<Map<String, dynamic>> _events = <Map<String, dynamic>>[
    <String, dynamic>{
      'title': 'Encuentro con lideres comunales',
      'description':
          'Reunion con presidentes de juntas de accion comunal de todas '
              'las comunas para escuchar propuestas y necesidades.',
      'date': DateTime.now().add(const Duration(days: 3)),
      'time': '10:00 AM - 12:00 PM',
      'location': 'Centro de Convenciones',
      'address': 'Calle 5 #6-30, Centro',
      'isFeatured': true,
      'isPast': false,
    },
    <String, dynamic>{
      'title': 'Dialogo con jovenes emprendedores',
      'description':
          'Espacio de intercambio con jovenes empresarios y '
              'emprendedores para conocer sus ideas y propuestas.',
      'date': DateTime.now().add(const Duration(days: 7)),
      'time': '3:00 PM - 5:00 PM',
      'location': 'Universidad del Cauca',
      'address': 'Campus Tulcan',
      'isFeatured': false,
      'isPast': false,
    },
    <String, dynamic>{
      'title': 'Recorrido por barrios del sur',
      'description':
          'Caminata por los barrios de la comuna 8 para conocer de cerca '
              'las necesidades de sus habitantes.',
      'date': DateTime.now().add(const Duration(days: 10)),
      'time': '8:00 AM - 11:00 AM',
      'location': 'Comuna 8 - Barrio Las Americas',
      'address': 'Parque principal',
      'isFeatured': false,
      'isPast': false,
    },
    <String, dynamic>{
      'title': 'Foro de seguridad ciudadana',
      'description':
          'Debate abierto sobre propuestas de seguridad para la ciudad '
              'con expertos y ciudadanos.',
      'date': DateTime.now().add(const Duration(days: 14)),
      'time': '4:00 PM - 7:00 PM',
      'location': 'Teatro Municipal',
      'address': 'Carrera 6 #3-42',
      'isFeatured': true,
      'isPast': false,
    },
    <String, dynamic>{
      'title': 'Reunion con comerciantes del centro',
      'description':
          'Encuentro con gremio de comerciantes para discutir '
              'propuestas de reactivacion economica.',
      'date': DateTime.now().subtract(const Duration(days: 5)),
      'time': '9:00 AM - 11:00 AM',
      'location': 'Camara de Comercio',
      'address': 'Calle 4 #7-18',
      'isFeatured': false,
      'isPast': true,
    },
    <String, dynamic>{
      'title': 'Visita a colegios publicos',
      'description':
          'Recorrido por instituciones educativas publicas para '
              'conocer necesidades de infraestructura.',
      'date': DateTime.now().subtract(const Duration(days: 10)),
      'time': '8:00 AM - 1:00 PM',
      'location': 'Varios colegios',
      'address': 'Comunas 1, 2 y 3',
      'isFeatured': false,
      'isPast': true,
    },
  ];

  List<Map<String, dynamic>> get _filteredEvents {
    if (_selectedFilter == 'Todos') {
      return _events;
    }
    if (_selectedFilter == 'Proximos') {
      return _events
          .where((Map<String, dynamic> e) => e['isPast'] == false)
          .toList();
    }
    return _events
        .where((Map<String, dynamic> e) => e['isPast'] == true)
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

        // Events List
        _buildEventsList(context, isMobile, isTablet),

        // Subscribe Section
        _buildSubscribeSection(context, isMobile),
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
            'AGENDA',
            style: TypoSecondary.b2r.copyWith(
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Proximos Eventos',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Acompananos en nuestros encuentros con la comunidad. '
              'Queremos escucharte y construir juntos.',
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
      child: Row(
        children: <Widget>[
          BaseText(
            'Mostrar:',
            style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Wrap(
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
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                  side: BorderSide(
                    color: isSelected
                        ? Theme.of(context).appColors.primary.strong
                        : Theme.of(context).appColors.neutral.soft,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList(
      BuildContext context, bool isMobile, bool isTablet) {
    final List<Map<String, dynamic>> events = _filteredEvents;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: 40,
      ),
      child: events.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: BaseText(
                  'No hay eventos en esta categoria.',
                  style: TypoSecondary.b1r,
                ),
              ),
            )
          : Column(
              children: events.map((Map<String, dynamic> event) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _EventDetailCard(
                    title: event['title'] as String,
                    description: event['description'] as String,
                    date: event['date'] as DateTime,
                    time: event['time'] as String,
                    location: event['location'] as String,
                    address: event['address'] as String,
                    isFeatured: event['isFeatured'] as bool,
                    isPast: event['isPast'] as bool,
                    isMobile: isMobile,
                  ),
                );
              }).toList(),
            ),
    );
  }

  Widget _buildSubscribeSection(BuildContext context, bool isMobile) {
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
          BaseText(
            'NO TE PIERDAS NINGUN EVENTO',
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: BaseText(
              'Suscribete para recibir notificaciones de proximos eventos '
              'y actividades de la campana.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Tu correo electronico',
                      filled: true,
                      fillColor: Theme.of(context).appColors.neutral.subtle,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).appColors.primary.strong,
                    foregroundColor:
                        Theme.of(context).appColors.neutralNoChange.subtle,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Suscribirse'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EventDetailCard extends StatefulWidget {
  const _EventDetailCard({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.address,
    required this.isFeatured,
    required this.isPast,
    required this.isMobile,
  });

  final String title;
  final String description;
  final DateTime date;
  final String time;
  final String location;
  final String address;
  final bool isFeatured;
  final bool isPast;
  final bool isMobile;

  @override
  State<_EventDetailCard> createState() => _EventDetailCardState();
}

class _EventDetailCardState extends State<_EventDetailCard> {
  bool _isHovered = false;

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic',
    ];
    final List<String> weekdays = <String>[
      'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab', 'Dom',
    ];
    return '${weekdays[date.weekday - 1]}, ${date.day} ${months[date.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          color: Theme.of(context).appColors.neutral.subtle,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: widget.isFeatured
                ? Theme.of(context).appColors.primary.strong
                : Theme.of(context).appColors.neutral.soft,
            width: widget.isFeatured ? 2 : 1,
          ),
          boxShadow: _isHovered
              ? <BoxShadow>[
                  BoxShadow(
                    color: Theme.of(context)
                        .appColors
                        .primary
                        .strong
                        .withValues(alpha: 0.15),
                    blurRadius: 16,
                    offset: const Offset(0, 8),
                  ),
                ]
              : null,
        ),
        child: Opacity(
          opacity: widget.isPast ? 0.7 : 1.0,
          child: widget.isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Date badge
          Row(
            children: <Widget>[
              _buildDateBadge(context),
              const Spacer(),
              if (widget.isFeatured) _buildFeaturedBadge(context),
              if (widget.isPast) _buildPastBadge(context),
            ],
          ),
          const SizedBox(height: 16),
          // Title
          BaseText(
            widget.title,
            style: TypoSubtitles.s1.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          // Description
          BaseText(
            widget.description,
            style: TypoSecondary.b3r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 16),
          // Time and location
          _buildInfoRow(context, Iconsax.clock, widget.time),
          const SizedBox(height: 8),
          _buildInfoRow(context, Iconsax.location, widget.location),
          const SizedBox(height: 8),
          _buildInfoRow(context, Iconsax.map_1, widget.address),
          if (!widget.isPast) ...<Widget>[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Theme.of(context).appColors.primary.strong,
                  foregroundColor:
                      Theme.of(context).appColors.neutralNoChange.subtle,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Confirmar asistencia'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Date badge (large)
          _buildDateBadgeLarge(context),
          const SizedBox(width: 24),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: BaseText(
                        widget.title,
                        style: TypoSubtitles.s1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (widget.isFeatured) _buildFeaturedBadge(context),
                    if (widget.isPast) _buildPastBadge(context),
                  ],
                ),
                const SizedBox(height: 12),
                BaseText(
                  widget.description,
                  style: TypoSecondary.b2r.copyWith(
                    color: Theme.of(context).appColors.text.scale.soft,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    _buildInfoRow(context, Iconsax.clock, widget.time),
                    const SizedBox(width: 24),
                    _buildInfoRow(context, Iconsax.location, widget.location),
                  ],
                ),
              ],
            ),
          ),
          if (!widget.isPast) ...<Widget>[
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).appColors.primary.strong,
                foregroundColor:
                    Theme.of(context).appColors.neutralNoChange.subtle,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Confirmar asistencia'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDateBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.soft,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Iconsax.calendar,
            size: 16,
            color: Theme.of(context).appColors.primary.strong,
          ),
          const SizedBox(width: 8),
          BaseText.primary(
            _formatDate(widget.date),
            style: TypoSecondary.b3r.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateBadgeLarge(BuildContext context) {
    return Container(
      width: 80,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.primary.soft,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: <Widget>[
          BaseText.primary(
            widget.date.day.toString(),
            style: TypoPrimary.h3.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          BaseText.primary(
            <String>[
              'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
              'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic',
            ][widget.date.month - 1],
            style: TypoSecondary.b3r.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.warning.strong,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            Iconsax.star,
            size: 14,
            color: Theme.of(context).appColors.neutralNoChange.subtle,
          ),
          const SizedBox(width: 4),
          BaseText.noChangeSubtle(
            'DESTACADO',
            style: TypoSecondary.b4r.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPastBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.soft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BaseText(
        'FINALIZADO',
        style: TypoSecondary.b4r.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).appColors.text.scale.soft,
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          size: 16,
          color: Theme.of(context).appColors.neutral.strong,
        ),
        const SizedBox(width: 8),
        BaseText(
          text,
          style: TypoSecondary.b3r,
        ),
      ],
    );
  }
}
