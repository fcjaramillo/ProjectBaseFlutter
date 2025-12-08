part of 'routes.dart';

class AppRouter {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kRouteHome:
        return HomeScreen.goTo();
    }
    return null;
  }
}
