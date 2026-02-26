// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(baseapiUnRepository)
const baseapiUnRepositoryProvider = BaseapiUnRepositoryProvider._();

final class BaseapiUnRepositoryProvider
    extends $FunctionalProvider<BaseRepository, BaseRepository, BaseRepository>
    with $Provider<BaseRepository> {
  const BaseapiUnRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseapiUnRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseapiUnRepositoryHash();

  @$internal
  @override
  $ProviderElement<BaseRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BaseRepository create(Ref ref) {
    return baseapiUnRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseRepository>(value),
    );
  }
}

String _$baseapiUnRepositoryHash() =>
    r'ad4d0f7a8a4e4d8d9b16770c4f330c56afde464f';

@ProviderFor(getExampleUseCase)
const getExampleUseCaseProvider = GetExampleUseCaseProvider._();

final class GetExampleUseCaseProvider
    extends
        $FunctionalProvider<
          GetExampleUseCase,
          GetExampleUseCase,
          GetExampleUseCase
        >
    with $Provider<GetExampleUseCase> {
  const GetExampleUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getExampleUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getExampleUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetExampleUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetExampleUseCase create(Ref ref) {
    return getExampleUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetExampleUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetExampleUseCase>(value),
    );
  }
}

String _$getExampleUseCaseHash() => r'e3ea44a47e9a67bf3e577c6a12d708b8c53b325c';
