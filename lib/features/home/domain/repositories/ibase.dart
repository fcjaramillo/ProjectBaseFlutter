part of 'repositories.dart';

abstract class IHomeRepository {
  Future<ResultDef<List<CampaignEvent>>> getFeaturedEvents({int limit});
  Future<ResultDef<List<CampaignNews>>> getFeaturedNews({int limit});
}
