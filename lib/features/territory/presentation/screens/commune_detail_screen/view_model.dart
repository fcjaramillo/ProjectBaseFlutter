part of 'commune_detail_screen.dart';

@riverpod
class CommuneDetailViewModel extends _$CommuneDetailViewModel {
  @override
  CommuneDetailState build() => CommuneDetailState.initial();

  Future<void> loadCommune(String id) async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<Commune?> result =
        await ref.read(getCommuneByIdUseCaseProvider).call(id);

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar la comuna',
        );
      },
      success: (Commune? commune) {
        state = state.copyWith(isLoading: false, commune: commune);
      },
    );
  }
}
