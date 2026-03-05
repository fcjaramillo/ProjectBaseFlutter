part of 'repositories.dart';

class SupportRepository implements ISupportRepository {
  @override
  Future<ResultDef<bool>> submitVolunteer(Volunteer volunteer) =>
      SupportDataSource.submitVolunteer(volunteer);
}
