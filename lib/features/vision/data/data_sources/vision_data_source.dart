part of 'data_sources.dart';

class VisionDataSource {
  VisionDataSource._();

  static Future<ResultDef<CityVision?>> getCityVision() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(SupabaseTables.cityVision);
      return ResultDef<CityVision?>.success(
        data.isNotEmpty ? CityVision.fromJson(data.first) : null,
      );
    } catch (e) {
      return FailDef<CityVision?>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }
}
