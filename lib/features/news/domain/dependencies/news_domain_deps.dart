part of 'dependencies.dart';

@riverpod
GetNewsUseCase getNewsUseCase(Ref ref) =>
    GetNewsUseCase(ref.read(newsRepositoryProvider));

@riverpod
GetNewsByIdUseCase getNewsByIdUseCase(Ref ref) =>
    GetNewsByIdUseCase(ref.read(newsRepositoryProvider));

@riverpod
GetNewsByCategoryUseCase getNewsByCategoryUseCase(Ref ref) =>
    GetNewsByCategoryUseCase(ref.read(newsRepositoryProvider));

@riverpod
GetFeaturedNewsUseCase getFeaturedNewsUseCase(Ref ref) =>
    GetFeaturedNewsUseCase(ref.read(newsRepositoryProvider));
