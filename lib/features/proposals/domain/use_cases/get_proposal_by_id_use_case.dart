part of 'use_cases.dart';

class GetProposalByIdUseCase {
  final IProposalsRepository _repository;

  GetProposalByIdUseCase(this._repository);

  Future<ResultDef<Proposal?>> call(String id) =>
      _repository.getProposalById(id);
}
