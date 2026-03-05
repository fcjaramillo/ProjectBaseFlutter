// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MediaViewModel)
const mediaViewModelProvider = MediaViewModelProvider._();

final class MediaViewModelProvider
    extends $NotifierProvider<MediaViewModel, MediaState> {
  const MediaViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mediaViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mediaViewModelHash();

  @$internal
  @override
  MediaViewModel create() => MediaViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaState>(value),
    );
  }
}

String _$mediaViewModelHash() => r'04b3d21fcf06a171fd15febe18748e9af4311c2e';

abstract class _$MediaViewModel extends $Notifier<MediaState> {
  MediaState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MediaState, MediaState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MediaState, MediaState>,
              MediaState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
