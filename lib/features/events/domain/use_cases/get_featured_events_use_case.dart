part of 'use_cases.dart';

class GetFeaturedEventsUseCase {
  GetFeaturedEventsUseCase(this._repository);
  final IEventsRepository _repository;
  Future<ResultDef<List<CampaignEvent>>> call({int limit = 3}) =>
      _repository.getFeaturedEvents(limit: limit);
}
