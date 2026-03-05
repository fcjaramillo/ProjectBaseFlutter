// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getMediaUseCase)
const getMediaUseCaseProvider = GetMediaUseCaseProvider._();

final class GetMediaUseCaseProvider
    extends
        $FunctionalProvider<GetMediaUseCase, GetMediaUseCase, GetMediaUseCase>
    with $Provider<GetMediaUseCase> {
  const GetMediaUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMediaUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMediaUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMediaUseCase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetMediaUseCase create(Ref ref) {
    return getMediaUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMediaUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMediaUseCase>(value),
    );
  }
}

String _$getMediaUseCaseHash() => r'f97619ecff6b5b8595ba0503a418014ee4666414';

@ProviderFor(getMediaByTypeUseCase)
const getMediaByTypeUseCaseProvider = GetMediaByTypeUseCaseProvider._();

final class GetMediaByTypeUseCaseProvider
    extends
        $FunctionalProvider<
          GetMediaByTypeUseCase,
          GetMediaByTypeUseCase,
          GetMediaByTypeUseCase
        >
    with $Provider<GetMediaByTypeUseCase> {
  const GetMediaByTypeUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMediaByTypeUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMediaByTypeUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetMediaByTypeUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMediaByTypeUseCase create(Ref ref) {
    return getMediaByTypeUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMediaByTypeUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMediaByTypeUseCase>(value),
    );
  }
}

String _$getMediaByTypeUseCaseHash() =>
    r'9a07efac23aad3686f6311e29317f8c41a3a42f3';
