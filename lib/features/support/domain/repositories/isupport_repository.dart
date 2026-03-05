part of 'repositories.dart';

abstract class ISupportRepository {
  Future<ResultDef<bool>> submitVolunteer(Volunteer volunteer);
}
