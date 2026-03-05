part of 'use_cases.dart';

class GetCommunesUseCase {
  final ITerritoryRepository _repository;

  GetCommunesUseCase(this._repository);

  Future<ResultDef<List<Commune>>> call() => _repository.getCommunes();
}
