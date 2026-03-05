part of 'repositories.dart';

abstract class ICitizenInvestmentRepository {
  Future<ResultDef<List<InvestmentProject>>> getInvestmentProjects();
}
