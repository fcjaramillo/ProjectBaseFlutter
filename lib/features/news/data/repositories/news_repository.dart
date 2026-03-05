part of 'repositories.dart';

class NewsRepository implements INewsRepository {
  @override
  Future<ResultDef<List<CampaignNews>>> getNews() =>
      NewsDataSource.getNews();

  @override
  Future<ResultDef<CampaignNews?>> getNewsById(String id) =>
      NewsDataSource.getNewsById(id);

  @override
  Future<ResultDef<List<CampaignNews>>> getNewsByCategory(
    String category,
  ) =>
      NewsDataSource.getNewsByCategory(category);

  @override
  Future<ResultDef<List<CampaignNews>>> getFeaturedNews({
    int limit = 3,
  }) =>
      NewsDataSource.getFeaturedNews(limit: limit);
}
