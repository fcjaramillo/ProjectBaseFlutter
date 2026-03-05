part of 'repositories.dart';

class ProposalsRepository implements IProposalsRepository {
  @override
  Future<ResultDef<List<Proposal>>> getProposals() =>
      ProposalsDataSource.getProposals();

  @override
  Future<ResultDef<List<Proposal>>> getProposalsByAxis(String axisId) =>
      ProposalsDataSource.getProposalsByAxis(axisId);

  @override
  Future<ResultDef<Proposal?>> getProposalById(String id) =>
      ProposalsDataSource.getProposalById(id);
}
