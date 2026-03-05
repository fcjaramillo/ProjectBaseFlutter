// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_NewsViewModel)
const _newsViewModelProvider = _NewsViewModelProvider._();

final class _NewsViewModelProvider
    extends $NotifierProvider<_NewsViewModel, _NewsState> {
  const _NewsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_newsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_newsViewModelHash();

  @$internal
  @override
  _NewsViewModel create() => _NewsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_NewsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_NewsState>(value),
    );
  }
}

String _$_newsViewModelHash() => r'3f139a6010a316f2dcc4069f57c98f5313fe09ce';

abstract class _$NewsViewModel extends $Notifier<_NewsState> {
  _NewsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<_NewsState, _NewsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_NewsState, _NewsState>,
              _NewsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
