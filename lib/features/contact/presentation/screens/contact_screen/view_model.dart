part of 'contact_screen.dart';

@riverpod
class ContactViewModel extends _$ContactViewModel {
  @override
  ContactState build() => ContactState.initial();

  Future<void> sendMessage(ContactMessage message) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<bool> result =
        await ref.read(sendContactMessageUseCaseProvider).call(message);

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al enviar el mensaje',
        );
      },
      success: (_) {
        state = state.copyWith(isLoading: false, isSent: true);
      },
    );
  }

  void reset() {
    state = ContactState.initial();
  }
}
