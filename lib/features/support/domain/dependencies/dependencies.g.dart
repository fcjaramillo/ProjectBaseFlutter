// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(submitVolunteerUseCase)
const submitVolunteerUseCaseProvider = SubmitVolunteerUseCaseProvider._();

final class SubmitVolunteerUseCaseProvider
    extends
        $FunctionalProvider<
          SubmitVolunteerUseCase,
          SubmitVolunteerUseCase,
          SubmitVolunteerUseCase
        >
    with $Provider<SubmitVolunteerUseCase> {
  const SubmitVolunteerUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submitVolunteerUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submitVolunteerUseCaseHash();

  @$internal
  @override
  $ProviderElement<SubmitVolunteerUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SubmitVolunteerUseCase create(Ref ref) {
    return submitVolunteerUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubmitVolunteerUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubmitVolunteerUseCase>(value),
    );
  }
}

String _$submitVolunteerUseCaseHash() =>
    r'db4925851687fc16638d618932021bf111aabcc5';
