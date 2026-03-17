import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Semantic border/stroke color tokens as a [ThemeExtension].
///
/// Use for container borders, dividers, outlines, and focus rings.
/// Same values work for `border`, `ring`, and `outline` properties.
///
/// Access via context:
/// ```dart
/// final borderColors = Theme.of(context).extension<BorderColors>()!;
/// Container(decoration: BoxDecoration(border: Border.all(color: borderColors.primary)));
/// ```
class BorderColors extends ThemeExtension<BorderColors> {

  /// Creates a [BorderColors] with all semantic border tokens.
  const BorderColors({
    required this.primary,
    required this.secondary,
    required this.secondaryAlt,
    required this.tertiary,
    required this.disabled,
    required this.disabledSubtle,
    required this.brand,
    required this.brandAlt,
    required this.error,
    required this.errorSubtle,
  });

  /// Light mode border colors.
  factory BorderColors.light({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.gray,
    ColorScale error = MihrColors.error,
  }) {
    return BorderColors(
      primary: gray.shade300,
      secondary: gray.shade200,
      secondaryAlt: const Color(0x14000000), // rgba(0,0,0,0.08)
      tertiary: gray.shade100,
      disabled: gray.shade300,
      disabledSubtle: gray.shade200,
      brand: brand.shade500,
      brandAlt: brand.shade600,
      error: error.shade500,
      errorSubtle: error.shade300,
    );
  }

  /// Dark mode border colors.
  factory BorderColors.dark({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.grayDark,
    ColorScale error = MihrColors.error,
  }) {
    return BorderColors(
      primary: gray.shade700,
      secondary: gray.shade800,
      secondaryAlt: gray.shade800,
      tertiary: gray.shade800,
      disabled: gray.shade700,
      disabledSubtle: gray.shade800,
      brand: brand.shade400,
      brandAlt: gray.shade700,
      error: error.shade400,
      errorSubtle: error.shade500,
    );
  }
  /// High contrast borders — inputs, button groups, checkboxes
  final Color primary;

  /// Medium contrast borders — most common default (tables, cards, dividers)
  final Color secondary;

  /// Secondary alt with alpha transparency — floating menus, notifications
  final Color secondaryAlt;

  /// Low contrast borders — subtle dividers, chart axes
  final Color tertiary;

  /// Disabled borders — disabled inputs, checkboxes
  final Color disabled;

  /// Subtle disabled borders — disabled buttons
  final Color disabledSubtle;

  /// Brand border — active input fields
  final Color brand;

  /// Brand alt — switches to gray in dark mode (banners, footers)
  final Color brandAlt;

  /// Error border — error state inputs, uploaders
  final Color error;

  /// Subtle error border — less prominent error indication
  final Color errorSubtle;

  /// Creates a copy with the given fields replaced.
  @override
  BorderColors copyWith({
    Color? primary,
    Color? secondary,
    Color? secondaryAlt,
    Color? tertiary,
    Color? disabled,
    Color? disabledSubtle,
    Color? brand,
    Color? brandAlt,
    Color? error,
    Color? errorSubtle,
  }) {
    return BorderColors(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      secondaryAlt: secondaryAlt ?? this.secondaryAlt,
      tertiary: tertiary ?? this.tertiary,
      disabled: disabled ?? this.disabled,
      disabledSubtle: disabledSubtle ?? this.disabledSubtle,
      brand: brand ?? this.brand,
      brandAlt: brandAlt ?? this.brandAlt,
      error: error ?? this.error,
      errorSubtle: errorSubtle ?? this.errorSubtle,
    );
  }

  /// Linearly interpolates between two [BorderColors] instances.
  @override
  BorderColors lerp(BorderColors? other, double t) {
    if (other is! BorderColors) return this;
    return BorderColors(
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      secondaryAlt: Color.lerp(secondaryAlt, other.secondaryAlt, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      disabledSubtle: Color.lerp(disabledSubtle, other.disabledSubtle, t)!,
      brand: Color.lerp(brand, other.brand, t)!,
      brandAlt: Color.lerp(brandAlt, other.brandAlt, t)!,
      error: Color.lerp(error, other.error, t)!,
      errorSubtle: Color.lerp(errorSubtle, other.errorSubtle, t)!,
    );
  }
}
