part of 'repositories.dart';

class VisionRepository implements ICityVisionRepository {
  @override
  Future<ResultDef<CityVision?>> getCityVision() =>
      VisionDataSource.getCityVision();
}
