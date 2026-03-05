// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(visionRepository)
const visionRepositoryProvider = VisionRepositoryProvider._();

final class VisionRepositoryProvider
    extends
        $FunctionalProvider<
          VisionRepository,
          VisionRepository,
          VisionRepository
        >
    with $Provider<VisionRepository> {
  const VisionRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visionRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$visionRepositoryHash();

  @$internal
  @override
  $ProviderElement<VisionRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VisionRepository create(Ref ref) {
    return visionRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VisionRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VisionRepository>(value),
    );
  }
}

String _$visionRepositoryHash() => r'0bc204441da926ed7a19406445934640e6b3ddc8';
