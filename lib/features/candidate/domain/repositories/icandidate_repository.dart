part of 'repositories.dart';

abstract class ICandidateRepository {
  Future<ResultDef<CandidateInfo?>> getCandidateInfo();
}
