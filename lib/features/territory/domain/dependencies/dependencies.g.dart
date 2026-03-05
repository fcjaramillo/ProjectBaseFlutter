// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCommunesUseCase)
const getCommunesUseCaseProvider = GetCommunesUseCaseProvider._();

final class GetCommunesUseCaseProvider
    extends
        $FunctionalProvider<
          GetCommunesUseCase,
          GetCommunesUseCase,
          GetCommunesUseCase
        >
    with $Provider<GetCommunesUseCase> {
  const GetCommunesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCommunesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCommunesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCommunesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCommunesUseCase create(Ref ref) {
    return getCommunesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCommunesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCommunesUseCase>(value),
    );
  }
}

String _$getCommunesUseCaseHash() =>
    r'b2e1d4b8b19446a0416b414f09b065cfdceff86f';

@ProviderFor(getCommuneByIdUseCase)
const getCommuneByIdUseCaseProvider = GetCommuneByIdUseCaseProvider._();

final class GetCommuneByIdUseCaseProvider
    extends
        $FunctionalProvider<
          GetCommuneByIdUseCase,
          GetCommuneByIdUseCase,
          GetCommuneByIdUseCase
        >
    with $Provider<GetCommuneByIdUseCase> {
  const GetCommuneByIdUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCommuneByIdUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCommuneByIdUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCommuneByIdUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCommuneByIdUseCase create(Ref ref) {
    return getCommuneByIdUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCommuneByIdUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCommuneByIdUseCase>(value),
    );
  }
}

String _$getCommuneByIdUseCaseHash() =>
    r'9e9aa46172e98a99598b83b1716e09b93a3aa6d5';
