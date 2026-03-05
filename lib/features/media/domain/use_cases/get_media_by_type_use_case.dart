part of 'use_cases.dart';

class GetMediaByTypeUseCase {
  final IMediaRepository _repository;

  GetMediaByTypeUseCase(this._repository);

  Future<ResultDef<List<MediaItem>>> call(String type) =>
      _repository.getMedia(type: type);
}
