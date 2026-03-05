// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EventDetailViewModel)
const eventDetailViewModelProvider = EventDetailViewModelProvider._();

final class EventDetailViewModelProvider
    extends $NotifierProvider<EventDetailViewModel, EventDetailState> {
  const EventDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'eventDetailViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$eventDetailViewModelHash();

  @$internal
  @override
  EventDetailViewModel create() => EventDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EventDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EventDetailState>(value),
    );
  }
}

String _$eventDetailViewModelHash() =>
    r'680d15c5dfacd9aeb571c4d36fdff405c68c3ae0';

abstract class _$EventDetailViewModel extends $Notifier<EventDetailState> {
  EventDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EventDetailState, EventDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EventDetailState, EventDetailState>,
              EventDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
