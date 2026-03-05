part of 'repositories.dart';

abstract class INewsRepository {
  Future<ResultDef<List<CampaignNews>>> getNews();
  Future<ResultDef<CampaignNews?>> getNewsById(String id);
  Future<ResultDef<List<CampaignNews>>> getNewsByCategory(String category);
  Future<ResultDef<List<CampaignNews>>> getFeaturedNews({int limit = 3});
}
