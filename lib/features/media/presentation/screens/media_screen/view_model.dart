part of 'media_screen.dart';

@riverpod
class MediaViewModel extends _$MediaViewModel {
  @override
  MediaState build() => MediaState.initial();

  Future<void> loadMedia() async {
    state = state.copyWith(isLoading: true, clearError: true);

    final ResultDef<List<MediaItem>> result =
        await ref.read(getMediaUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al cargar los medios',
        );
      },
      success: (List<MediaItem> items) {
        state = state.copyWith(isLoading: false, media: items);
      },
    );
  }

  Future<void> filterByType(String? type) async {
    state = state.copyWith(
      isLoading: true,
      clearError: true,
      selectedType: type,
    );

    final ResultDef<List<MediaItem>> result = type != null
        ? await ref.read(getMediaByTypeUseCaseProvider).call(type)
        : await ref.read(getMediaUseCaseProvider).call();

    result.when(
      fail: (BackError error) {
        state = state.copyWith(
          isLoading: false,
          error: error.description ?? 'Error al filtrar medios',
        );
      },
      success: (List<MediaItem> items) {
        state = state.copyWith(isLoading: false, media: items);
      },
    );
  }
}
