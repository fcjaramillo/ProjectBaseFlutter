// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'commune_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CommuneDetailViewModel)
const communeDetailViewModelProvider = CommuneDetailViewModelProvider._();

final class CommuneDetailViewModelProvider
    extends $NotifierProvider<CommuneDetailViewModel, CommuneDetailState> {
  const CommuneDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'communeDetailViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$communeDetailViewModelHash();

  @$internal
  @override
  CommuneDetailViewModel create() => CommuneDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommuneDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommuneDetailState>(value),
    );
  }
}

String _$communeDetailViewModelHash() =>
    r'5d14cb14f1e6aebaf51ff6d339a93a5583ec6aa8';

abstract class _$CommuneDetailViewModel extends $Notifier<CommuneDetailState> {
  CommuneDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<CommuneDetailState, CommuneDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CommuneDetailState, CommuneDetailState>,
              CommuneDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
