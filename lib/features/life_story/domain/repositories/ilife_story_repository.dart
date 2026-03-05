part of 'repositories.dart';

abstract class ILifeStoryRepository {
  Future<ResultDef<List<LifeMilestone>>> getLifeMilestones();
}
