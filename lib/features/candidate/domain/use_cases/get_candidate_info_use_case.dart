part of 'use_cases.dart';

class GetCandidateInfoUseCase {
  GetCandidateInfoUseCase(this._repository);

  final ICandidateRepository _repository;

  Future<ResultDef<CandidateInfo?>> call() =>
      _repository.getCandidateInfo();
}
