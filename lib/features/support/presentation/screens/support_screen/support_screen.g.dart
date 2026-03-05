// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SupportViewModel)
const supportViewModelProvider = SupportViewModelProvider._();

final class SupportViewModelProvider
    extends $NotifierProvider<SupportViewModel, SupportState> {
  const SupportViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'supportViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$supportViewModelHash();

  @$internal
  @override
  SupportViewModel create() => SupportViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SupportState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SupportState>(value),
    );
  }
}

String _$supportViewModelHash() => r'd149d707aa02755cd6727190cd3a4a329626c5b6';

abstract class _$SupportViewModel extends $Notifier<SupportState> {
  SupportState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SupportState, SupportState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SupportState, SupportState>,
              SupportState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
