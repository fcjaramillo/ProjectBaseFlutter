part of 'dependencies.dart';

@riverpod
GetFeaturedEventsUseCase getFeaturedEventsUseCase(Ref ref) =>
    GetFeaturedEventsUseCase(ref.read(homeRepositoryProvider));

@riverpod
GetFeaturedNewsUseCase getFeaturedNewsUseCase(Ref ref) =>
    GetFeaturedNewsUseCase(ref.read(homeRepositoryProvider));
