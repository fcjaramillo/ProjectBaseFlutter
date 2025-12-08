part of 'data_sources.dart';

class BaseDataSource {
  BaseDataSource(this._apiUtils);

  final ApiUtils _apiUtils;

  Future<ResultDef<bool>> getExample() async {
    const String path = '/rickandmortyapi.com/api/character';

    ResultDef<dynamic> result = await _apiUtils.makeRequest(
      method: MethodApi.get,
      path: path,
    );

    return result.when(
      fail: Fail.new,
      success: (dynamic success) => ResultDef<bool>.success(true),
    );
  }
}
