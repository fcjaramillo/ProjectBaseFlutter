part of 'data_sources.dart';

class LifeStoryDataSource {
  LifeStoryDataSource._();

  static Future<ResultDef<List<LifeMilestone>>> getLifeMilestones() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.lifeMilestones,
        orderBy: 'year',
      );
      return ResultDef<List<LifeMilestone>>.success(
        data.map(LifeMilestone.fromJson).toList(),
      );
    } catch (e) {
      return FailDef<List<LifeMilestone>>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }
}
