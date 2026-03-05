part of 'dependencies.dart';

@riverpod
GetCandidateInfoUseCase getCandidateInfoUseCase(Ref ref) =>
    GetCandidateInfoUseCase(ref.read(candidateRepositoryProvider));
