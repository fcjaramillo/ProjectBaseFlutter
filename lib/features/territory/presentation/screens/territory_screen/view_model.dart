part of 'territory_screen.dart';

@riverpod
class TerritoryViewModel extends _$TerritoryViewModel {
  @override
  TerritoryState build() => TerritoryState.initial();

  Future<void> loadCommunes() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<List<Commune>> result =
        await ref.read(getCommunesUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar las comunas',
        );
      },
      success: (List<Commune> communes) {
        state = state.copyWith(isLoading: false, communes: communes);
      },
    );
  }

  void selectCommune(String communeId) {
    state = state.copyWith(selectedCommuneId: communeId);
  }

  void clearSelection() {
    state = state.copyWith(clearSelectedCommune: true);
  }
}
