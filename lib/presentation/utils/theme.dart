part of 'utils.dart';

class ThemeDataUtil {
  static ThemeMode themeMode(ThemeDefault theme) {
    switch (theme) {
      case ThemeDefault.light:
        return ThemeMode.light;
      case ThemeDefault.dark:
        return ThemeMode.dark;
      case ThemeDefault.system:
        return ThemeMode.system;
    }
  }

  static int themeModeToIndex(ThemeMode theme) {
    switch (theme) {
      case ThemeMode.light:
        return 0;
      case ThemeMode.dark:
        return 1;
      case ThemeMode.system:
        return 2;
    }
  }

  static ThemeDefault indexToThemeDefault(int value) {
    switch (value) {
      case 0:
        return ThemeDefault.light;
      case 1:
        return ThemeDefault.dark;
      case 2:
        return ThemeDefault.system;
      default:
        return ThemeDefault.system;
    }
  }

  static Color? backgroundColor(ThemeDefault theme, ThemeData themeData) {
    CustomThemeColors customThemeColors =
        themeData.extension<CustomThemeColors>()!;
    switch (theme) {
      case ThemeDefault.light:
        return customThemeColors.light;
      case ThemeDefault.dark:
        return customThemeColors.dark;
      case ThemeDefault.system:
        return null;
    }
  }
}
