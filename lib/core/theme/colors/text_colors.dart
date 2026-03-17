import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Semantic text color tokens as a [ThemeExtension].
///
/// Maps purpose-based names to actual palette shades.
/// Light and dark mode use different shade mappings from
/// the same underlying [ColorScale] palettes.
///
/// Access via context:
/// ```dart
/// final textColors = Theme.of(context).extension<TextColors>()!;
/// Text('Hello', style: TextStyle(color: textColors.primary));
/// ```
class TextColors extends ThemeExtension<TextColors> {
  /// Creates a [TextColors] with all semantic text color tokens specified.
  const TextColors({
    required this.primary,
    required this.secondary,
    required this.secondaryHover,
    required this.tertiary,
    required this.tertiaryHover,
    required this.quaternary,
    required this.disabled,
    required this.placeholder,
    required this.placeholderSubtle,
    required this.white,
    required this.primaryOnBrand,
    required this.secondaryOnBrand,
    required this.tertiaryOnBrand,
    required this.quaternaryOnBrand,
    required this.brandPrimary,
    required this.brandSecondary,
    required this.brandSecondaryHover,
    required this.brandTertiary,
    required this.brandTertiaryAlt,
    required this.errorPrimary,
    required this.errorPrimaryHover,
    required this.warningPrimary,
    required this.successPrimary,
  });

  /// Light mode text colors.
  ///
  /// [brand] and [gray] can be customized to theme the entire palette.
  factory TextColors.light({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.gray,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return TextColors(
      primary: gray.shade900,
      secondary: gray.shade700,
      secondaryHover: gray.shade800,
      tertiary: gray.shade600,
      tertiaryHover: gray.shade700,
      quaternary: gray.shade500,
      disabled: gray.shade500,
      placeholder: gray.shade500,
      placeholderSubtle: gray.shade300,
      white: MihrColors.white,
      primaryOnBrand: MihrColors.white,
      secondaryOnBrand: brand.shade200,
      tertiaryOnBrand: brand.shade200,
      quaternaryOnBrand: brand.shade300,
      brandPrimary: brand.shade900,
      brandSecondary: brand.shade700,
      brandSecondaryHover: brand.shade800,
      brandTertiary: brand.shade600,
      brandTertiaryAlt: brand.shade600,
      errorPrimary: error.shade600,
      errorPrimaryHover: error.shade700,
      warningPrimary: warning.shade600,
      successPrimary: success.shade600,
    );
  }

  /// Dark mode text colors.
  ///
  /// Uses `grayDark` by default for optimized dark-mode contrast.
  factory TextColors.dark({
    ColorScale gray = MihrColors.grayDark,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return TextColors(
      primary: gray.shade50,
      secondary: gray.shade300,
      secondaryHover: gray.shade200,
      tertiary: gray.shade400,
      tertiaryHover: gray.shade300,
      quaternary: gray.shade400,
      disabled: gray.shade500,
      placeholder: gray.shade500,
      placeholderSubtle: gray.shade700,
      white: MihrColors.white,
      primaryOnBrand: gray.shade50,
      secondaryOnBrand: gray.shade300,
      tertiaryOnBrand: gray.shade400,
      quaternaryOnBrand: gray.shade400,
      brandPrimary: gray.shade50,
      brandSecondary: gray.shade300,
      brandSecondaryHover: gray.shade200,
      brandTertiary: gray.shade400,
      brandTertiaryAlt: gray.shade50,
      errorPrimary: error.shade400,
      errorPrimaryHover: error.shade300,
      warningPrimary: warning.shade400,
      successPrimary: success.shade400,
    );
  }

  /// Primary text — page headings, high emphasis content
  final Color primary;

  /// Secondary text — labels, section headings
  final Color secondary;

  /// Secondary text hover state
  final Color secondaryHover;

  /// Tertiary text — supporting text, paragraphs
  final Color tertiary;

  /// Tertiary text hover state
  final Color tertiaryHover;

  /// Quaternary text — subtle, low-contrast text (footer headings)
  final Color quaternary;

  /// Disabled text — disabled fields, buttons
  final Color disabled;

  /// Placeholder text — input placeholders
  final Color placeholder;

  /// Subtle placeholder — lower contrast (e.g. verification inputs)
  final Color placeholderSubtle;

  /// White text — always white regardless of mode
  final Color white;

  /// Primary text on solid brand backgrounds (CTA sections)
  final Color primaryOnBrand;

  /// Secondary text on solid brand backgrounds
  final Color secondaryOnBrand;

  /// Tertiary text on solid brand backgrounds
  final Color tertiaryOnBrand;

  /// Quaternary text on solid brand backgrounds
  final Color quaternaryOnBrand;

  /// Brand primary text — brand headings (e.g. pricing cards)
  final Color brandPrimary;

  /// Brand secondary text — brand buttons, accented text
  final Color brandSecondary;

  /// Brand secondary text hover state
  final Color brandSecondaryHover;

  /// Brand tertiary text — lighter accented text (metric numbers)
  final Color brandTertiary;

  /// Brand tertiary alt — lighter in dark mode
  final Color brandTertiaryAlt;

  /// Error text — error messages, validation
  final Color errorPrimary;

  /// Error text hover state
  final Color errorPrimaryHover;

  /// Warning text — warning messages
  final Color warningPrimary;

  /// Success text — success messages
  final Color successPrimary;

  /// Creates a copy with the given fields replaced.
  @override
  TextColors copyWith({
    Color? primary,
    Color? secondary,
    Color? secondaryHover,
    Color? tertiary,
    Color? tertiaryHover,
    Color? quaternary,
    Color? disabled,
    Color? placeholder,
    Color? placeholderSubtle,
    Color? white,
    Color? primaryOnBrand,
    Color? secondaryOnBrand,
    Color? tertiaryOnBrand,
    Color? quaternaryOnBrand,
    Color? brandPrimary,
    Color? brandSecondary,
    Color? brandSecondaryHover,
    Color? brandTertiary,
    Color? brandTertiaryAlt,
    Color? errorPrimary,
    Color? errorPrimaryHover,
    Color? warningPrimary,
    Color? successPrimary,
  }) {
    return TextColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      secondaryHover: secondaryHover ?? this.secondaryHover,
      tertiary: tertiary ?? this.tertiary,
      tertiaryHover: tertiaryHover ?? this.tertiaryHover,
      quaternary: quaternary ?? this.quaternary,
      disabled: disabled ?? this.disabled,
      placeholder: placeholder ?? this.placeholder,
      placeholderSubtle: placeholderSubtle ?? this.placeholderSubtle,
      white: white ?? this.white,
      primaryOnBrand: primaryOnBrand ?? this.primaryOnBrand,
      secondaryOnBrand: secondaryOnBrand ?? this.secondaryOnBrand,
      tertiaryOnBrand: tertiaryOnBrand ?? this.tertiaryOnBrand,
      quaternaryOnBrand: quaternaryOnBrand ?? this.quaternaryOnBrand,
      brandPrimary: brandPrimary ?? this.brandPrimary,
      brandSecondary: brandSecondary ?? this.brandSecondary,
      brandSecondaryHover: brandSecondaryHover ?? this.brandSecondaryHover,
      brandTertiary: brandTertiary ?? this.brandTertiary,
      brandTertiaryAlt: brandTertiaryAlt ?? this.brandTertiaryAlt,
      errorPrimary: errorPrimary ?? this.errorPrimary,
      errorPrimaryHover: errorPrimaryHover ?? this.errorPrimaryHover,
      warningPrimary: warningPrimary ?? this.warningPrimary,
      successPrimary: successPrimary ?? this.successPrimary,
    );
  }

  /// Linearly interpolates between two [TextColors] instances.
  @override
  TextColors lerp(TextColors? other, double t) {
    if (other is! TextColors) return this;
    return TextColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryHover: Color.lerp(secondaryHover, other.secondaryHover, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      tertiaryHover: Color.lerp(tertiaryHover, other.tertiaryHover, t)!,
      quaternary: Color.lerp(quaternary, other.quaternary, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      placeholder: Color.lerp(placeholder, other.placeholder, t)!,
      placeholderSubtle: Color.lerp(
        placeholderSubtle,
        other.placeholderSubtle,
        t,
      )!,
      white: Color.lerp(white, other.white, t)!,
      primaryOnBrand: Color.lerp(primaryOnBrand, other.primaryOnBrand, t)!,
      secondaryOnBrand: Color.lerp(
        secondaryOnBrand,
        other.secondaryOnBrand,
        t,
      )!,
      tertiaryOnBrand: Color.lerp(tertiaryOnBrand, other.tertiaryOnBrand, t)!,
      quaternaryOnBrand: Color.lerp(
        quaternaryOnBrand,
        other.quaternaryOnBrand,
        t,
      )!,
      brandPrimary: Color.lerp(brandPrimary, other.brandPrimary, t)!,
      brandSecondary: Color.lerp(brandSecondary, other.brandSecondary, t)!,
      brandSecondaryHover: Color.lerp(
        brandSecondaryHover,
        other.brandSecondaryHover,
        t,
      )!,
      brandTertiary: Color.lerp(brandTertiary, other.brandTertiary, t)!,
      brandTertiaryAlt: Color.lerp(
        brandTertiaryAlt,
        other.brandTertiaryAlt,
        t,
      )!,
      errorPrimary: Color.lerp(errorPrimary, other.errorPrimary, t)!,
      errorPrimaryHover: Color.lerp(
        errorPrimaryHover,
        other.errorPrimaryHover,
        t,
      )!,
      warningPrimary: Color.lerp(warningPrimary, other.warningPrimary, t)!,
      successPrimary: Color.lerp(successPrimary, other.successPrimary, t)!,
    );
  }
}
