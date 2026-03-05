// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCityVisionUseCase)
const getCityVisionUseCaseProvider = GetCityVisionUseCaseProvider._();

final class GetCityVisionUseCaseProvider
    extends
        $FunctionalProvider<
          GetCityVisionUseCase,
          GetCityVisionUseCase,
          GetCityVisionUseCase
        >
    with $Provider<GetCityVisionUseCase> {
  const GetCityVisionUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCityVisionUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCityVisionUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCityVisionUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCityVisionUseCase create(Ref ref) {
    return getCityVisionUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCityVisionUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCityVisionUseCase>(value),
    );
  }
}

String _$getCityVisionUseCaseHash() =>
    r'c48f431c60b5155e8f103309a74985468941b723';
