part of 'use_cases.dart';

class GetMediaUseCase {
  final IMediaRepository _repository;

  GetMediaUseCase(this._repository);

  Future<ResultDef<List<MediaItem>>> call() =>
      _repository.getMedia();
}
