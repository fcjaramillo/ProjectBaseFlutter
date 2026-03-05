part of 'repositories.dart';

abstract class IStrategicAxesRepository {
  Future<ResultDef<List<StrategicAxis>>> getStrategicAxes();
}
