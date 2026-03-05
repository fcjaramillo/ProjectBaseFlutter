part of 'use_cases.dart';

class GetFeaturedNewsUseCase {
  GetFeaturedNewsUseCase(this._repository);

  final INewsRepository _repository;

  Future<ResultDef<List<CampaignNews>>> call({int limit = 3}) =>
      _repository.getFeaturedNews(limit: limit);
}
