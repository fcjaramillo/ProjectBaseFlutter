part of 'home.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  HomeState build() => HomeState.initial();

  void initState() {}
  Future<void> getExample() async {
    final ResultDef<bool> result =
        await ref.read(getExampleUseCaseProvider).call();

    result.when(
      fail: print,
      success: (bool success) {
        state = state.copyWith(isCorrectGet: success);
      },
    );
  }

  void onTap() {
    state = state.copyWith(
      clicks: state.clicks + 1,
    );
  }
}
