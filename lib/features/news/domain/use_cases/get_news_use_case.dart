part of 'use_cases.dart';

class GetNewsUseCase {
  GetNewsUseCase(this._repository);

  final INewsRepository _repository;

  Future<ResultDef<List<CampaignNews>>> call() => _repository.getNews();
}
