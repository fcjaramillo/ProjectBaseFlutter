// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getStrategicAxesUseCase)
const getStrategicAxesUseCaseProvider = GetStrategicAxesUseCaseProvider._();

final class GetStrategicAxesUseCaseProvider
    extends
        $FunctionalProvider<
          GetStrategicAxesUseCase,
          GetStrategicAxesUseCase,
          GetStrategicAxesUseCase
        >
    with $Provider<GetStrategicAxesUseCase> {
  const GetStrategicAxesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getStrategicAxesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getStrategicAxesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetStrategicAxesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetStrategicAxesUseCase create(Ref ref) {
    return getStrategicAxesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetStrategicAxesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetStrategicAxesUseCase>(value),
    );
  }
}

String _$getStrategicAxesUseCaseHash() =>
    r'f621083b2af39e49dd3e4b4d2b3788678f058185';
