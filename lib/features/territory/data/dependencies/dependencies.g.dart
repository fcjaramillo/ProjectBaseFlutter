// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(territoryRepository)
const territoryRepositoryProvider = TerritoryRepositoryProvider._();

final class TerritoryRepositoryProvider
    extends
        $FunctionalProvider<
          TerritoryRepository,
          TerritoryRepository,
          TerritoryRepository
        >
    with $Provider<TerritoryRepository> {
  const TerritoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'territoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$territoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<TerritoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TerritoryRepository create(Ref ref) {
    return territoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TerritoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TerritoryRepository>(value),
    );
  }
}

String _$territoryRepositoryHash() =>
    r'ac64852a1e1e839c04bb10269a03e693c6fd8614';
