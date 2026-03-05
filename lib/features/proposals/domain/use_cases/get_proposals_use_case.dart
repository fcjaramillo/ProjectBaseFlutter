part of 'use_cases.dart';

class GetProposalsUseCase {
  final IProposalsRepository _repository;

  GetProposalsUseCase(this._repository);

  Future<ResultDef<List<Proposal>>> call() =>
      _repository.getProposals();
}
