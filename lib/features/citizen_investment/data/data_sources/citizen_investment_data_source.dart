part of 'data_sources.dart';

class CitizenInvestmentDataSource {
  CitizenInvestmentDataSource._();

  static Future<ResultDef<List<InvestmentProject>>>
      getInvestmentProjects() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchAll(
        SupabaseTables.investmentProjects,
        orderBy: 'sort_order',
      );
      final List<InvestmentProject> projects =
          data.map(InvestmentProject.fromJson).toList();
      return ResultDef<List<InvestmentProject>>.success(projects);
    } catch (e) {
      return FailDef<List<InvestmentProject>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
