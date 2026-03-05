part of 'home.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() => HomeState.initial();

  Future<void> loadHomeData() async {
    state = state.copyWith(isLoading: true);

    await Future.wait(<Future<void>>[
      _loadEvents(),
      _loadNews(),
    ]);

    state = state.copyWith(isLoading: false);
  }

  Future<void> _loadEvents() async {
    final ResultDef<List<CampaignEvent>> result =
        await ref.read(getFeaturedEventsUseCaseProvider).call();
    result.when(
      fail: (BackError e) {
        state = state.copyWith(error: e.description);
      },
      success: (List<CampaignEvent> events) {
        state = state.copyWith(featuredEvents: events);
      },
    );
  }

  Future<void> _loadNews() async {
    final ResultDef<List<CampaignNews>> result =
        await ref.read(getFeaturedNewsUseCaseProvider).call();
    result.when(
      fail: (BackError e) {
        state = state.copyWith(error: e.description);
      },
      success: (List<CampaignNews> news) {
        state = state.copyWith(featuredNews: news);
      },
    );
  }
}
