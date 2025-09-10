part of 'utils.dart';

class ThemeColors {
  ThemeColors({
    required this.dark,
    required this.light,
    required this.transparent,
    required this.success,
    required this.successOpacity,
    required this.info,
    required this.infoOpacity,
    required this.infoAccent,
    required this.warning,
    required this.warningOpacity,
    required this.warningAccent,
    required this.primary,
    required this.primaryFixedDim,
    required this.primaryFixed,
    required this.primaryContainer,
    required this.onPrimary,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.secondaryFixedDim,
    required this.secondaryFixed,
    required this.secondaryContainer,
    required this.onSecondary,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.tertiaryFixedDim,
    required this.tertiaryFixed,
    required this.tertiaryContainer,
    required this.onTertiary,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.outline,
    required this.outlineVariant,
    required this.surfaceTint,
    required this.surfaceBright,
    required this.surface,
    required this.surfaceContainerHighest,
    required this.surfaceDim,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.onSurface,
    required this.onSurfaceVariant,
    required this.onInverseSurface,
    required this.shadowColor,
    required this.scaffoldBackgroundColor,
  });

  final Color dark;
  final Color light;
  final Color transparent;
  final Color success;
  final Color successOpacity;
  final Color info;
  final Color infoOpacity;
  final Color infoAccent;
  final Color warning;
  final Color warningOpacity;
  final Color warningAccent;
  final Color primary;
  final Color primaryFixedDim;
  final Color primaryFixed;
  final Color primaryContainer;
  final Color onPrimary;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color secondaryFixedDim;
  final Color secondaryFixed;
  final Color secondaryContainer;
  final Color onSecondary;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color tertiaryFixedDim;
  final Color tertiaryFixed;
  final Color tertiaryContainer;
  final Color onTertiary;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color outline;
  final Color outlineVariant;
  final Color surfaceTint;
  final Color surfaceBright;
  final Color surface;
  final Color surfaceContainerHighest;
  final Color surfaceDim;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color onSurface;
  final Color onSurfaceVariant;
  final Color onInverseSurface;
  final Color shadowColor;
  final Color scaffoldBackgroundColor;

  ThemeColors copyWith({
    Color? dark,
    Color? light,
    Color? transparent,
    Color? success,
    Color? successOpacity,
    Color? info,
    Color? infoOpacity,
    Color? infoAccent,
    Color? warning,
    Color? warningOpacity,
    Color? warningAccent,
    Color? primary,
    Color? primaryFixedDim,
    Color? primaryFixed,
    Color? primaryContainer,
    Color? onPrimary,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? secondaryFixedDim,
    Color? secondaryFixed,
    Color? secondaryContainer,
    Color? onSecondary,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? tertiaryFixedDim,
    Color? tertiaryFixed,
    Color? tertiaryContainer,
    Color? onTertiary,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? outline,
    Color? outlineVariant,
    Color? surfaceTint,
    Color? surfaceBright,
    Color? surface,
    Color? surfaceContainerHighest,
    Color? surfaceDim,
    Color? surfaceContainerLowest,
    Color? surfaceContainerLow,
    Color? surfaceContainer,
    Color? surfaceContainerHigh,
    Color? onSurface,
    Color? onSurfaceVariant,
    Color? onInverseSurface,
    Color? shadowColor,
    Color? scaffoldBackgroundColor,
  }) =>
      ThemeColors(
        dark: dark ?? this.dark,
        light: light ?? this.light,
        transparent: transparent ?? this.transparent,
        success: success ?? this.success,
        successOpacity: successOpacity ?? this.successOpacity,
        info: info ?? this.info,
        infoOpacity: infoOpacity ?? this.infoOpacity,
        infoAccent: infoAccent ?? this.infoAccent,
        warning: warning ?? this.warning,
        warningOpacity: warningOpacity ?? this.warningOpacity,
        warningAccent: warningAccent ?? this.warningAccent,
        primary: primary ?? this.primary,
        primaryFixedDim: primaryFixedDim ?? this.primaryFixedDim,
        primaryFixed: primaryFixed ?? this.primaryFixed,
        primaryContainer: primaryContainer ?? this.primaryContainer,
        onPrimary: onPrimary ?? this.onPrimary,
        onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
        secondary: secondary ?? this.secondary,
        secondaryFixedDim: secondaryFixedDim ?? this.secondaryFixedDim,
        secondaryFixed: secondaryFixed ?? this.secondaryFixed,
        secondaryContainer: secondaryContainer ?? this.secondaryContainer,
        onSecondary: onSecondary ?? this.onSecondary,
        onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
        tertiary: tertiary ?? this.tertiary,
        tertiaryFixedDim: tertiaryFixedDim ?? this.tertiaryFixedDim,
        tertiaryFixed: tertiaryFixed ?? this.tertiaryFixed,
        tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
        onTertiary: onTertiary ?? this.onTertiary,
        onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
        error: error ?? this.error,
        onError: onError ?? this.onError,
        errorContainer: errorContainer ?? this.errorContainer,
        outline: outline ?? this.outline,
        outlineVariant: outlineVariant ?? this.outlineVariant,
        surfaceTint: surfaceTint ?? this.surfaceTint,
        surfaceBright: surfaceBright ?? this.surfaceBright,
        surface: surface ?? this.surface,
        surfaceContainerHighest:
            surfaceContainerHighest ?? this.surfaceContainerHighest,
        surfaceDim: surfaceDim ?? this.surfaceDim,
        surfaceContainerLowest:
            surfaceContainerLowest ?? this.surfaceContainerLowest,
        surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
        surfaceContainer: surfaceContainer ?? this.surfaceContainer,
        surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
        onSurface: onSurface ?? this.onSurface,
        onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
        onInverseSurface: onInverseSurface ?? this.onInverseSurface,
        shadowColor: shadowColor ?? this.shadowColor,
        scaffoldBackgroundColor:
            scaffoldBackgroundColor ?? this.scaffoldBackgroundColor,
      );

  static ThemeData appTheme({
    required bool isDark,
    required ThemeColors colors,
    TextTheme? textTheme,
  }) =>
      ThemeData(
        extensions: <CustomThemeColors>[
          CustomThemeColors(
            dark: colors.dark,
            light: colors.light,
            transparent: colors.transparent,
            success: colors.success,
            successOpacity: colors.successOpacity,
            info: colors.info,
            infoOpacity: colors.infoOpacity,
            infoAccent: colors.infoAccent,
            warning: colors.warning,
            warningOpacity: colors.warningOpacity,
            warningAccent: colors.warningAccent,
          ),
        ],
        colorScheme: ColorScheme(
          brightness: isDark ? Brightness.light : Brightness.dark,
          //
          primary: colors.primary,
          primaryFixedDim: colors.primaryFixedDim,
          primaryFixed: colors.primaryFixed,
          primaryContainer: colors.primaryContainer,
          onPrimary: colors.onPrimary,
          onPrimaryContainer: colors.onPrimaryContainer,
          //
          secondary: colors.secondary,
          secondaryFixedDim: colors.secondaryFixedDim,
          secondaryFixed: colors.secondaryFixed,
          secondaryContainer: colors.secondaryContainer,
          onSecondary: colors.onSecondary,
          onSecondaryContainer: colors.onSecondaryContainer,
          //
          tertiary: colors.tertiary,
          tertiaryFixedDim: colors.tertiaryFixedDim,
          tertiaryFixed: colors.tertiaryFixed,
          tertiaryContainer: colors.tertiaryContainer,
          onTertiary: colors.onTertiary,
          onTertiaryContainer: colors.onTertiaryContainer,
          //
          error: colors.error,
          onError: colors.onError,
          errorContainer: colors.errorContainer,
          //
          outline: colors.outline,
          outlineVariant: colors.outlineVariant,
          //
          surfaceTint: colors.surfaceTint,
          //
          surfaceBright: colors.surfaceBright,
          surface: colors.surface,
          surfaceDim: colors.surfaceDim,
          //
          surfaceContainerLowest: colors.surfaceContainerLowest,
          surfaceContainerLow: colors.surfaceContainerLow,
          surfaceContainer: colors.surfaceContainer,
          surfaceContainerHigh: colors.surfaceContainerHigh,
          surfaceContainerHighest: colors.surfaceContainerHighest,
          //
          onSurface: colors.onSurface,
          onSurfaceVariant: colors.onSurfaceVariant,
          onInverseSurface: colors.onInverseSurface,
        ),
        shadowColor: colors.shadowColor,
        scaffoldBackgroundColor: colors.scaffoldBackgroundColor,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: colors.surface,
          surfaceTintColor: colors.surface,
        ),
        dialogTheme: DialogThemeData(
          backgroundColor: colors.surface,
          surfaceTintColor: colors.surface,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: colors.surface,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: isDark ? colors.surface : colors.onPrimary,
            statusBarIconBrightness:
                isDark ? Brightness.light : Brightness.dark,
            statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
          ),
        ),
        iconTheme: IconThemeData(
          color: colors.onSurface,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: colors.primary,
            foregroundColor: colors.surfaceBright,
            disabledBackgroundColor: colors.surfaceContainerLow,
            disabledForegroundColor: colors.surfaceContainer,
            disabledIconColor: colors.surfaceContainer,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Layout.spaceS),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: colors.onSurface,
            foregroundColor: colors.surfaceBright,
            disabledBackgroundColor: colors.surfaceContainerLow,
            disabledForegroundColor: colors.surfaceContainer,
            disabledIconColor: colors.surfaceContainer,
            elevation: 0,
            overlayColor: colors.onSurface.withValues(alpha: 0.2),
            shadowColor: colors.onSurface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Layout.spaceS),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            backgroundColor: colors.transparent,
            foregroundColor: colors.onSurface,
            disabledForegroundColor: colors.surfaceContainer,
            disabledIconColor: colors.surfaceContainer,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Layout.spaceS),
            ),
            side: BorderSide(
              color: colors.outline,
            ),
          ),
        ),
        textTheme: textTheme,
        primaryTextTheme: textTheme,
      );
}
