part of 'contact_screen.dart';

class ContactState {
  ContactState({
    required this.isLoading,
    required this.isSent,
    this.error,
    this.uiEvent,
  });

  final bool isLoading;
  final bool isSent;
  final String? error;
  final dynamic uiEvent;

  factory ContactState.initial() => ContactState(
        isLoading: false,
        isSent: false,
      );

  ContactState copyWith({
    bool? isLoading,
    bool? isSent,
    String? error,
    dynamic uiEvent,
    bool clearError = false,
    bool clearUiEvent = false,
  }) =>
      ContactState(
        isLoading: isLoading ?? this.isLoading,
        isSent: isSent ?? this.isSent,
        error: clearError ? null : error ?? this.error,
        uiEvent: clearUiEvent ? null : uiEvent ?? this.uiEvent,
      );
}
