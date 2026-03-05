part of 'use_cases.dart';

class GetFeaturedNewsUseCase {
  GetFeaturedNewsUseCase(this._repo);

  final IHomeRepository _repo;

  Future<ResultDef<List<CampaignNews>>> call({int limit = 3}) =>
      _repo.getFeaturedNews(limit: limit);
}
