part of 'extensions.dart';

extension CHChipExtension on ChipType {
  Color backgroundColor(ThemeData theme, {bool? selected}) {
    CustomThemeColors customThemeColors = theme.extension<CustomThemeColors>()!;
    switch (this) {
      case ChipType.generic:
        return theme.colorScheme.surfaceBright;
      case ChipType.error:
        return theme.colorScheme.errorContainer;
      case ChipType.success:
        return customThemeColors.successOpacity;
      case ChipType.info:
        return customThemeColors.infoOpacity;
      case ChipType.pending:
        return customThemeColors.warningOpacity;
      case ChipType.selection:
        if (selected ?? false) {
          return theme.colorScheme.onSurface;
        } else {
          return customThemeColors.transparent;
        }
      case ChipType.status:
        if (selected ?? false) {
          return customThemeColors.successOpacity;
        } else {
          return theme.colorScheme.errorContainer;
        }
      case ChipType.gradient:
        return customThemeColors.transparent;
    }
  }

  Color borderColor(ThemeData theme, {bool? selected}) {
    CustomThemeColors customThemeColors = theme.extension<CustomThemeColors>()!;
    switch (this) {
      case ChipType.generic:
        return theme.colorScheme.outline;
      case ChipType.error:
        return theme.colorScheme.error;
      case ChipType.success:
        return customThemeColors.successOpacity;
      case ChipType.info:
        return customThemeColors.infoOpacity;
      case ChipType.pending:
        return customThemeColors.warningAccent;
      case ChipType.selection:
        return theme.colorScheme.outline;
      case ChipType.status:
        if (selected ?? false) {
          return customThemeColors.success;
        } else {
          return theme.colorScheme.error;
        }
      case ChipType.gradient:
        return customThemeColors.transparent;
    }
  }
}
