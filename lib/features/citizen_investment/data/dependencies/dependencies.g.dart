// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(baseapiUn)
const baseapiUnProvider = BaseapiUnProvider._();

final class BaseapiUnProvider
    extends $FunctionalProvider<ApiUtils, ApiUtils, ApiUtils>
    with $Provider<ApiUtils> {
  const BaseapiUnProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseapiUnProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseapiUnHash();

  @$internal
  @override
  $ProviderElement<ApiUtils> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ApiUtils create(Ref ref) {
    return baseapiUn(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ApiUtils value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ApiUtils>(value),
    );
  }
}

String _$baseapiUnHash() => r'0207538a30ad98a56a20452fe30dda65e12420e5';

@ProviderFor(baseapiUnDataSource)
const baseapiUnDataSourceProvider = BaseapiUnDataSourceProvider._();

final class BaseapiUnDataSourceProvider
    extends $FunctionalProvider<BaseDataSource, BaseDataSource, BaseDataSource>
    with $Provider<BaseDataSource> {
  const BaseapiUnDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseapiUnDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseapiUnDataSourceHash();

  @$internal
  @override
  $ProviderElement<BaseDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  BaseDataSource create(Ref ref) {
    return baseapiUnDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseDataSource>(value),
    );
  }
}

String _$baseapiUnDataSourceHash() =>
    r'6dab0e921dcf6278914c7abb65705c33fbfcb746';
