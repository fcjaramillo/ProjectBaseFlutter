part of 'repositories.dart';

class LifeStoryRepository implements ILifeStoryRepository {
  @override
  Future<ResultDef<List<LifeMilestone>>> getLifeMilestones() =>
      LifeStoryDataSource.getLifeMilestones();
}
