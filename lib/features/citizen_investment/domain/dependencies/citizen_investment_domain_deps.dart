part of 'dependencies.dart';

@riverpod
GetInvestmentProjectsUseCase getInvestmentProjectsUseCase(Ref ref) =>
    GetInvestmentProjectsUseCase(ref.read(citizenInvestmentRepositoryProvider));
