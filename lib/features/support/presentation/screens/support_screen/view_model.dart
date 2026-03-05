part of 'support_screen.dart';

@riverpod
class SupportViewModel extends _$SupportViewModel {
  @override
  SupportState build() => SupportState.initial();

  Future<void> submitVolunteer(Volunteer volunteer) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<bool> result =
        await ref.read(submitVolunteerUseCaseProvider).call(volunteer);

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al enviar el registro',
        );
      },
      success: (_) {
        state = state.copyWith(isLoading: false, isSent: true);
      },
    );
  }

  void reset() {
    state = SupportState.initial();
  }
}
