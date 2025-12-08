part of 'enums.dart';

enum FeedbackBottomSheetType {
  success,
  error,
  warning,
  info,
  wait;

  IconData get icon => switch (this) {
    FeedbackBottomSheetType.success => Icons.check,
    FeedbackBottomSheetType.error => Icons.close,
    FeedbackBottomSheetType.warning => Icons.warning_amber_outlined,
    FeedbackBottomSheetType.info => Icons.info_outline,
    FeedbackBottomSheetType.wait => Icons.watch_later_outlined,
  };

  Color color(AppThemeColors theme) => switch (this) {
    FeedbackBottomSheetType.success => theme.success.strong,
    FeedbackBottomSheetType.error => theme.error.strong,
    FeedbackBottomSheetType.warning => theme.warning.strong,
    FeedbackBottomSheetType.info => theme.informative.strong,
    FeedbackBottomSheetType.wait => theme.informative.strong,
  };
}
