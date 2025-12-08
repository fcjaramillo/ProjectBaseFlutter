part of '../entities.dart';

class UIEvent<T> {
  final UIEventType type;
  final String? name;
  final FutureOr<T?> Function(BuildContext)? function;
  final FutureOr<void> Function(dynamic)? returnFunction;
  final String? route;

  UIEvent(
    this.type, {
    this.name,
    this.function,
    this.returnFunction,
    this.route,
  });

  factory UIEvent.loading() => UIEvent<T>(UIEventType.loading);
  factory UIEvent.hideLoading() => UIEvent<T>(UIEventType.hideLoading);
  factory UIEvent.run({
    required FutureOr<T?> Function(BuildContext) function,
    FutureOr<void> Function(dynamic)? returnFunction,
    UIEventType type = UIEventType.run,
  }) =>
      UIEvent<T>(
        type,
        function: function,
        returnFunction: returnFunction,
      );
  factory UIEvent.navigate({
    required String route,
    UIEventType type = UIEventType.navigate,
  }) =>
      UIEvent<T>(type, route: route);
  factory UIEvent.pop() => UIEvent<T>(UIEventType.pop);
}
