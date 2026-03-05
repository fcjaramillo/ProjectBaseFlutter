// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_NewsDetailViewModel)
const _newsDetailViewModelProvider = _NewsDetailViewModelProvider._();

final class _NewsDetailViewModelProvider
    extends $NotifierProvider<_NewsDetailViewModel, _NewsDetailState> {
  const _NewsDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_newsDetailViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_newsDetailViewModelHash();

  @$internal
  @override
  _NewsDetailViewModel create() => _NewsDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_NewsDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_NewsDetailState>(value),
    );
  }
}

String _$_newsDetailViewModelHash() =>
    r'105e5508eca42124c57a61a19c59ed252b5ff63c';

abstract class _$NewsDetailViewModel extends $Notifier<_NewsDetailState> {
  _NewsDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<_NewsDetailState, _NewsDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_NewsDetailState, _NewsDetailState>,
              _NewsDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
