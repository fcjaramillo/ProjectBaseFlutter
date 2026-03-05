part of 'repositories.dart';

class StrategicAxesRepository implements IStrategicAxesRepository {
  @override
  Future<ResultDef<List<StrategicAxis>>> getStrategicAxes() =>
      StrategicAxesDataSource.getStrategicAxes();
}
