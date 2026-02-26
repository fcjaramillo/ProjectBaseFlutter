import 'package:flutter/material.dart' hide Colors;
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../typing/extensions/extensions.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({required this.eventId, super.key});

  final String eventId;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    // Mock data - in production this would come from Supabase
    final Map<String, dynamic> event = _getEventById(eventId);

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildHeader(context, isMobile, event),
          _buildContent(context, isMobile, event),
          _buildLocationSection(context, isMobile, event),
          _buildCtaSection(context, isMobile),
        ],
      ),
    );
  }

  Map<String, dynamic> _getEventById(String id) {
    return <String, dynamic>{
      'id': id,
      'title': 'Encuentro con lideres comunales',
      'description':
          'Reunion con presidentes de juntas de accion comunal de todas '
              'las comunas para escuchar propuestas, dialogar sobre las '
              'necesidades de los barrios y construir juntos soluciones.',
      'date': DateTime.now().add(const Duration(days: 3)),
      'time': '10:00 AM - 12:00 PM',
      'location': 'Centro de Convenciones',
      'address': 'Calle 5 #6-30, Centro Historico',
      'agenda': <String>[
        'Bienvenida y presentacion del candidato',
        'Diagnostico de necesidades por comuna',
        'Mesas de trabajo tematicas',
        'Plenaria y conclusiones',
        'Compromisos y cierre',
      ],
      'isFeatured': true,
    };
  }

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre',
    ];
    final List<String> weekdays = <String>[
      'Lunes', 'Martes', 'Miercoles', 'Jueves',
      'Viernes', 'Sabado', 'Domingo',
    ];
    return '${weekdays[date.weekday - 1]}, ${date.day} de '
        '${months[date.month - 1]} de ${date.year}';
  }

  Widget _buildHeader(
      BuildContext context, bool isMobile, Map<String, dynamic> event) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Breadcrumb
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => context.go(Routes.events),
                child: BaseText.noChangeSubtle(
                  'Agenda',
                  style: TypoSecondary.b3r,
                ),
              ),
              BaseText.noChangeSubtle(' / ', style: TypoSecondary.b3r),
              BaseText.noChangeSubtle(
                'Evento',
                style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (event['isFeatured'] as bool)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
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
                    'EVENTO DESTACADO',
                    style: TypoSecondary.b4r.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          BaseText.noChangeSubtle(
            event['title'] as String,
            style: (isMobile ? TypoPrimary.h3 : TypoPrimary.h2).copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 12,
            children: <Widget>[
              _buildInfoChip(
                context,
                Iconsax.calendar,
                _formatDate(event['date'] as DateTime),
              ),
              _buildInfoChip(
                context,
                Iconsax.clock,
                event['time'] as String,
              ),
              _buildInfoChip(
                context,
                Iconsax.location,
                event['location'] as String,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(BuildContext context, IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          icon,
          size: 18,
          color: Theme.of(context).appColors.neutralNoChange.subtle,
        ),
        const SizedBox(width: 8),
        BaseText.noChangeSubtle(text, style: TypoSecondary.b2r),
      ],
    );
  }

  Widget _buildContent(
      BuildContext context, bool isMobile, Map<String, dynamic> event) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: isMobile
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _buildDescription(context, event),
                const SizedBox(height: 40),
                _buildAgenda(context, event),
                const SizedBox(height: 40),
                _buildRegisterCard(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildDescription(context, event),
                      const SizedBox(height: 40),
                      _buildAgenda(context, event),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
                Expanded(child: _buildRegisterCard(context)),
              ],
            ),
    );
  }

  Widget _buildDescription(BuildContext context, Map<String, dynamic> event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Acerca del evento',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        BaseText(
          event['description'] as String,
          style: TypoSecondary.b1r.copyWith(height: 1.8),
        ),
      ],
    );
  }

  Widget _buildAgenda(BuildContext context, Map<String, dynamic> event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Agenda del evento',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ...(event['agenda'] as List<String>).asMap().entries.map(
          (MapEntry<int, String> entry) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).appColors.primary.soft,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: BaseText.primary(
                      '${entry.key + 1}',
                      style: TypoSecondary.b3r
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: BaseText(entry.value, style: TypoSecondary.b2r),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.tertiary.subtle,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).appColors.primary.soft,
          width: 2,
        ),
      ),
      child: Column(
        children: <Widget>[
          Icon(
            Iconsax.ticket,
            size: 48,
            color: Theme.of(context).appColors.primary.strong,
          ),
          const SizedBox(height: 16),
          BaseText(
            'Confirma tu asistencia',
            style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          BaseText(
            'Registrate para recibir recordatorios y actualizaciones.',
            style: TypoSecondary.b3r.copyWith(
              color: Theme.of(context).appColors.text.scale.soft,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.tick_circle),
              label: const Text('Confirmar asistencia'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).appColors.primary.strong,
                foregroundColor:
                    Theme.of(context).appColors.neutralNoChange.subtle,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Iconsax.calendar_add),
              label: const Text('Agregar al calendario'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Theme.of(context).appColors.primary.strong,
                side: BorderSide(
                  color: Theme.of(context).appColors.primary.strong,
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationSection(
      BuildContext context, bool isMobile, Map<String, dynamic> event) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).appColors.neutral.subtle,
      ),
      child: Column(
        children: <Widget>[
          BaseText(
            'Ubicacion',
            style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 24),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).appColors.neutral.soft,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Iconsax.map_1,
                    size: 48,
                    color: Theme.of(context).appColors.neutral.strong,
                  ),
                  const SizedBox(height: 16),
                  BaseText(
                    event['location'] as String,
                    style: TypoSubtitles.s2.copyWith(fontWeight: FontWeight.bold),
                  ),
                  BaseText(
                    event['address'] as String,
                    style: TypoSecondary.b3r.copyWith(
                      color: Theme.of(context).appColors.text.scale.soft,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCtaSection(BuildContext context, bool isMobile) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : 80,
        vertical: isMobile ? 40 : 60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          OutlinedButton.icon(
            onPressed: () => context.go(Routes.events),
            icon: const Icon(Iconsax.arrow_left),
            label: const Text('Ver todos los eventos'),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Iconsax.share),
            label: const Text('Compartir evento'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).appColors.primary.strong,
              foregroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
            ),
          ),
        ],
      ),
    );
  }
}
