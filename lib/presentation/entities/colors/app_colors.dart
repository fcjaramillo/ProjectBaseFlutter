part of '../entities.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.success,
    required this.informative,
    required this.warning,
    required this.error,
    required this.neutral,
    required this.neutralNoChange,
    required this.opacity,
  });

  final ColorVariants primary;
  final ColorVariants secondary;
  final ColorVariants tertiary;
  final ColorVariants success;
  final ColorVariants informative;
  final ColorVariants warning;
  final ColorVariants error;
  final ColorVariants neutral;
  final ColorVariant neutralNoChange;
  final ColorVariants opacity;

  static AppColors initial() => AppColors(
        primary: ColorVariants.initial(),
        secondary: ColorVariants.initial(),
        tertiary: ColorVariants.initial(),
        success: ColorVariants.initial(),
        informative: ColorVariants.initial(),
        warning: ColorVariants.initial(),
        error: ColorVariants.initial(),
        neutral: ColorVariants.initial(),
        neutralNoChange: ColorVariant.initial(),
        opacity: ColorVariants.initial(),
      );

  AppThemeColors appThemeColors() => AppThemeColors(
        primary: ColorScale(
          strong: primary.v600,
          base: primary.v500,
          soft: primary.v400,
          subtle: primary.v50,
        ),
        secondary: ColorScale(
          strong: secondary.v600,
          base: secondary.v500,
          soft: secondary.v400,
          subtle: secondary.v50,
        ),
        tertiary: ColorScale(
          strong: tertiary.v600,
          base: tertiary.v500,
          soft: tertiary.v400,
          subtle: tertiary.v50,
        ),
        success: ColorContrast(
          strong: success.v700,
          subtle: success.v50,
        ),
        informative: ColorContrast(
          strong: informative.v500,
          subtle: informative.v50,
        ),
        warning: ColorContrast(
          strong: warning.v700,
          subtle: warning.v50,
        ),
        error: ColorContrast(
          strong: error.v600,
          subtle: error.v50,
        ),
        neutral: ColorScale(
          strong: neutral.v950,
          base: neutral.v200,
          soft: neutral.v100,
          subtle: neutral.v50,
        ),
        neutralNoChange: ColorContrast(
          strong: neutralNoChange.v950,
          subtle: neutralNoChange.v50,
        ),
        opacity: ColorBase(
          base: opacity.v600,
        ),
        highContrast: ColorStates(
          defaultColor: neutral.v950,
          hover: neutral.v700,
          pressed: neutral.v600,
          disabled: neutral.v300,
          skeleton: neutral.v200,
        ),
        lowContrast: ColorStates(
          defaultColor: neutral.v100,
          hover: neutral.v200,
          pressed: neutral.v300,
          disabled: neutral.v500,
          skeleton: neutral.v500,
        ),
        text: ColorForeground(
          scale: ColorScaleExtended(
            strong: neutral.v950,
            base: neutral.v800,
            soft: neutral.v700,
            subtle: neutral.v600,
            disabled: neutral.v500,
            invert: neutral.v50,
          ),
          noChange: ColorContrast(
            strong: neutralNoChange.v950,
            subtle: neutralNoChange.v50,
          ),
          main: ColorMains(
            primary: primary.v800,
            secondary: secondary.v600,
            tertiary: tertiary.v700,
          ),
          feedbacks: ColorFeedbacks(
            success: success.v700,
            warning: warning.v700,
            informative: informative.v500,
            error: error.v600,
          ),
        ),
        border: ColorForeground(
          scale: ColorScaleExtended(
            strong: neutral.v950,
            base: neutral.v800,
            soft: neutral.v500,
            subtle: neutral.v300,
            disabled: neutral.v300,
            invert: neutral.v50,
          ),
          noChange: ColorContrast(
            strong: neutralNoChange.v950,
            subtle: neutralNoChange.v50,
          ),
          main: ColorMains(
            primary: primary.v600,
            secondary: secondary.v600,
            tertiary: tertiary.v600,
          ),
          feedbacks: ColorFeedbacks(
            success: success.v700,
            informative: informative.v500,
            warning: warning.v700,
            error: error.v600,
          ),
        ),
        icon: ColorIconForeground(
          scale: ColorScaleSemiExtended(
            strong: neutral.v950,
            base: neutral.v800,
            soft: neutral.v600,
            disabled: neutral.v500,
            invert: neutral.v50,
          ),
          noChange: ColorContrast(
            strong: neutralNoChange.v950,
            subtle: neutralNoChange.v50,
          ),
          main: ColorMains(
            primary: primary.v600,
            secondary: secondary.v600,
            tertiary: tertiary.v600,
          ),
          feedbacks: ColorFeedbacks(
            success: success.v700,
            informative: informative.v500,
            warning: warning.v700,
            error: error.v600,
          ),
        ),
        button: ColorButton(
          containedContrast: ColorStates(
            defaultColor: primary.v600,
            hover: primary.v500,
            pressed: primary.v400,
            disabled: neutral.v300,
            skeleton: neutral.v200,
          ),
          contained: ColorStates(
            defaultColor: neutral.v950,
            hover: neutral.v700,
            pressed: neutral.v600,
            disabled: neutral.v300,
            skeleton: neutral.v200,
          ),
          outlined: ColorStates(
            defaultColor: neutral.v100,
            hover: neutral.v200,
            pressed: neutral.v300,
            disabled: neutral.v100,
            skeleton: neutral.v100,
          ),
          text: ColorStates(
            defaultColor: neutral.v100,
            hover: neutral.v200,
            pressed: neutral.v300,
            disabled: neutral.v100,
            skeleton: neutral.v100,
          ),
        ),
        searchBar: ColorSearchBar(
          defaultColor: neutral.v100,
          primaryHover: neutral.v200,
          secondaryHover: neutral.v300,
        ),
      );
}
