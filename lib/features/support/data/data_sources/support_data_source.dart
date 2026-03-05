part of 'data_sources.dart';

class SupportDataSource {
  SupportDataSource._();

  static Future<ResultDef<bool>> submitVolunteer(Volunteer volunteer) async {
    try {
      await SupabaseDataSource.insert(
        SupabaseTables.volunteers,
        volunteer.toInsertJson(),
      );
      return ResultDef<bool>.success(true);
    } catch (e) {
      return FailDef<bool>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
