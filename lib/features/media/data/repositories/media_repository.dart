part of 'repositories.dart';

class MediaRepository implements IMediaRepository {
  @override
  Future<ResultDef<List<MediaItem>>> getMedia({String? type}) =>
      MediaDataSource.getMedia(type: type);

  @override
  Future<ResultDef<List<MediaItem>>> getFeaturedMedia() =>
      MediaDataSource.getFeaturedMedia();
}
