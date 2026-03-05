library;

import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../typing/entities/campaign/campaign_event.dart';
import '../../../../typing/extensions/extensions.dart';
import '../../../../typing/result/result.dart';
import '../../../../ui/ions/ions.dart';
import '../../../../ui/routes/routes.dart';
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'event_detail_screen.g.dart';

// --- State ---
class EventDetailState {
  EventDetailState({
    required this.isLoading,
    this.event,
    this.error,
  });

  final CampaignEvent? event;
  final bool isLoading;
  final String? error;

  factory EventDetailState.initial() =>
      EventDetailState(isLoading: false);

  EventDetailState copyWith({
    CampaignEvent? event,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) =>
      EventDetailState(
        event: event ?? this.event,
        isLoading: isLoading ?? this.isLoading,
        error: clearError ? null : error ?? this.error,
      );
}

// --- ViewModel ---
@riverpod
class EventDetailViewModel extends _$EventDetailViewModel {
  @override
  EventDetailState build() => EventDetailState.initial();

  Future<void> loadEvent(String eventId) async {
    state = state.copyWith(isLoading: true, clearError: true);
    final ResultDef<CampaignEvent?> result =
        await ref.read(getEventByIdUseCaseProvider).call(eventId);
    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar el evento',
        );
      },
      success: (CampaignEvent? event) {
        state = state.copyWith(isLoading: false, event: event);
      },
    );
  }
}

// --- Screen ---
class EventDetailScreen extends ConsumerStatefulWidget {
  const EventDetailScreen({required this.eventId, super.key});

  final String eventId;

  @override
  ConsumerState<EventDetailScreen> createState() =>
      _EventDetailScreenState();
}

class _EventDetailScreenState extends ConsumerState<EventDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(eventDetailViewModelProvider.notifier)
          .loadEvent(widget.eventId);
    });
  }

  String _formatDate(DateTime date) {
    final List<String> months = <String>[
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre',
      'Diciembre',
    ];
    final List<String> weekdays = <String>[
      'Lunes', 'Martes', 'Miercoles', 'Jueves',
      'Viernes', 'Sabado', 'Domingo',
    ];
    return '${weekdays[date.weekday - 1]}, ${date.day} de '
        '${months[date.month - 1]} de ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final EventDetailState detailState =
        ref.watch(eventDetailViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    if (detailState.isLoading) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(80),
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (detailState.error != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseText(
                detailState.error!,
                style: TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () => context.go(Routes.events),
                icon: const Icon(Iconsax.arrow_left),
                label: const Text('Ver todos los eventos'),
              ),
            ],
          ),
        ),
      );
    }

    if (detailState.event == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseText(
                'Evento no encontrado.',
                style: TypoSecondary.b1r,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              OutlinedButton.icon(
                onPressed: () => context.go(Routes.events),
                icon: const Icon(Iconsax.arrow_left),
                label: const Text('Ver todos los eventos'),
              ),
            ],
          ),
        ),
      );
    }

    final CampaignEvent event = detailState.event!;

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

  Widget _buildHeader(
    BuildContext context,
    bool isMobile,
    CampaignEvent event,
  ) {
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
                style: TypoSecondary.b3r.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          if (event.isFeatured)
            Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
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
                    color:
                        Theme.of(context).appColors.neutralNoChange.subtle,
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
            event.title,
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
                _formatDate(event.eventDate),
              ),
              if (event.eventTime != null)
                _buildInfoChip(
                  context,
                  Iconsax.clock,
                  event.eventTime!,
                ),
              if (event.location != null)
                _buildInfoChip(
                  context,
                  Iconsax.location,
                  event.location!,
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(
    BuildContext context,
    IconData icon,
    String text,
  ) {
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
    BuildContext context,
    bool isMobile,
    CampaignEvent event,
  ) {
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
                _buildRegisterCard(context),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: _buildDescription(context, event),
                ),
                const SizedBox(width: 40),
                Expanded(child: _buildRegisterCard(context)),
              ],
            ),
    );
  }

  Widget _buildDescription(BuildContext context, CampaignEvent event) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        BaseText(
          'Acerca del evento',
          style: TypoPrimary.h4.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        BaseText(
          event.description ?? 'Sin descripcion disponible.',
          style: TypoSecondary.b1r.copyWith(height: 1.8),
        ),
        if (event.hasLivestream) ...<Widget>[
          const SizedBox(height: 24),
          Row(
            children: <Widget>[
              Icon(
                Iconsax.video,
                size: 20,
                color: Theme.of(context).appColors.primary.strong,
              ),
              const SizedBox(width: 8),
              BaseText(
                'Transmision en vivo disponible',
                style: TypoSecondary.b2r.copyWith(
                  color: Theme.of(context).appColors.primary.strong,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
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
                backgroundColor:
                    Theme.of(context).appColors.primary.strong,
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
                foregroundColor:
                    Theme.of(context).appColors.primary.strong,
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
    BuildContext context,
    bool isMobile,
    CampaignEvent event,
  ) {
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
                  if (event.location != null)
                    BaseText(
                      event.location!,
                      style: TypoSubtitles.s2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  if (event.address != null)
                    BaseText(
                      event.address!,
                      style: TypoSecondary.b3r.copyWith(
                        color:
                            Theme.of(context).appColors.text.scale.soft,
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
              backgroundColor:
                  Theme.of(context).appColors.primary.strong,
              foregroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
            ),
          ),
        ],
      ),
    );
  }
}
