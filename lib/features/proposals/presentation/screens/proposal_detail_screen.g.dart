// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'proposal_detail_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ProposalDetailViewModel)
const proposalDetailViewModelProvider = ProposalDetailViewModelProvider._();

final class ProposalDetailViewModelProvider
    extends $NotifierProvider<ProposalDetailViewModel, ProposalDetailState> {
  const ProposalDetailViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'proposalDetailViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$proposalDetailViewModelHash();

  @$internal
  @override
  ProposalDetailViewModel create() => ProposalDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProposalDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProposalDetailState>(value),
    );
  }
}

String _$proposalDetailViewModelHash() =>
    r'18093f214a945ab046037ad3493b04cbb4385ff5';

abstract class _$ProposalDetailViewModel
    extends $Notifier<ProposalDetailState> {
  ProposalDetailState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ProposalDetailState, ProposalDetailState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProposalDetailState, ProposalDetailState>,
              ProposalDetailState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
