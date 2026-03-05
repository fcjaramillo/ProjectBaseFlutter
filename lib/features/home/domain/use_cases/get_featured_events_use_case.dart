part of 'use_cases.dart';

class GetFeaturedEventsUseCase {
  GetFeaturedEventsUseCase(this._repo);

  final IHomeRepository _repo;

  Future<ResultDef<List<CampaignEvent>>> call({int limit = 3}) =>
      _repo.getFeaturedEvents(limit: limit);
}
