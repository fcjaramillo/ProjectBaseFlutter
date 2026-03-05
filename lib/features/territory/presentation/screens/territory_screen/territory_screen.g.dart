// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TerritoryViewModel)
const territoryViewModelProvider = TerritoryViewModelProvider._();

final class TerritoryViewModelProvider
    extends $NotifierProvider<TerritoryViewModel, TerritoryState> {
  const TerritoryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'territoryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$territoryViewModelHash();

  @$internal
  @override
  TerritoryViewModel create() => TerritoryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TerritoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TerritoryState>(value),
    );
  }
}

String _$territoryViewModelHash() =>
    r'e07ef676011ba0d7f5c4a6172188e8cbaccf94d7';

abstract class _$TerritoryViewModel extends $Notifier<TerritoryState> {
  TerritoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<TerritoryState, TerritoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<TerritoryState, TerritoryState>,
              TerritoryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
