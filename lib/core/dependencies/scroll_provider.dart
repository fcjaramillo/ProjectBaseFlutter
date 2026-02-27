import 'package:flutter/material.dart' show ScrollController;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<ScrollController> appScrollControllerProvider =
    Provider<ScrollController>((Ref ref) {
  final ScrollController controller = ScrollController();
  ref.onDispose(controller.dispose);
  return controller;
});
