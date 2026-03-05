part of 'repositories.dart';

abstract class ICityVisionRepository {
  Future<ResultDef<CityVision?>> getCityVision();
}
