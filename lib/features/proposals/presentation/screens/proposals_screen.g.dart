// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposals_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProposalsViewModel)
const proposalsViewModelProvider = ProposalsViewModelProvider._();

final class ProposalsViewModelProvider
    extends $NotifierProvider<ProposalsViewModel, ProposalsState> {
  const ProposalsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proposalsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proposalsViewModelHash();

  @$internal
  @override
  ProposalsViewModel create() => ProposalsViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProposalsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProposalsState>(value),
    );
  }
}

String _$proposalsViewModelHash() =>
    r'55116cc94cdea3e623bcb76293dc6e0934a4585e';

abstract class _$ProposalsViewModel extends $Notifier<ProposalsState> {
  ProposalsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProposalsState, ProposalsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProposalsState, ProposalsState>,
              ProposalsState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
