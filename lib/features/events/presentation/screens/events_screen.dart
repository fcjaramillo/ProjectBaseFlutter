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
import '../../../../ui/utils/utils.dart';
import '../../../../ui/widgets/atoms/atoms.dart';
import '../../domain/dependencies/dependencies.dart';

part 'events_screen.g.dart';

// --- State ---
class EventsState {
  EventsState({
    required this.allEvents,
    required this.isLoading,
    required this.showPast,
    this.error,
  });

  final List<CampaignEvent> allEvents;
  final bool isLoading;
  final bool showPast;
  final String? error;

  factory EventsState.initial() => EventsState(
        allEvents: <CampaignEvent>[],
        isLoading: false,
        showPast: false,
      );

  List<CampaignEvent> get upcomingEvents => allEvents
      .where((CampaignEvent e) => !e.isPast)
      .toList();

  List<CampaignEvent> get pastEvents => allEvents
      .where((CampaignEvent e) => e.isPast)
      .toList();

  EventsState copyWith({
    List<CampaignEvent>? allEvents,
    bool? isLoading,
    bool? showPast,
    String? error,
    bool clearError = false,
  }) =>
      EventsState(
        allEvents: allEvents ?? this.allEvents,
        isLoading: isLoading ?? this.isLoading,
        showPast: showPast ?? this.showPast,
        error: clearError ? null : error ?? this.error,
      );
}

// --- ViewModel ---
@riverpod
class EventsViewModel extends _$EventsViewModel {
  @override
  EventsState build() => EventsState.initial();

  Future<void> loadEvents() async {
    state = state.copyWith(isLoading: true, clearError: true);
    final ResultDef<List<CampaignEvent>> result =
        await ref.read(getEventsUseCaseProvider).call();
    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar los eventos',
        );
      },
      success: (List<CampaignEvent> events) {
        state = state.copyWith(isLoading: false, allEvents: events);
      },
    );
  }

  void toggleFilter() {
    state = state.copyWith(showPast: !state.showPast);
  }
}

// --- Screen ---
class EventsScreen extends ConsumerStatefulWidget {
  const EventsScreen({super.key});

  @override
  ConsumerState<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends ConsumerState<EventsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventsViewModelProvider.notifier).loadEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final EventsState eventsState = ref.watch(eventsViewModelProvider);
    final Responsive responsive = Responsive.of(context);
    final bool isMobile = responsive.width < 768;

    final List<CampaignEvent> displayEvents = eventsState.showPast
        ? eventsState.pastEvents
        : eventsState.upcomingEvents;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildHeroSection(context, isMobile),
        _buildFilterSection(context, isMobile, eventsState),
        if (eventsState.isLoading)
          const Padding(
            padding: EdgeInsets.all(80),
            child: CircularProgressIndicator(),
          )
        else if (eventsState.error != null)
          Padding(
            padding: const EdgeInsets.all(40),
            child: BaseText(
              eventsState.error!,
              style: TypoSecondary.b1r,
            ),
          )
        else
          _buildEventsList(context, isMobile, displayEvents),
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
            style: TypoSecondary.b2r.copyWith(letterSpacing: 3),
          ),
          const SizedBox(height: 16),
          BaseText.noChangeSubtle(
            'Proximos Eventos',
            style: (isMobile ? TypoPrimary.h2 : TypoPrimary.h1)
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: BaseText.noChangeSubtle(
              'Acompananos en nuestros encuentros con la comunidad. '
              'Juntos construimos el Popayan que todos merecemos.',
              style: isMobile ? TypoSecondary.b2r : TypoSecondary.b1r,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection(
    BuildContext context,
    bool isMobile,
    EventsState eventsState,
  ) {
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
              children: <Widget>[
                _FilterChip(
                  label: 'Proximos',
                  isSelected: !eventsState.showPast,
                  onSelected: (_) {
                    if (eventsState.showPast) {
                      ref
                          .read(eventsViewModelProvider.notifier)
                          .toggleFilter();
                    }
                  },
                ),
                _FilterChip(
                  label: 'Pasados',
                  isSelected: eventsState.showPast,
                  onSelected: (_) {
                    if (!eventsState.showPast) {
                      ref
                          .read(eventsViewModelProvider.notifier)
                          .toggleFilter();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventsList(
    BuildContext context,
    bool isMobile,
    List<CampaignEvent> events,
  ) {
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
              children: events.map((CampaignEvent event) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: _EventDetailCard(
                    event: event,
                    isMobile: isMobile,
                    onTap: () => context.go(
                      '/agenda/${event.id}',
                    ),
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
          Icon(
            Iconsax.calendar_add,
            size: 48,
            color: Theme.of(context).appColors.primary.strong,
          ),
          const SizedBox(height: 24),
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
          ElevatedButton(
            onPressed: () => context.go('/contacto'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).appColors.primary.strong,
              foregroundColor:
                  Theme.of(context).appColors.neutralNoChange.subtle,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 40,
                vertical: isMobile ? 16 : 20,
              ),
            ),
            child: const Text('Contactanos'),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onSelected,
  });

  final String label;
  final bool isSelected;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: onSelected,
      backgroundColor: Theme.of(context).appColors.neutral.subtle,
      selectedColor: Theme.of(context).appColors.primary.soft,
      checkmarkColor: Theme.of(context).appColors.primary.strong,
      labelStyle: TypoSecondary.b3r.copyWith(
        color: isSelected
            ? Theme.of(context).appColors.primary.strong
            : null,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
      ),
      side: BorderSide(
        color: isSelected
            ? Theme.of(context).appColors.primary.strong
            : Theme.of(context).appColors.neutral.soft,
      ),
    );
  }
}

class _EventDetailCard extends StatefulWidget {
  const _EventDetailCard({
    required this.event,
    required this.isMobile,
    required this.onTap,
  });

  final CampaignEvent event;
  final bool isMobile;
  final VoidCallback onTap;

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
    return '${weekdays[date.weekday - 1]}, '
        '${date.day} ${months[date.month - 1]}';
  }

  @override
  Widget build(BuildContext context) {
    final CampaignEvent event = widget.event;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: Theme.of(context).appColors.neutral.subtle,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: event.isFeatured
                  ? Theme.of(context).appColors.primary.strong
                  : Theme.of(context).appColors.neutral.soft,
              width: event.isFeatured ? 2 : 1,
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
            opacity: event.isPast ? 0.7 : 1.0,
            child: widget.isMobile
                ? _buildMobileLayout(context, event)
                : _buildDesktopLayout(context, event),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, CampaignEvent event) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              _buildDateBadge(context, event.eventDate),
              const Spacer(),
              if (event.isFeatured) _buildFeaturedBadge(context),
              if (event.isPast) _buildPastBadge(context),
            ],
          ),
          const SizedBox(height: 16),
          BaseText(
            event.title,
            style: TypoSubtitles.s1.copyWith(fontWeight: FontWeight.bold),
          ),
          if (event.description != null) ...<Widget>[
            const SizedBox(height: 12),
            BaseText(
              event.description!,
              style: TypoSecondary.b3r.copyWith(
                color: Theme.of(context).appColors.text.scale.soft,
                height: 1.5,
              ),
            ),
          ],
          const SizedBox(height: 16),
          if (event.eventTime != null)
            _buildInfoRow(context, Iconsax.clock, event.eventTime!),
          if (event.location != null) ...<Widget>[
            const SizedBox(height: 8),
            _buildInfoRow(context, Iconsax.location, event.location!),
          ],
          if (!event.isPast) ...<Widget>[
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.onTap,
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
                child: const Text('Ver detalles'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context, CampaignEvent event) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildDateBadgeLarge(context, event.eventDate),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: BaseText(
                        event.title,
                        style: TypoSubtitles.s1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (event.isFeatured) _buildFeaturedBadge(context),
                    if (event.isPast) _buildPastBadge(context),
                  ],
                ),
                if (event.description != null) ...<Widget>[
                  const SizedBox(height: 12),
                  BaseText(
                    event.description!,
                    style: TypoSecondary.b2r.copyWith(
                      color: Theme.of(context).appColors.text.scale.soft,
                      height: 1.5,
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Row(
                  children: <Widget>[
                    if (event.eventTime != null)
                      _buildInfoRow(
                        context,
                        Iconsax.clock,
                        event.eventTime!,
                      ),
                    if (event.eventTime != null && event.location != null)
                      const SizedBox(width: 24),
                    if (event.location != null)
                      _buildInfoRow(
                        context,
                        Iconsax.location,
                        event.location!,
                      ),
                  ],
                ),
              ],
            ),
          ),
          if (!event.isPast) ...<Widget>[
            const SizedBox(width: 24),
            ElevatedButton(
              onPressed: widget.onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Theme.of(context).appColors.primary.strong,
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
              child: const Text('Ver detalles'),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildDateBadge(BuildContext context, DateTime date) {
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
            _formatDate(date),
            style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildDateBadgeLarge(BuildContext context, DateTime date) {
    final List<String> months = <String>[
      'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
      'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic',
    ];
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
            date.day.toString(),
            style: TypoPrimary.h3.copyWith(fontWeight: FontWeight.bold),
          ),
          BaseText.primary(
            months[date.month - 1],
            style: TypoSecondary.b3r.copyWith(fontWeight: FontWeight.w500),
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
            style: TypoSecondary.b4r.copyWith(fontWeight: FontWeight.bold),
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
        BaseText(text, style: TypoSecondary.b3r),
      ],
    );
  }
}
