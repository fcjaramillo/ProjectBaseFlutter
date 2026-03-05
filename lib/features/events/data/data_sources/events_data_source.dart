part of 'data_sources.dart';

class EventsDataSource {
  EventsDataSource._();

  static Future<ResultDef<List<CampaignEvent>>> getEvents() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.events,
        orderBy: 'event_date',
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

  static Future<ResultDef<CampaignEvent?>> getEventById(String id) async {
    try {
      final Map<String, dynamic>? data =
          await SupabaseDataSource.fetchById(SupabaseTables.events, id);
      return ResultDef<CampaignEvent?>.success(
        data != null ? CampaignEvent.fromJson(data) : null,
      );
    } catch (e) {
      return FailDef<CampaignEvent?>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }

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
}
