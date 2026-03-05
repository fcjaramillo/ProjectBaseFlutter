part of 'home.dart';

class HomeState {
  HomeState({
    this.featuredEvents = const <CampaignEvent>[],
    this.featuredNews = const <CampaignNews>[],
    this.isLoading = false,
    this.error,
  });

  final List<CampaignEvent> featuredEvents;
  final List<CampaignNews> featuredNews;
  final bool isLoading;
  final String? error;

  factory HomeState.initial() => HomeState();

  HomeState copyWith({
    List<CampaignEvent>? featuredEvents,
    List<CampaignNews>? featuredNews,
    bool? isLoading,
    String? error,
  }) =>
      HomeState(
        featuredEvents: featuredEvents ?? this.featuredEvents,
        featuredNews: featuredNews ?? this.featuredNews,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
      );
}
