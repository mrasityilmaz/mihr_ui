import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Semantic foreground color tokens as a [ThemeExtension].
///
/// For non-text foreground elements: icons, indicators, dots, arrows.
/// Can be applied via `color`, `fill`, or `stroke` in any context.
///
/// Access via context:
/// ```dart
/// final fgColors = Theme.of(context).extension<ForegroundColors>()!;
/// Icon(Icons.check, color: fgColors.brandPrimary);
/// ```
class ForegroundColors extends ThemeExtension<ForegroundColors> {
  /// Creates a [ForegroundColors] with all semantic foreground tokens.
  const ForegroundColors({
    required this.primary,
    required this.secondary,
    required this.secondaryHover,
    required this.tertiary,
    required this.tertiaryHover,
    required this.quaternary,
    required this.quaternaryHover,
    required this.white,
    required this.disabled,
    required this.disabledSubtle,
    required this.brandPrimary,
    required this.brandPrimaryAlt,
    required this.brandSecondary,
    required this.brandSecondaryAlt,
    required this.brandSecondaryHover,
    required this.errorPrimary,
    required this.errorSecondary,
    required this.warningPrimary,
    required this.warningSecondary,
    required this.successPrimary,
    required this.successSecondary,
  });

  /// Light mode foreground colors.
  factory ForegroundColors.light({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.gray,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return ForegroundColors(
      primary: gray.shade900,
      secondary: gray.shade700,
      secondaryHover: gray.shade800,
      tertiary: gray.shade600,
      tertiaryHover: gray.shade700,
      quaternary: gray.shade400,
      quaternaryHover: gray.shade500,
      white: MihrColors.white,
      disabled: gray.shade400,
      disabledSubtle: gray.shade300,
      brandPrimary: brand.shade600,
      brandPrimaryAlt: brand.shade600,
      brandSecondary: brand.shade500,
      brandSecondaryAlt: brand.shade500,
      brandSecondaryHover: brand.shade600,
      errorPrimary: error.shade600,
      errorSecondary: error.shade500,
      warningPrimary: warning.shade600,
      warningSecondary: warning.shade500,
      successPrimary: success.shade600,
      successSecondary: success.shade500,
    );
  }

  /// Dark mode foreground colors.
  factory ForegroundColors.dark({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.grayDark,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return ForegroundColors(
      primary: MihrColors.white,
      secondary: gray.shade300,
      secondaryHover: gray.shade200,
      tertiary: gray.shade400,
      tertiaryHover: gray.shade300,
      quaternary: gray.shade600,
      quaternaryHover: gray.shade500,
      white: MihrColors.white,
      disabled: gray.shade500,
      disabledSubtle: gray.shade600,
      brandPrimary: brand.shade500,
      brandPrimaryAlt: gray.shade300,
      brandSecondary: brand.shade500,
      brandSecondaryAlt: gray.shade600,
      brandSecondaryHover: gray.shade500,
      errorPrimary: error.shade500,
      errorSecondary: error.shade400,
      warningPrimary: warning.shade500,
      warningSecondary: warning.shade400,
      successPrimary: success.shade500,
      successSecondary: success.shade400,
    );
  }

  /// Highest contrast foreground — primary icons
  final Color primary;

  /// High contrast foreground — secondary icons
  final Color secondary;

  /// Secondary hover state
  final Color secondaryHover;

  /// Medium contrast foreground — supporting icons
  final Color tertiary;

  /// Tertiary hover state
  final Color tertiaryHover;

  /// Low contrast foreground — button icons, help icons, input icons
  final Color quaternary;

  /// Quaternary hover state
  final Color quaternaryHover;

  /// Always white foreground
  final Color white;

  /// Disabled foreground — disabled button group icons, dropdown items
  final Color disabled;

  /// Subtle disabled — disabled active checkboxes
  final Color disabledSubtle;

  /// Brand primary foreground — featured icons, progress bars
  final Color brandPrimary;

  /// Brand primary alt — switches to gray in dark mode (active tabs)
  final Color brandPrimaryAlt;

  /// Brand secondary foreground — accents, arrows in marketing
  final Color brandSecondary;

  /// Brand secondary alt — switches to gray in dark mode (brand buttons)
  final Color brandSecondaryAlt;

  /// Brand secondary hover state
  final Color brandSecondaryHover;

  /// Error primary foreground — error featured icons
  final Color errorPrimary;

  /// Error secondary — error input icons, negative metrics
  final Color errorSecondary;

  /// Warning primary foreground — warning featured icons
  final Color warningPrimary;

  /// Warning secondary foreground
  final Color warningSecondary;

  /// Success primary foreground — success featured icons
  final Color successPrimary;

  /// Success secondary — button dots, avatar online dots, positive metrics
  final Color successSecondary;

  /// Creates a copy with the given fields replaced.
  @override
  ForegroundColors copyWith({
    Color? primary,
    Color? secondary,
    Color? secondaryHover,
    Color? tertiary,
    Color? tertiaryHover,
    Color? quaternary,
    Color? quaternaryHover,
    Color? white,
    Color? disabled,
    Color? disabledSubtle,
    Color? brandPrimary,
    Color? brandPrimaryAlt,
    Color? brandSecondary,
    Color? brandSecondaryAlt,
    Color? brandSecondaryHover,
    Color? errorPrimary,
    Color? errorSecondary,
    Color? warningPrimary,
    Color? warningSecondary,
    Color? successPrimary,
    Color? successSecondary,
  }) {
    return ForegroundColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      tertiary: tertiary ?? this.tertiary,
      tertiaryHover: tertiaryHover ?? this.tertiaryHover,
      quaternary: quaternary ?? this.quaternary,
      quaternaryHover: quaternaryHover ?? this.quaternaryHover,
      white: white ?? this.white,
      disabled: disabled ?? this.disabled,
      disabledSubtle: disabledSubtle ?? this.disabledSubtle,
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandPrimaryAlt: brandPrimaryAlt ?? this.brandPrimaryAlt,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandSecondaryAlt: brandSecondaryAlt ?? this.brandSecondaryAlt,
      brandSecondaryHover: brandSecondaryHover ?? this.brandSecondaryHover,
      errorPrimary: errorPrimary ?? this.errorPrimary,
      errorSecondary: errorSecondary ?? this.errorSecondary,
      warningPrimary: warningPrimary ?? this.warningPrimary,
      warningSecondary: warningSecondary ?? this.warningSecondary,
      successPrimary: successPrimary ?? this.successPrimary,
      successSecondary: successSecondary ?? this.successSecondary,
    );
  }

  /// Linearly interpolates between two [ForegroundColors] instances.
  @override
  ForegroundColors lerp(ForegroundColors? other, double t) {
    if (other is! ForegroundColors) return this;
    return ForegroundColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      tertiaryHover: Color.lerp(tertiaryHover, other.tertiaryHover, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
      quaternaryHover: Color.lerp(quaternaryHover, other.quaternaryHover, t)!,
      white: Color.lerp(white, other.white, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      disabledSubtle: Color.lerp(disabledSubtle, other.disabledSubtle, t)!,
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandPrimaryAlt: Color.lerp(brandPrimaryAlt, other.brandPrimaryAlt, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandSecondaryAlt: Color.lerp(
        brandSecondaryAlt,
        other.brandSecondaryAlt,
        t,
      )!,
      brandSecondaryHover: Color.lerp(
        brandSecondaryHover,
        other.brandSecondaryHover,
        t,
      )!,
      errorPrimary: Color.lerp(errorPrimary, other.errorPrimary, t)!,
      errorSecondary: Color.lerp(errorSecondary, other.errorSecondary, t)!,
      warningPrimary: Color.lerp(warningPrimary, other.warningPrimary, t)!,
      warningSecondary: Color.lerp(
        warningSecondary,
        other.warningSecondary,
        t,
      )!,
      successPrimary: Color.lerp(successPrimary, other.successPrimary, t)!,
      successSecondary: Color.lerp(
        successSecondary,
        other.successSecondary,
        t,
      )!,
    );
  }
}
