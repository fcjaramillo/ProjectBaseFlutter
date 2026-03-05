part of 'repositories.dart';

abstract class IMediaRepository {
  Future<ResultDef<List<MediaItem>>> getMedia({String? type});
  Future<ResultDef<List<MediaItem>>> getFeaturedMedia();
}
