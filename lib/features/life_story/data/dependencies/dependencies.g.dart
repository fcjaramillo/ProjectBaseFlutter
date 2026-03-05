// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(lifeStoryRepository)
const lifeStoryRepositoryProvider = LifeStoryRepositoryProvider._();

final class LifeStoryRepositoryProvider
    extends
        $FunctionalProvider<
          LifeStoryRepository,
          LifeStoryRepository,
          LifeStoryRepository
        >
    with $Provider<LifeStoryRepository> {
  const LifeStoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lifeStoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lifeStoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<LifeStoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LifeStoryRepository create(Ref ref) {
    return lifeStoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LifeStoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LifeStoryRepository>(value),
    );
  }
}

String _$lifeStoryRepositoryHash() =>
    r'436b6b19f8e03c5d060c63459d2fb34a22a050d3';
