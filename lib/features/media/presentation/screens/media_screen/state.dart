part of 'media_screen.dart';

class MediaState {
  MediaState({
    required this.media,
    required this.isLoading,
    this.selectedType,
    this.error,
  });

  final List<MediaItem> media;
  final bool isLoading;
  final String? selectedType;
  final String? error;

  factory MediaState.initial() => MediaState(
        media: <MediaItem>[],
        isLoading: false,
      );

  List<MediaItem> get images =>
      media.where((MediaItem m) => m.type == MediaType.image).toList();

  List<MediaItem> get videos =>
      media.where((MediaItem m) => m.type == MediaType.video).toList();

  MediaState copyWith({
    List<MediaItem>? media,
    bool? isLoading,
    String? selectedType,
    String? error,
    bool clearError = false,
    bool clearSelectedType = false,
  }) =>
      MediaState(
        media: media ?? this.media,
        isLoading: isLoading ?? this.isLoading,
        selectedType: clearSelectedType
            ? null
            : selectedType ?? this.selectedType,
        error: clearError ? null : error ?? this.error,
      );
}
