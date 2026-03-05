part of 'repositories.dart';

class CitizenInvestmentRepository implements ICitizenInvestmentRepository {
  @override
  Future<ResultDef<List<InvestmentProject>>> getInvestmentProjects() =>
      CitizenInvestmentDataSource.getInvestmentProjects();
}
