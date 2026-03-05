// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(strategicAxesRepository)
const strategicAxesRepositoryProvider = StrategicAxesRepositoryProvider._();

final class StrategicAxesRepositoryProvider
    extends
        $FunctionalProvider<
          StrategicAxesRepository,
          StrategicAxesRepository,
          StrategicAxesRepository
        >
    with $Provider<StrategicAxesRepository> {
  const StrategicAxesRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'strategicAxesRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$strategicAxesRepositoryHash();

  @$internal
  @override
  $ProviderElement<StrategicAxesRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StrategicAxesRepository create(Ref ref) {
    return strategicAxesRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StrategicAxesRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StrategicAxesRepository>(value),
    );
  }
}

String _$strategicAxesRepositoryHash() =>
    r'd321829c644826bbc9dac38c084521f724f6ebf5';
