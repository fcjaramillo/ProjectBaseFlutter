part of 'repositories.dart';

abstract class IProposalsRepository {
  Future<ResultDef<List<Proposal>>> getProposals();
  Future<ResultDef<List<Proposal>>> getProposalsByAxis(String axisId);
  Future<ResultDef<Proposal?>> getProposalById(String id);
}
