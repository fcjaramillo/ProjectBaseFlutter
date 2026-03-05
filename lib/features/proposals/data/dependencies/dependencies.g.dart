// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(proposalsRepository)
const proposalsRepositoryProvider = ProposalsRepositoryProvider._();

final class ProposalsRepositoryProvider
    extends
        $FunctionalProvider<
          ProposalsRepository,
          ProposalsRepository,
          ProposalsRepository
        >
    with $Provider<ProposalsRepository> {
  const ProposalsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proposalsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proposalsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ProposalsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ProposalsRepository create(Ref ref) {
    return proposalsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProposalsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProposalsRepository>(value),
    );
  }
}

String _$proposalsRepositoryHash() =>
    r'71ae22efe1de0657acfdbcb72ed4105192f4f929';
