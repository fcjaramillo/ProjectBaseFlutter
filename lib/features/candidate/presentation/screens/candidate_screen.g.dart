// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_CandidateViewModel)
const _candidateViewModelProvider = _CandidateViewModelProvider._();

final class _CandidateViewModelProvider
    extends $NotifierProvider<_CandidateViewModel, _CandidateState> {
  const _CandidateViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'_candidateViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$_candidateViewModelHash();

  @$internal
  @override
  _CandidateViewModel create() => _CandidateViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(_CandidateState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<_CandidateState>(value),
    );
  }
}

String _$_candidateViewModelHash() =>
    r'44974fa830a388eb3f26c63dd0737f4af51f176a';

abstract class _$CandidateViewModel extends $Notifier<_CandidateState> {
  _CandidateState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<_CandidateState, _CandidateState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<_CandidateState, _CandidateState>,
              _CandidateState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
