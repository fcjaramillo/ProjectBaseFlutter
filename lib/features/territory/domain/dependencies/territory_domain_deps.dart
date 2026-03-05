part of 'dependencies.dart';

@riverpod
GetCommunesUseCase getCommunesUseCase(Ref ref) =>
    GetCommunesUseCase(ref.read(territoryRepositoryProvider));

@riverpod
GetCommuneByIdUseCase getCommuneByIdUseCase(Ref ref) =>
    GetCommuneByIdUseCase(ref.read(territoryRepositoryProvider));
