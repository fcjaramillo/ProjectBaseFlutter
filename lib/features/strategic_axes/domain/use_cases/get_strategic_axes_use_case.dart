part of 'use_cases.dart';

class GetStrategicAxesUseCase {
  final IStrategicAxesRepository _repository;

  GetStrategicAxesUseCase(this._repository);

  Future<ResultDef<List<StrategicAxis>>> call() =>
      _repository.getStrategicAxes();
}
