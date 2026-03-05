// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(endorsementsRepository)
const endorsementsRepositoryProvider = EndorsementsRepositoryProvider._();

final class EndorsementsRepositoryProvider
    extends
        $FunctionalProvider<
          EndorsementsRepository,
          EndorsementsRepository,
          EndorsementsRepository
        >
    with $Provider<EndorsementsRepository> {
  const EndorsementsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'endorsementsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$endorsementsRepositoryHash();

  @$internal
  @override
  $ProviderElement<EndorsementsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  EndorsementsRepository create(Ref ref) {
    return endorsementsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EndorsementsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EndorsementsRepository>(value),
    );
  }
}

String _$endorsementsRepositoryHash() =>
    r'b2e6d2d12770f8bd156606d162a12cfba87889e1';
