part of 'repositories.dart';

abstract class IEndorsementsRepository {
  Future<ResultDef<List<Endorsement>>> getEndorsements();
  Future<ResultDef<List<Endorsement>>> getFeaturedEndorsements();
}
