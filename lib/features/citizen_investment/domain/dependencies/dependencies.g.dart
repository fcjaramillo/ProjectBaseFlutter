// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getInvestmentProjectsUseCase)
const getInvestmentProjectsUseCaseProvider =
    GetInvestmentProjectsUseCaseProvider._();

final class GetInvestmentProjectsUseCaseProvider
    extends
        $FunctionalProvider<
          GetInvestmentProjectsUseCase,
          GetInvestmentProjectsUseCase,
          GetInvestmentProjectsUseCase
        >
    with $Provider<GetInvestmentProjectsUseCase> {
  const GetInvestmentProjectsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getInvestmentProjectsUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getInvestmentProjectsUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetInvestmentProjectsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetInvestmentProjectsUseCase create(Ref ref) {
    return getInvestmentProjectsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetInvestmentProjectsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetInvestmentProjectsUseCase>(value),
    );
  }
}

String _$getInvestmentProjectsUseCaseHash() =>
    r'63e66abfef1157dd10eb0e248be6c6f725009cbe';
