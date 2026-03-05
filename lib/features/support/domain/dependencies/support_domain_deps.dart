part of 'dependencies.dart';

@riverpod
SubmitVolunteerUseCase submitVolunteerUseCase(Ref ref) =>
    SubmitVolunteerUseCase(ref.read(supportRepositoryProvider));
