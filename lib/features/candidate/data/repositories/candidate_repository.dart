part of 'repositories.dart';

class CandidateRepository implements ICandidateRepository {
  @override
  Future<ResultDef<CandidateInfo?>> getCandidateInfo() =>
      CandidateDataSource.getCandidateInfo();
}
