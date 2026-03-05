part of 'data_sources.dart';

class MediaDataSource {
  MediaDataSource._();

  static Future<ResultDef<List<MediaItem>>> getMedia({
    String? type,
  }) async {
    try {
      final List<Map<String, dynamic>> data;
      if (type != null) {
        data = await SupabaseDataSource.fetchWhere(
          SupabaseTables.media,
          column: 'type',
          value: type,
          orderBy: 'sort_order',
        );
      } else {
        data = await SupabaseDataSource.fetchAll(
          SupabaseTables.media,
          orderBy: 'sort_order',
        );
      }
      final List<MediaItem> items =
          data.map(MediaItem.fromJson).toList();
      return ResultDef<List<MediaItem>>.success(items);
    } catch (e) {
      return FailDef<List<MediaItem>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }

  static Future<ResultDef<List<MediaItem>>> getFeaturedMedia() async {
    try {
      final List<Map<String, dynamic>> data =
          await SupabaseDataSource.fetchFeatured(
        SupabaseTables.media,
        orderBy: 'sort_order',
      );
      final List<MediaItem> items =
          data.map(MediaItem.fromJson).toList();
      return ResultDef<List<MediaItem>>.success(items);
    } catch (e) {
      return FailDef<List<MediaItem>>(
        BackError(statusCode: 500, description: e.toString()),
      );
    }
  }
}
