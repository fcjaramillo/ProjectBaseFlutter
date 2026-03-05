part of 'commune_detail_screen.dart';

class CommuneDetailState {
  CommuneDetailState({
    required this.isLoading,
    this.commune,
    this.error,
  });

  final Commune? commune;
  final bool isLoading;
  final String? error;

  factory CommuneDetailState.initial() => CommuneDetailState(
        isLoading: false,
      );

  CommuneDetailState copyWith({
    Commune? commune,
    bool? isLoading,
    String? error,
    bool clearError = false,
  }) =>
      CommuneDetailState(
        commune: commune ?? this.commune,
        isLoading: isLoading ?? this.isLoading,
        error: clearError ? null : error ?? this.error,
      );
}
