part of 'data_sources.dart';

class HomeDataSource {
  HomeDataSource._();

  static Future<ResultDef<List<CampaignEvent>>> getFeaturedEvents({
    int limit = 3,
  }) async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchFeatured(
        SupabaseTables.events,
        orderBy: 'event_date',
        limit: limit,
      );
      return ResultDef<List<CampaignEvent>>.success(
        data.map(CampaignEvent.fromJson).toList(),
      );
    } catch (e) {
      return FailDef<List<CampaignEvent>>(
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
          await SupabaseDataSource.fetchAll(
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
