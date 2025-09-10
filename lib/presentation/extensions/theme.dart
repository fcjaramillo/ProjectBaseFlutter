part of 'extensions.dart';

extension AppThemeColorsExtension on ThemeData {
  AppThemeColors get appColors => extension<AppThemeColors>()!;
}

extension AppColorsExtension on AppThemeColors {
  Color get transparent => const Color(0x00000000);
}
