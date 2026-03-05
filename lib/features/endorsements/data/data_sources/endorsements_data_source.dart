part of 'data_sources.dart';

class EndorsementsDataSource {
  EndorsementsDataSource._();

  static Future<ResultDef<List<Endorsement>>> getEndorsements() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.endorsements,
        orderBy: 'sort_order',
      );
      final List<Endorsement> endorsements =
          data.map(Endorsement.fromJson).toList();
      return ResultDef<List<Endorsement>>.success(endorsements);
    } catch (e) {
      return FailDef<List<Endorsement>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }

  static Future<ResultDef<List<Endorsement>>> getFeaturedEndorsements()
      async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchFeatured(
        SupabaseTables.endorsements,
        orderBy: 'sort_order',
      );
      final List<Endorsement> endorsements =
          data.map(Endorsement.fromJson).toList();
      return ResultDef<List<Endorsement>>.success(endorsements);
    } catch (e) {
      return FailDef<List<Endorsement>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
