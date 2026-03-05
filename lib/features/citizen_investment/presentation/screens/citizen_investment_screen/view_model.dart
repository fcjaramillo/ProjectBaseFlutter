part of 'citizen_investment_screen.dart';

@riverpod
class CitizenInvestmentViewModel extends _$CitizenInvestmentViewModel {
  @override
  CitizenInvestmentState build() => CitizenInvestmentState.initial();

  Future<void> loadProjects() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<List<InvestmentProject>> result =
        await ref.read(getInvestmentProjectsUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar los proyectos',
        );
      },
      success: (List<InvestmentProject> projects) {
        state = state.copyWith(isLoading: false, projects: projects);
      },
    );
  }

  void updateQuantity(String projectId, int quantity) {
    final InvestmentProject? project = state.projects
        .where((InvestmentProject p) => p.id == projectId)
        .firstOrNull;

    if (project == null) {
      return;
    }

    final int currentQty = state.quantities[projectId] ?? 0;
    final int newTotal =
        state.totalInvested - (project.unitCost * currentQty) +
            (project.unitCost * quantity);

    if (newTotal > CitizenInvestmentState.totalBudget) {
      return;
    }

    final Map<String, int> newQuantities =
        Map<String, int>.from(state.quantities);

    if (quantity > 0) {
      newQuantities[projectId] = quantity;
    } else {
      newQuantities.remove(projectId);
    }

    state = state.copyWith(quantities: newQuantities);
  }
}
