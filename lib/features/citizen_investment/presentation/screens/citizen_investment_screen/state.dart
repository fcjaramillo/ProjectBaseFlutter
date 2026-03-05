part of 'citizen_investment_screen.dart';

class CitizenInvestmentState {
  CitizenInvestmentState({
    required this.projects,
    required this.isLoading,
    required this.quantities,
    this.error,
  });

  final List<InvestmentProject> projects;
  final bool isLoading;
  final Map<String, int> quantities;
  final String? error;

  static const int totalBudget = 830000000000;

  int get totalInvested {
    int total = 0;
    for (final MapEntry<String, int> entry in quantities.entries) {
      final InvestmentProject? project = projects
          .where((InvestmentProject p) => p.id == entry.key)
          .firstOrNull;
      if (project != null) {
        total += project.unitCost * entry.value;
      }
    }
    return total;
  }

  int get remainingBudget => totalBudget - totalInvested;

  double get percentUsed =>
      totalBudget > 0 ? (totalInvested / totalBudget) * 100 : 0;

  factory CitizenInvestmentState.initial() => CitizenInvestmentState(
        projects: <InvestmentProject>[],
        isLoading: false,
        quantities: <String, int>{},
      );

  CitizenInvestmentState copyWith({
    List<InvestmentProject>? projects,
    bool? isLoading,
    Map<String, int>? quantities,
    String? error,
    bool clearError = false,
  }) =>
      CitizenInvestmentState(
        projects: projects ?? this.projects,
        isLoading: isLoading ?? this.isLoading,
        quantities: quantities ?? this.quantities,
        error: clearError ? null : error ?? this.error,
      );
}
