part of 'use_cases.dart';

class GetInvestmentProjectsUseCase {
  final ICitizenInvestmentRepository _repository;

  GetInvestmentProjectsUseCase(this._repository);

  Future<ResultDef<List<InvestmentProject>>> call() =>
      _repository.getInvestmentProjects();
}
