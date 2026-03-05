// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EventsViewModel)
const eventsViewModelProvider = EventsViewModelProvider._();

final class EventsViewModelProvider
    extends $NotifierProvider<EventsViewModel, EventsState> {
  const EventsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventsViewModelHash();

  @$internal
  @override
  EventsViewModel create() => EventsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventsState>(value),
    );
  }
}

String _$eventsViewModelHash() => r'16065733497703eec15a60b59f0a069976dda94d';

abstract class _$EventsViewModel extends $Notifier<EventsState> {
  EventsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EventsState, EventsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EventsState, EventsState>,
              EventsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
