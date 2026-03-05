part of 'repositories.dart';

class TerritoryRepository implements ITerritoryRepository {
  @override
  Future<ResultDef<List<Commune>>> getCommunes() =>
      TerritoryDataSource.getCommunes();

  @override
  Future<ResultDef<Commune?>> getCommuneById(String id) =>
      TerritoryDataSource.getCommuneById(id);
}
