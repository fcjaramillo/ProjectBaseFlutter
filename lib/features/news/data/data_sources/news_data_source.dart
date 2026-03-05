part of 'data_sources.dart';

class NewsDataSource {
  NewsDataSource._();

  static Future<ResultDef<List<CampaignNews>>> getNews() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.news,
        orderBy: 'published_date',
        ascending: false,
      );
      return ResultDef<List<CampaignNews>>.success(
        data.map(CampaignNews.fromJson).toList(),
      );
    } catch (e) {
      return FailDef<List<CampaignNews>>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }

  static Future<ResultDef<CampaignNews?>> getNewsById(String id) async {
    try {
      final Map<String, dynamic>? data =
          await SupabaseDataSource.fetchById(SupabaseTables.news, id);
      return ResultDef<CampaignNews?>.success(
        data != null ? CampaignNews.fromJson(data) : null,
      );
    } catch (e) {
      return FailDef<CampaignNews?>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }

  static Future<ResultDef<List<CampaignNews>>> getNewsByCategory(
    String category,
  ) async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchWhere(
        SupabaseTables.news,
        column: 'category',
        value: category,
        orderBy: 'published_date',
        ascending: false,
      );
      return ResultDef<List<CampaignNews>>.success(
        data.map(CampaignNews.fromJson).toList(),
      );
    } catch (e) {
      return FailDef<List<CampaignNews>>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }

  static Future<ResultDef<List<CampaignNews>>> getFeaturedNews({
    int limit = 3,
  }) async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchFeatured(
        SupabaseTables.news,
        orderBy: 'published_date',
        ascending: false,
        limit: limit,
      );
      return ResultDef<List<CampaignNews>>.success(
        data.map(CampaignNews.fromJson).toList(),
      );
    } catch (e) {
      return FailDef<List<CampaignNews>>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }
}
