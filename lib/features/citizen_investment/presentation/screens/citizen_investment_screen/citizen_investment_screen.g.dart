// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'citizen_investment_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CitizenInvestmentViewModel)
const citizenInvestmentViewModelProvider =
    CitizenInvestmentViewModelProvider._();

final class CitizenInvestmentViewModelProvider
    extends
        $NotifierProvider<CitizenInvestmentViewModel, CitizenInvestmentState> {
  const CitizenInvestmentViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'citizenInvestmentViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$citizenInvestmentViewModelHash();

  @$internal
  @override
  CitizenInvestmentViewModel create() => CitizenInvestmentViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CitizenInvestmentState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CitizenInvestmentState>(value),
    );
  }
}

String _$citizenInvestmentViewModelHash() =>
    r'50af386405ba29e7e6540f6c65b757eeee8d6a32';

abstract class _$CitizenInvestmentViewModel
    extends $Notifier<CitizenInvestmentState> {
  CitizenInvestmentState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<CitizenInvestmentState, CitizenInvestmentState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CitizenInvestmentState, CitizenInvestmentState>,
              CitizenInvestmentState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
