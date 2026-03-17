import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Semantic background color tokens as a [ThemeExtension].
///
/// Covers layout backgrounds, component fills, overlays, and
/// semantic state backgrounds (error, warning, success, brand).
///
/// Access via context:
/// ```dart
/// final bgColors = Theme.of(context).extension<BackgroundColors>()!;
/// Container(color: bgColors.primary);
/// ```
class BackgroundColors extends ThemeExtension<BackgroundColors> {

  /// Creates a [BackgroundColors] with all semantic background tokens.
  const BackgroundColors({
    required this.primary,
    required this.primarySolid,
    required this.primaryAlt,
    required this.primaryHover,
    required this.secondary,
    required this.secondarySolid,
    required this.secondarySubtle,
    required this.secondaryHover,
    required this.secondaryAlt,
    required this.tertiary,
    required this.quaternary,
    required this.active,
    required this.disabled,
    required this.disabledSubtle,
    required this.overlay,
    required this.brandPrimary,
    required this.brandPrimaryAlt,
    required this.brandSecondary,
    required this.brandSolid,
    required this.brandSolidHover,
    required this.brandSection,
    required this.brandSectionSubtle,
    required this.errorPrimary,
    required this.errorSecondary,
    required this.errorSolid,
    required this.errorSolidHover,
    required this.warningPrimary,
    required this.warningSecondary,
    required this.warningSolid,
    required this.successPrimary,
    required this.successSecondary,
    required this.successSolid,
  });

  /// Light mode background colors.
  factory BackgroundColors.light({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.gray,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return BackgroundColors(
      primary: MihrColors.white,
      primarySolid: gray.shade950,
      primaryAlt: MihrColors.white,
      primaryHover: gray.shade50,
      secondary: gray.shade50,
      secondarySolid: gray.shade600,
      secondarySubtle: gray.shade25,
      secondaryHover: gray.shade100,
      secondaryAlt: gray.shade50,
      tertiary: gray.shade100,
      quaternary: gray.shade200,
      active: gray.shade50,
      disabled: gray.shade100,
      disabledSubtle: gray.shade50,
      overlay: gray.shade950,
      brandPrimary: brand.shade50,
      brandPrimaryAlt: brand.shade50,
      brandSecondary: brand.shade100,
      brandSolid: brand.shade600,
      brandSolidHover: brand.shade700,
      brandSection: brand.shade800,
      brandSectionSubtle: brand.shade700,
      errorPrimary: error.shade50,
      errorSecondary: error.shade100,
      errorSolid: error.shade600,
      errorSolidHover: error.shade700,
      warningPrimary: warning.shade50,
      warningSecondary: warning.shade100,
      warningSolid: warning.shade600,
      successPrimary: success.shade50,
      successSecondary: success.shade100,
      successSolid: success.shade600,
    );
  }

  /// Dark mode background colors.
  factory BackgroundColors.dark({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.grayDark,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return BackgroundColors(
      primary: gray.shade950,
      primarySolid: gray.shade900,
      primaryAlt: gray.shade900,
      primaryHover: gray.shade800,
      secondary: gray.shade900,
      secondarySolid: gray.shade600,
      secondarySubtle: gray.shade900,
      secondaryHover: gray.shade800,
      secondaryAlt: gray.shade950,
      tertiary: gray.shade800,
      quaternary: gray.shade700,
      active: gray.shade800,
      disabled: gray.shade800,
      disabledSubtle: gray.shade900,
      overlay: gray.shade800,
      brandPrimary: brand.shade500,
      brandPrimaryAlt: gray.shade900,
      brandSecondary: brand.shade600,
      brandSolid: brand.shade600,
      brandSolidHover: brand.shade500,
      brandSection: gray.shade900,
      brandSectionSubtle: gray.shade950,
      errorPrimary: error.shade950,
      errorSecondary: error.shade600,
      errorSolid: error.shade600,
      errorSolidHover: error.shade500,
      warningPrimary: warning.shade950,
      warningSecondary: warning.shade600,
      warningSolid: warning.shade600,
      successPrimary: success.shade950,
      successSecondary: success.shade600,
      successSolid: success.shade600,
    );
  }
  /// Primary background — white in light, near-black in dark
  final Color primary;

  /// Primary solid — dark background for tooltips, etc.
  final Color primarySolid;

  /// Primary alt — switches to secondary in dark mode
  final Color primaryAlt;

  /// Primary hover — default hover for white-bg components
  final Color primaryHover;

  /// Secondary background — subtle contrast against primary (section bgs)
  final Color secondary;

  /// Secondary solid — mid-tone dark fill (featured icons)
  final Color secondarySolid;

  /// Secondary subtle — slightly lighter secondary
  final Color secondarySubtle;

  /// Secondary hover — hover on gray-50 bg components
  final Color secondaryHover;

  /// Secondary alt — switches to primary in dark mode
  final Color secondaryAlt;

  /// Tertiary background — stronger contrast (toggles)
  final Color tertiary;

  /// Quaternary background — even stronger contrast (sliders, progress)
  final Color quaternary;

  /// Active state background — selected items
  final Color active;

  /// Disabled background — disabled primary buttons, toggles
  final Color disabled;

  /// Disabled subtle — disabled inputs, checkboxes
  final Color disabledSubtle;

  /// Overlay background — modal overlays
  final Color overlay;

  /// Brand primary background — brand tinted (check icons)
  final Color brandPrimary;

  /// Brand primary alt — switches to secondary bg in dark mode
  final Color brandPrimaryAlt;

  /// Brand secondary — slightly stronger brand tint (featured icons)
  final Color brandSecondary;

  /// Brand solid — strong brand fill (toggles, messages)
  final Color brandSolid;

  /// Brand solid hover — hover state for brand solid
  final Color brandSolidHover;

  /// Brand section — dark brand bg for website sections (CTAs)
  final Color brandSection;

  /// Brand section subtle — lighter brand section bg (FAQ sections)
  final Color brandSectionSubtle;

  /// Error primary background — light error bg (error states)
  final Color errorPrimary;

  /// Error secondary — slightly stronger error bg (featured icons)
  final Color errorSecondary;

  /// Error solid — strong error fill (buttons)
  final Color errorSolid;

  /// Error solid hover
  final Color errorSolidHover;

  /// Warning primary background
  final Color warningPrimary;

  /// Warning secondary background (featured icons)
  final Color warningSecondary;

  /// Warning solid — strong warning fill
  final Color warningSolid;

  /// Success primary background
  final Color successPrimary;

  /// Success secondary background (featured icons)
  final Color successSecondary;

  /// Success solid — strong success fill
  final Color successSolid;

  /// Creates a copy with the given fields replaced.
  @override
  BackgroundColors copyWith({
    Color? primary,
    Color? primarySolid,
    Color? primaryAlt,
    Color? primaryHover,
    Color? secondary,
    Color? secondarySolid,
    Color? secondarySubtle,
    Color? secondaryHover,
    Color? secondaryAlt,
    Color? tertiary,
    Color? quaternary,
    Color? active,
    Color? disabled,
    Color? disabledSubtle,
    Color? overlay,
    Color? brandPrimary,
    Color? brandPrimaryAlt,
    Color? brandSecondary,
    Color? brandSolid,
    Color? brandSolidHover,
    Color? brandSection,
    Color? brandSectionSubtle,
    Color? errorPrimary,
    Color? errorSecondary,
    Color? errorSolid,
    Color? errorSolidHover,
    Color? warningPrimary,
    Color? warningSecondary,
    Color? warningSolid,
    Color? successPrimary,
    Color? successSecondary,
    Color? successSolid,
  }) {
    return BackgroundColors(
      primary: primary ?? this.primary,
      primarySolid: primarySolid ?? this.primarySolid,
      primaryAlt: primaryAlt ?? this.primaryAlt,
      primaryHover: primaryHover ?? this.primaryHover,
      secondary: secondary ?? this.secondary,
      secondarySolid: secondarySolid ?? this.secondarySolid,
      secondarySubtle: secondarySubtle ?? this.secondarySubtle,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      secondaryAlt: secondaryAlt ?? this.secondaryAlt,
      tertiary: tertiary ?? this.tertiary,
      quaternary: quaternary ?? this.quaternary,
      active: active ?? this.active,
      disabled: disabled ?? this.disabled,
      disabledSubtle: disabledSubtle ?? this.disabledSubtle,
      overlay: overlay ?? this.overlay,
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandPrimaryAlt: brandPrimaryAlt ?? this.brandPrimaryAlt,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandSolid: brandSolid ?? this.brandSolid,
      brandSolidHover: brandSolidHover ?? this.brandSolidHover,
      brandSection: brandSection ?? this.brandSection,
      brandSectionSubtle: brandSectionSubtle ?? this.brandSectionSubtle,
      errorPrimary: errorPrimary ?? this.errorPrimary,
      errorSecondary: errorSecondary ?? this.errorSecondary,
      errorSolid: errorSolid ?? this.errorSolid,
      errorSolidHover: errorSolidHover ?? this.errorSolidHover,
      warningPrimary: warningPrimary ?? this.warningPrimary,
      warningSecondary: warningSecondary ?? this.warningSecondary,
      warningSolid: warningSolid ?? this.warningSolid,
      successPrimary: successPrimary ?? this.successPrimary,
      successSecondary: successSecondary ?? this.successSecondary,
      successSolid: successSolid ?? this.successSolid,
    );
  }

  /// Linearly interpolates between two [BackgroundColors] instances.
  @override
  BackgroundColors lerp(BackgroundColors? other, double t) {
    if (other is! BackgroundColors) return this;
    return BackgroundColors(
      primary: Color.lerp(primary, other.primary, t)!,
      primarySolid: Color.lerp(primarySolid, other.primarySolid, t)!,
      primaryAlt: Color.lerp(primaryAlt, other.primaryAlt, t)!,
      primaryHover: Color.lerp(primaryHover, other.primaryHover, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondarySolid: Color.lerp(secondarySolid, other.secondarySolid, t)!,
      secondarySubtle: Color.lerp(secondarySubtle, other.secondarySubtle, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      secondaryAlt: Color.lerp(secondaryAlt, other.secondaryAlt, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
      active: Color.lerp(active, other.active, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      disabledSubtle: Color.lerp(disabledSubtle, other.disabledSubtle, t)!,
      overlay: Color.lerp(overlay, other.overlay, t)!,
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandPrimaryAlt: Color.lerp(brandPrimaryAlt, other.brandPrimaryAlt, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandSolid: Color.lerp(brandSolid, other.brandSolid, t)!,
      brandSolidHover: Color.lerp(brandSolidHover, other.brandSolidHover, t)!,
      brandSection: Color.lerp(brandSection, other.brandSection, t)!,
      brandSectionSubtle: Color.lerp(brandSectionSubtle, other.brandSectionSubtle, t)!,
      errorPrimary: Color.lerp(errorPrimary, other.errorPrimary, t)!,
      errorSecondary: Color.lerp(errorSecondary, other.errorSecondary, t)!,
      errorSolid: Color.lerp(errorSolid, other.errorSolid, t)!,
      errorSolidHover: Color.lerp(errorSolidHover, other.errorSolidHover, t)!,
      warningPrimary: Color.lerp(warningPrimary, other.warningPrimary, t)!,
      warningSecondary: Color.lerp(warningSecondary, other.warningSecondary, t)!,
      warningSolid: Color.lerp(warningSolid, other.warningSolid, t)!,
      successPrimary: Color.lerp(successPrimary, other.successPrimary, t)!,
      successSecondary: Color.lerp(successSecondary, other.successSecondary, t)!,
      successSolid: Color.lerp(successSolid, other.successSolid, t)!,
    );
  }
}
