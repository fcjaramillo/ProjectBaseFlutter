part of 'home.dart';

class HomeState {
  HomeState({
    required this.isCorrectGet,
    required this.clicks,
  });

  final bool isCorrectGet;
  final int clicks;

  factory HomeState.initial() => HomeState(
        isCorrectGet: false,
        clicks: 0,
      );

  HomeState copyWith({
    bool? isCorrectGet,
    int? clicks,
  }) =>
      HomeState(
        isCorrectGet: isCorrectGet ?? this.isCorrectGet,
        clicks: clicks ?? this.clicks,
      );
}
