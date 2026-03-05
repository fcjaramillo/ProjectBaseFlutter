part of 'repositories.dart';

class EventsRepository implements IEventsRepository {
  @override
  Future<ResultDef<List<CampaignEvent>>> getEvents() =>
      EventsDataSource.getEvents();

  @override
  Future<ResultDef<CampaignEvent?>> getEventById(String id) =>
      EventsDataSource.getEventById(id);

  @override
  Future<ResultDef<List<CampaignEvent>>> getFeaturedEvents({
    int limit = 3,
  }) =>
      EventsDataSource.getFeaturedEvents(limit: limit);
}
