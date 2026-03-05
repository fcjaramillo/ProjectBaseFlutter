part of 'repositories.dart';

class EndorsementsRepository implements IEndorsementsRepository {
  @override
  Future<ResultDef<List<Endorsement>>> getEndorsements() =>
      EndorsementsDataSource.getEndorsements();

  @override
  Future<ResultDef<List<Endorsement>>> getFeaturedEndorsements() =>
      EndorsementsDataSource.getFeaturedEndorsements();
}
