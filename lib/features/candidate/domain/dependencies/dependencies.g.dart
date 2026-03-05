// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getCandidateInfoUseCase)
const getCandidateInfoUseCaseProvider = GetCandidateInfoUseCaseProvider._();

final class GetCandidateInfoUseCaseProvider
    extends
        $FunctionalProvider<
          GetCandidateInfoUseCase,
          GetCandidateInfoUseCase,
          GetCandidateInfoUseCase
        >
    with $Provider<GetCandidateInfoUseCase> {
  const GetCandidateInfoUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getCandidateInfoUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getCandidateInfoUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCandidateInfoUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetCandidateInfoUseCase create(Ref ref) {
    return getCandidateInfoUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCandidateInfoUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCandidateInfoUseCase>(value),
    );
  }
}

String _$getCandidateInfoUseCaseHash() =>
    r'f888d4c99304fc9b4346525abefe8b17854d5499';
