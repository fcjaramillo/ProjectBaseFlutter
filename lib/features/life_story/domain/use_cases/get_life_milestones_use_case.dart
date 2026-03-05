part of 'use_cases.dart';

class GetLifeMilestonesUseCase {
  GetLifeMilestonesUseCase(this._repository);

  final ILifeStoryRepository _repository;

  Future<ResultDef<List<LifeMilestone>>> call() =>
      _repository.getLifeMilestones();
}
