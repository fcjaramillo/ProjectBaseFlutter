// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getLifeMilestonesUseCase)
const getLifeMilestonesUseCaseProvider = GetLifeMilestonesUseCaseProvider._();

final class GetLifeMilestonesUseCaseProvider
    extends
        $FunctionalProvider<
          GetLifeMilestonesUseCase,
          GetLifeMilestonesUseCase,
          GetLifeMilestonesUseCase
        >
    with $Provider<GetLifeMilestonesUseCase> {
  const GetLifeMilestonesUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getLifeMilestonesUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getLifeMilestonesUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetLifeMilestonesUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetLifeMilestonesUseCase create(Ref ref) {
    return getLifeMilestonesUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetLifeMilestonesUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetLifeMilestonesUseCase>(value),
    );
  }
}

String _$getLifeMilestonesUseCaseHash() =>
    r'b19fd61a656fff673aef2eb1539a526d7d74f04e';
