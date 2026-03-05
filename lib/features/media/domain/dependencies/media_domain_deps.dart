part of 'dependencies.dart';

@riverpod
GetMediaUseCase getMediaUseCase(Ref ref) =>
    GetMediaUseCase(ref.read(mediaRepositoryProvider));

@riverpod
GetMediaByTypeUseCase getMediaByTypeUseCase(Ref ref) =>
    GetMediaByTypeUseCase(ref.read(mediaRepositoryProvider));
