// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(citizenInvestmentRepository)
const citizenInvestmentRepositoryProvider =
    CitizenInvestmentRepositoryProvider._();

final class CitizenInvestmentRepositoryProvider
    extends
        $FunctionalProvider<
          CitizenInvestmentRepository,
          CitizenInvestmentRepository,
          CitizenInvestmentRepository
        >
    with $Provider<CitizenInvestmentRepository> {
  const CitizenInvestmentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'citizenInvestmentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$citizenInvestmentRepositoryHash();

  @$internal
  @override
  $ProviderElement<CitizenInvestmentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CitizenInvestmentRepository create(Ref ref) {
    return citizenInvestmentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CitizenInvestmentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CitizenInvestmentRepository>(value),
    );
  }
}

String _$citizenInvestmentRepositoryHash() =>
    r'759b1df6f7c35cf8aa76f22f3cbee8bd7e03951f';
