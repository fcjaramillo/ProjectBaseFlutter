part of 'dependencies.dart';

@riverpod
class AccessTokenNotifier extends _$AccessTokenNotifier {
  @override
  String build() {
    String token = kEmptyString;
    if (kIsWeb) {
      //token = html.window.localStorage.getItem(kTokenKey) ?? kEmptyString;
    }
    return token;
  }

  void update(String value) {
    state = value;
  }

  void delete() {
    state = kEmptyString;
  }
}
