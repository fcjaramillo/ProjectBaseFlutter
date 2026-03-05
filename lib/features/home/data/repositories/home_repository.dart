part of 'repositories.dart';

class HomeRepository implements IHomeRepository {
  @override
  Future<ResultDef<List<CampaignEvent>>> getFeaturedEvents({
    int limit = 3,
  }) =>
      HomeDataSource.getFeaturedEvents(limit: limit);

  @override
  Future<ResultDef<List<CampaignNews>>> getFeaturedNews({
    int limit = 3,
  }) =>
      HomeDataSource.getFeaturedNews(limit: limit);
}
