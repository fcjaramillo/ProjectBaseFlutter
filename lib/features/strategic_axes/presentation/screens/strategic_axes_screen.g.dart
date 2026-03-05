// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strategic_axes_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StrategicAxesViewModel)
const strategicAxesViewModelProvider = StrategicAxesViewModelProvider._();

final class StrategicAxesViewModelProvider
    extends $NotifierProvider<StrategicAxesViewModel, StrategicAxesState> {
  const StrategicAxesViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'strategicAxesViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$strategicAxesViewModelHash();

  @$internal
  @override
  StrategicAxesViewModel create() => StrategicAxesViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StrategicAxesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StrategicAxesState>(value),
    );
  }
}

String _$strategicAxesViewModelHash() =>
    r'e08042e86394031a9e158d6d0645b3fa4bf9753b';

abstract class _$StrategicAxesViewModel extends $Notifier<StrategicAxesState> {
  StrategicAxesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<StrategicAxesState, StrategicAxesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<StrategicAxesState, StrategicAxesState>,
              StrategicAxesState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
