part of 'use_cases.dart';

class GetEndorsementsUseCase {
  final IEndorsementsRepository _repository;

  GetEndorsementsUseCase(this._repository);

  Future<ResultDef<List<Endorsement>>> call() =>
      _repository.getEndorsements();
}
