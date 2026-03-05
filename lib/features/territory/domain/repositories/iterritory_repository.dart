part of 'repositories.dart';

abstract class ITerritoryRepository {
  Future<ResultDef<List<Commune>>> getCommunes();
  Future<ResultDef<Commune?>> getCommuneById(String id);
}
