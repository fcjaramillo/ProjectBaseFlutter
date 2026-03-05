part of 'support_screen.dart';

class SupportState {
  SupportState({
    required this.isLoading,
    required this.isSent,
    this.error,
    this.uiEvent,
  });

  final bool isLoading;
  final bool isSent;
  final String? error;
  final dynamic uiEvent;

  factory SupportState.initial() => SupportState(
        isLoading: false,
        isSent: false,
      );

  SupportState copyWith({
    bool? isLoading,
    bool? isSent,
    String? error,
    dynamic uiEvent,
    bool clearError = false,
    bool clearUiEvent = false,
  }) =>
      SupportState(
        isLoading: isLoading ?? this.isLoading,
        isSent: isSent ?? this.isSent,
        error: clearError ? null : error ?? this.error,
        uiEvent: clearUiEvent ? null : uiEvent ?? this.uiEvent,
      );
}
