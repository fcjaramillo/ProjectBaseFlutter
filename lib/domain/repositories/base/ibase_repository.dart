part of '../repositories.dart';

abstract class IBaseRepository {
  Future<ResultDef<bool>> getExample();
}
