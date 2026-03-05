part of 'use_cases.dart';

class SubmitVolunteerUseCase {
  final ISupportRepository _repository;

  SubmitVolunteerUseCase(this._repository);

  Future<ResultDef<bool>> call(Volunteer volunteer) =>
      _repository.submitVolunteer(volunteer);
}
