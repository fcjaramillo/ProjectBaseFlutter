// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_story_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_LifeStoryViewModel)
const _lifeStoryViewModelProvider = _LifeStoryViewModelProvider._();

final class _LifeStoryViewModelProvider
    extends $NotifierProvider<_LifeStoryViewModel, _LifeStoryState> {
  const _LifeStoryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_lifeStoryViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_lifeStoryViewModelHash();

  @$internal
  @override
  _LifeStoryViewModel create() => _LifeStoryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_LifeStoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_LifeStoryState>(value),
    );
  }
}

String _$_lifeStoryViewModelHash() =>
    r'd58c1e0331b199929862ec045e65de1920c7a1ae';

abstract class _$LifeStoryViewModel extends $Notifier<_LifeStoryState> {
  _LifeStoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<_LifeStoryState, _LifeStoryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_LifeStoryState, _LifeStoryState>,
              _LifeStoryState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
