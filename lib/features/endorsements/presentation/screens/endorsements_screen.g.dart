// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'endorsements_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EndorsementsViewModel)
const endorsementsViewModelProvider = EndorsementsViewModelProvider._();

final class EndorsementsViewModelProvider
    extends $NotifierProvider<EndorsementsViewModel, EndorsementsState> {
  const EndorsementsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'endorsementsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$endorsementsViewModelHash();

  @$internal
  @override
  EndorsementsViewModel create() => EndorsementsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EndorsementsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EndorsementsState>(value),
    );
  }
}

String _$endorsementsViewModelHash() =>
    r'e02d17311b00f24f90f874d0253be737b64ff16d';

abstract class _$EndorsementsViewModel extends $Notifier<EndorsementsState> {
  EndorsementsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<EndorsementsState, EndorsementsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EndorsementsState, EndorsementsState>,
              EndorsementsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
