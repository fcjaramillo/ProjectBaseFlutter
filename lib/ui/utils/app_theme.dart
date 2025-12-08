part of 'utils.dart';

class AppTheme {
  static ThemeData appTheme({
    required bool isDark,
    required AppThemeColors colors,
    TextTheme? textTheme,
  }) => ThemeData(
    extensions: <ThemeExtension<dynamic>>[
      colors,
      CustomThemeColors(
        dark: colors.neutralNoChange.strong,
        light: colors.neutralNoChange.subtle,
        transparent: const Color(0x00000000),
        success: colors.success.strong,
        successOpacity: colors.success.subtle,
        info: colors.informative.strong,
        infoOpacity: colors.informative.subtle,
        infoAccent: colors.informative.strong,
        warning: colors.warning.strong,
        warningOpacity: colors.warning.subtle,
        warningAccent: colors.warning.strong,
      ),
    ],
    colorScheme: ColorScheme(
      brightness: isDark ? Brightness.light : Brightness.dark,
      //
      primary: colors.primary.strong,
      primaryFixedDim: colors.primary.base,
      primaryFixed: colors.primary.soft,
      primaryContainer: colors.primary.subtle,
      onPrimary: colors.neutralNoChange.subtle,
      onPrimaryContainer: colors.neutralNoChange.strong,
      //
      secondary: colors.secondary.strong,
      secondaryFixedDim: colors.secondary.base,
      secondaryFixed: colors.secondary.soft,
      secondaryContainer: colors.secondary.subtle,
      onSecondary: colors.neutralNoChange.subtle,
      onSecondaryContainer: colors.neutralNoChange.strong,
      //
      tertiary: colors.tertiary.strong,
      tertiaryFixedDim: colors.tertiary.base,
      tertiaryFixed: colors.tertiary.soft,
      tertiaryContainer: colors.tertiary.subtle,
      onTertiary: colors.neutralNoChange.subtle,
      onTertiaryContainer: colors.neutralNoChange.strong,
      //
      error: colors.error.strong,
      errorContainer: colors.error.subtle,
      onError: colors.neutralNoChange.subtle,
      //
      outline: colors.border.scale.strong,
      outlineVariant: colors.border.scale.invert,
      //
      surfaceTint: colors.neutral.soft,
      //
      surfaceBright: colors.neutral.subtle,
      surface: colors.neutral.soft,
      surfaceDim: colors.neutral.base,
      //
      surfaceContainerLowest: colors.highContrast.skeleton,
      surfaceContainerLow: colors.highContrast.disabled,
      surfaceContainer: colors.highContrast.pressed,
      surfaceContainerHigh: colors.highContrast.hover,
      surfaceContainerHighest: colors.highContrast.defaultColor,
      //
      onSurface: colors.text.scale.strong,
      onSurfaceVariant: colors.text.scale.base,
      onInverseSurface: colors.text.scale.invert,
    ),
    shadowColor: colors.opacity.base,
    scaffoldBackgroundColor: colors.neutral.soft,
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: colors.neutral.soft,
      surfaceTintColor: colors.neutral.soft,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: colors.neutral.soft,
      surfaceTintColor: colors.neutral.soft,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: colors.neutral.soft,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: isDark ? colors.neutral.soft : colors.neutral.strong,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
      ),
    ),
    iconTheme: IconThemeData(color: colors.icon.scale.strong),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary.strong,
        overlayColor: colors.primary.base,
        foregroundColor: colors.neutralNoChange.subtle,
        disabledBackgroundColor: colors.highContrast.disabled,
        disabledForegroundColor: colors.neutralNoChange.strong,
        disabledIconColor: colors.neutralNoChange.strong,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Layout.spaceS),
        ),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: colors.button.contained.defaultColor,
        overlayColor: colors.highContrast.hover,
        foregroundColor: colors.button.text.defaultColor,
        disabledBackgroundColor: colors.button.contained.disabled,
        disabledForegroundColor: colors.button.text.disabled,
        disabledIconColor: colors.button.text.disabled,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Layout.spaceS),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: colors.lowContrast.defaultColor,
        overlayColor: colors.lowContrast.hover,
        foregroundColor: colors.neutralNoChange.strong,
        disabledBackgroundColor: colors.lowContrast.defaultColor,
        disabledForegroundColor: colors.neutralNoChange.subtle,
        disabledIconColor: colors.neutralNoChange.subtle,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Layout.spaceS),
        ),
        side: BorderSide(color: colors.border.scale.strong),
      ),
    ),
    textTheme: textTheme,
    primaryTextTheme: textTheme,
  );
}
