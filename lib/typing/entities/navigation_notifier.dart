part of 'entities.dart';

class NavigatorNotifier extends ChangeNotifier {
  MapJson? _payload;
  bool _isLogOut = false;

  MapJson? get payload => _payload;
  bool get isLogOut => _isLogOut;

  void navigateTo(MapJson payload) {
    _payload = payload;
    notifyListeners();

    Future<void>.microtask(() {
      _payload = null;
    });
  }

  void logOut() {
    _isLogOut = true;
    notifyListeners();

    Future<void>.microtask(() {
      _isLogOut = false;
    });
  }
}
