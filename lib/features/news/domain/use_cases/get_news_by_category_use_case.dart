part of 'use_cases.dart';

class GetNewsByCategoryUseCase {
  GetNewsByCategoryUseCase(this._repository);

  final INewsRepository _repository;

  Future<ResultDef<List<CampaignNews>>> call(String category) =>
      _repository.getNewsByCategory(category);
}
