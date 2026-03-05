part of 'data_sources.dart';

class StrategicAxesDataSource {
  StrategicAxesDataSource._();

  static Future<ResultDef<List<StrategicAxis>>> getStrategicAxes() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.strategicAxes,
        orderBy: 'sort_order',
      );
      final List<StrategicAxis> axes =
          data.map(StrategicAxis.fromJson).toList();
      return ResultDef<List<StrategicAxis>>.success(axes);
    } catch (e) {
      return FailDef<List<StrategicAxis>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
