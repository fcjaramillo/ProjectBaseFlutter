part of 'territory_screen.dart';

class TerritoryState {
  TerritoryState({
    required this.communes,
    required this.isLoading,
    this.selectedCommuneId,
    this.error,
  });

  final List<Commune> communes;
  final bool isLoading;
  final String? selectedCommuneId;
  final String? error;

  Commune? get selectedCommune => selectedCommuneId != null
      ? communes.where((Commune c) => c.id == selectedCommuneId).firstOrNull
      : null;

  factory TerritoryState.initial() => TerritoryState(
        communes: <Commune>[],
        isLoading: false,
      );

  TerritoryState copyWith({
    List<Commune>? communes,
    bool? isLoading,
    String? selectedCommuneId,
    String? error,
    bool clearError = false,
    bool clearSelectedCommune = false,
  }) =>
      TerritoryState(
        communes: communes ?? this.communes,
        isLoading: isLoading ?? this.isLoading,
        selectedCommuneId: clearSelectedCommune
            ? null
            : selectedCommuneId ?? this.selectedCommuneId,
        error: clearError ? null : error ?? this.error,
      );
}
