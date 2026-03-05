part of 'use_cases.dart';

class GetFeaturedEndorsementsUseCase {
  final IEndorsementsRepository _repository;

  GetFeaturedEndorsementsUseCase(this._repository);

  Future<ResultDef<List<Endorsement>>> call() =>
      _repository.getFeaturedEndorsements();
}
