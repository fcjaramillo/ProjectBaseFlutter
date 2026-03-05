// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sendContactMessageUseCase)
const sendContactMessageUseCaseProvider = SendContactMessageUseCaseProvider._();

final class SendContactMessageUseCaseProvider
    extends
        $FunctionalProvider<
          SendContactMessageUseCase,
          SendContactMessageUseCase,
          SendContactMessageUseCase
        >
    with $Provider<SendContactMessageUseCase> {
  const SendContactMessageUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendContactMessageUseCaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendContactMessageUseCaseHash();

  @$internal
  @override
  $ProviderElement<SendContactMessageUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SendContactMessageUseCase create(Ref ref) {
    return sendContactMessageUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SendContactMessageUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SendContactMessageUseCase>(value),
    );
  }
}

String _$sendContactMessageUseCaseHash() =>
    r'ea0435cc3441ad6275ea6a68ee1eb247bd1f8d08';
