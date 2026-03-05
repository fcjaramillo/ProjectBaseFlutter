part of 'data_sources.dart';

class TerritoryDataSource {
  TerritoryDataSource._();

  static Future<ResultDef<List<Commune>>> getCommunes() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.communes,
        orderBy: 'number',
      );
      final List<Commune> communes =
          data.map(Commune.fromJson).toList();
      return ResultDef<List<Commune>>.success(communes);
    } catch (e) {
      return FailDef<List<Commune>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }

  static Future<ResultDef<Commune?>> getCommuneById(String id) async {
    try {
      final Map<String, dynamic>? data =
          await SupabaseDataSource.fetchById(SupabaseTables.communes, id);
      return ResultDef<Commune?>.success(
          data != null ? Commune.fromJson(data) : null);
    } catch (e) {
      return FailDef<Commune?>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
