part of 'dependencies.dart';

@riverpod
GetStrategicAxesUseCase getStrategicAxesUseCase(Ref ref) =>
    GetStrategicAxesUseCase(ref.read(strategicAxesRepositoryProvider));
