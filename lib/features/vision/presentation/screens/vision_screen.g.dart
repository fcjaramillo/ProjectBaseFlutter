// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vision_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_VisionViewModel)
const _visionViewModelProvider = _VisionViewModelProvider._();

final class _VisionViewModelProvider
    extends $NotifierProvider<_VisionViewModel, _VisionState> {
  const _VisionViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_visionViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_visionViewModelHash();

  @$internal
  @override
  _VisionViewModel create() => _VisionViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_VisionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_VisionState>(value),
    );
  }
}

String _$_visionViewModelHash() => r'0181425969fde7cae1e1e692bad10095d72d5932';

abstract class _$VisionViewModel extends $Notifier<_VisionState> {
  _VisionState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<_VisionState, _VisionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_VisionState, _VisionState>,
              _VisionState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
