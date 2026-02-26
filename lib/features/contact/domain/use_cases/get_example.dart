part of 'use_cases.dart';

class GetExampleUseCase {
  final IBaseRepository _iBaseRepository;

  GetExampleUseCase(this._iBaseRepository);

  Future<ResultDef<bool>> call() => _iBaseRepository.getExample();
}
