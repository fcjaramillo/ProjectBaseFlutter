part of 'use_cases.dart';

class GetCityVisionUseCase {
  GetCityVisionUseCase(this._repository);

  final ICityVisionRepository _repository;

  Future<ResultDef<CityVision?>> call() => _repository.getCityVision();
}
