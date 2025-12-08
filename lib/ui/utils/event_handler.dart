part of './utils.dart';

abstract class UIEventHandler {
  const UIEventHandler();

  static FutureOr<T?> handleEvent<T>(
    BuildContext context,
    UIEvent<T>? event,
    UIEvent<T>? oldEvent,
  ) async {
    if (event == null) {
      return Future<T?>.value();
    }
    switch (event.type) {
      case UIEventType.loading:
        _showLoading(context, event, oldEvent);
        return Future<T?>.value();

      case UIEventType.hideLoading:
        _hideLoading(context, oldEvent);
        return Future<T?>.value();

      case UIEventType.run:
        _hideLoading(context, oldEvent);
        return _run(context, event, event.function!);

      case UIEventType.navigate:
        _hideLoading(context, oldEvent);
        _navigateTo(context, event);

      case UIEventType.pop:
        _pop(context);
    }

    return Future<T?>.value();
  }

  static Future<T?> _showLoading<T>(
    BuildContext context,
    UIEvent<T> event,
    UIEvent<T>? oldEvent,
  ) async {
    if (oldEvent != event) {
      showGeneralDialog(
        context: context,
        barrierColor: Theme.of(
          context,
        ).colorScheme.surfaceContainerLowest.withValues(alpha: 0.5),
        pageBuilder: (_, _, _) => const BaseDefaultLoader(),
      );
    }
    return Future<T?>.value();
  }

  static void _hideLoading<T>(BuildContext context, UIEvent<T>? event) {
    if (event?.type == UIEventType.loading) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static Future<T?> _run<T>(
    BuildContext context,
    UIEvent<T> event,
    FutureOr<T?> Function(BuildContext) launch,
  ) async => launch.call(context);

  static Future<T?> _navigateTo<T>(BuildContext context, UIEvent<T> event) =>
      context.pushNamed<T>(event.route!);

  static void _pop<T>(BuildContext context) {
    context.pop(T);
  }
}
