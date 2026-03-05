part of 'dependencies.dart';

@riverpod
GetEndorsementsUseCase getEndorsementsUseCase(Ref ref) =>
    GetEndorsementsUseCase(ref.read(endorsementsRepositoryProvider));

@riverpod
GetFeaturedEndorsementsUseCase getFeaturedEndorsementsUseCase(Ref ref) =>
    GetFeaturedEndorsementsUseCase(
      ref.read(endorsementsRepositoryProvider),
    );
