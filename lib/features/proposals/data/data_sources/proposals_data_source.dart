part of 'data_sources.dart';

class ProposalsDataSource {
  ProposalsDataSource._();

  static Future<ResultDef<List<Proposal>>> getProposals() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.proposals,
        orderBy: 'sort_order',
      );
      final List<Proposal> proposals =
          data.map(Proposal.fromJson).toList();
      return ResultDef<List<Proposal>>.success(proposals);
    } catch (e) {
      return FailDef<List<Proposal>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }

  static Future<ResultDef<List<Proposal>>> getProposalsByAxis(
    String axisId,
  ) async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchWhere(
        SupabaseTables.proposals,
        column: 'axis_id',
        value: axisId,
      );
      final List<Proposal> proposals =
          data.map(Proposal.fromJson).toList();
      return ResultDef<List<Proposal>>.success(proposals);
    } catch (e) {
      return FailDef<List<Proposal>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }

  static Future<ResultDef<Proposal?>> getProposalById(String id) async {
    try {
      final Map<String, dynamic>? data =
          await SupabaseDataSource.fetchById(
        SupabaseTables.proposals,
        id,
      );
      if (data == null) {
        return ResultDef<Proposal?>.success(null);
      }
      return ResultDef<Proposal?>.success(Proposal.fromJson(data));
    } catch (e) {
      return FailDef<Proposal?>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
