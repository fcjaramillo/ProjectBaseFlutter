part of 'repositories.dart';

abstract class IEventsRepository {
  Future<ResultDef<List<CampaignEvent>>> getEvents();
  Future<ResultDef<CampaignEvent?>> getEventById(String id);
  Future<ResultDef<List<CampaignEvent>>> getFeaturedEvents({int limit = 3});
}
