part of 'use_cases.dart';

class GetProposalsByAxisUseCase {
  final IProposalsRepository _repository;

  GetProposalsByAxisUseCase(this._repository);

  Future<ResultDef<List<Proposal>>> call(String axisId) =>
      _repository.getProposalsByAxis(axisId);
}
