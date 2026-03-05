part of 'data_sources.dart';

class CandidateDataSource {
  CandidateDataSource._();

  static Future<ResultDef<CandidateInfo?>> getCandidateInfo() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.candidateInfo,
      );
      return ResultDef<CandidateInfo?>.success(
        data.isNotEmpty ? CandidateInfo.fromJson(data.first) : null,
      );
    } catch (e) {
      return FailDef<CandidateInfo?>(
        BackError(
          statusCode: 500,
          description: e.toString(),
          err: e.toString(),
        ),
      );
    }
  }
}
