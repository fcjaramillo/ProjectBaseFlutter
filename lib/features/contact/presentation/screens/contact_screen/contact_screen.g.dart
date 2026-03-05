// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ContactViewModel)
const contactViewModelProvider = ContactViewModelProvider._();

final class ContactViewModelProvider
    extends $NotifierProvider<ContactViewModel, ContactState> {
  const ContactViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'contactViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$contactViewModelHash();

  @$internal
  @override
  ContactViewModel create() => ContactViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ContactState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ContactState>(value),
    );
  }
}

String _$contactViewModelHash() => r'78da3b2332d7b9d56d28d401bc6a265590d1add8';

abstract class _$ContactViewModel extends $Notifier<ContactState> {
  ContactState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ContactState, ContactState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ContactState, ContactState>,
              ContactState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
