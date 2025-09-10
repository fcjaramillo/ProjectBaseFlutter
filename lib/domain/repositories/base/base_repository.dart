part of '../repositories.dart';

class BaseRepository implements IBaseRepository {
  BaseRepository(
    this._baseDataSource,
  );

  final BaseDataSource _baseDataSource;

  @override
  Future<ResultDef<bool>> getExample() async {
    final ResultDef<bool> result = await _baseDataSource.getExample();

    return result.when(
      fail: Fail.new,
      success: (bool success) => ResultDef<bool>.success(true),
    );
  }
}
