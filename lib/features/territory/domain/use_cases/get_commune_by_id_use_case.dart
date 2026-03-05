part of 'use_cases.dart';

class GetCommuneByIdUseCase {
  final ITerritoryRepository _repository;

  GetCommuneByIdUseCase(this._repository);

  Future<ResultDef<Commune?>> call(String id) =>
      _repository.getCommuneById(id);
}
