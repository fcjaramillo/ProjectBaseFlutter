part of 'use_cases.dart';

class GetNewsByIdUseCase {
  GetNewsByIdUseCase(this._repository);

  final INewsRepository _repository;

  Future<ResultDef<CampaignNews?>> call(String id) =>
      _repository.getNewsById(id);
}
