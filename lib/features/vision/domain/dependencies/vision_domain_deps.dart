part of 'dependencies.dart';

@riverpod
GetCityVisionUseCase getCityVisionUseCase(Ref ref) =>
    GetCityVisionUseCase(ref.read(visionRepositoryProvider));
