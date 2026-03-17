import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/utility_colors.dart'
    show UtilityColors;
import 'package:mihr_ui/mihr_ui.dart' show UtilityColors;

/// A dark-mode-aware color subset used by [UtilityColors].
///
/// Utility scales provide 8 core shades (50–700) with optional
/// extended shades (800, 900) for gray and brand families.
///
/// In light mode, shades map directly to base palette values.
/// In dark mode, the shade positions are inverted so that
/// "shade50" (lightest) maps to the base palette's darkest values.
class UtilityScale {
  /// Creates a [UtilityScale] with 8 core shades and optional extended.
  const UtilityScale({
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    this.shade800,
    this.shade900,
  });

  /// Direct mapping — light mode for all standard color families.
  /// Maps shade50→base.shade50, shade700→base.shade700.
  factory UtilityScale.direct(ColorScale base) {
    return UtilityScale(
      shade50: base.shade50,
      shade100: base.shade100,
      shade200: base.shade200,
      shade300: base.shade300,
      shade400: base.shade400,
      shade500: base.shade500,
      shade600: base.shade600,
      shade700: base.shade700,
    );
  }

  /// Direct mapping with extended shades (gray/brand light mode).
  factory UtilityScale.directExtended(ColorScale base) {
    return UtilityScale(
      shade50: base.shade50,
      shade100: base.shade100,
      shade200: base.shade200,
      shade300: base.shade300,
      shade400: base.shade400,
      shade500: base.shade500,
      shade600: base.shade600,
      shade700: base.shade700,
      shade800: base.shade800,
      shade900: base.shade900,
    );
  }

  /// Standard dark-mode inversion for non-gray families.
  /// 50→950, 100→900, 200→800, 300→700, 400→600, 500=same, 600→400, 700→300.
  factory UtilityScale.inverted(ColorScale base) {
    return UtilityScale(
      shade50: base.shade950,
      shade100: base.shade900,
      shade200: base.shade800,
      shade300: base.shade700,
      shade400: base.shade600,
      shade500: base.shade500,
      shade600: base.shade400,
      shade700: base.shade300,
    );
  }

  /// Gray-specific dark-mode inversion (uses grayDark palette).
  /// Differs from standard: 50→900, 300→700 (same as 200), 800→200, 900→100.
  factory UtilityScale.grayDarkInverted(ColorScale grayDark) {
    return UtilityScale(
      shade50: grayDark.shade900,
      shade100: grayDark.shade800,
      shade200: grayDark.shade700,
      shade300: grayDark.shade700,
      shade400: grayDark.shade600,
      shade500: grayDark.shade500,
      shade600: grayDark.shade400,
      shade700: grayDark.shade300,
      shade800: grayDark.shade200,
      shade900: grayDark.shade100,
    );
  }

  /// Brand dark-mode inversion with extended shades.
  /// 50→950, 100→900, ..., 800→200, 900→100.
  factory UtilityScale.brandInverted(ColorScale brand) {
    return UtilityScale(
      shade50: brand.shade950,
      shade100: brand.shade900,
      shade200: brand.shade800,
      shade300: brand.shade700,
      shade400: brand.shade600,
      shade500: brand.shade500,
      shade600: brand.shade400,
      shade700: brand.shade300,
      shade800: brand.shade200,
      shade900: brand.shade100,
    );
  }

  /// Lightest utility shade.
  final Color shade50;

  /// Light utility shade.
  final Color shade100;

  /// Light-mid utility shade.
  final Color shade200;

  /// Mid-light utility shade.
  final Color shade300;

  /// Mid utility shade.
  final Color shade400;

  /// Base utility shade.
  final Color shade500;

  /// Mid-dark utility shade.
  final Color shade600;

  /// Dark utility shade.
  final Color shade700;

  /// Extended dark shade (gray/brand families only).
  final Color? shade800;

  /// Extended darkest shade (gray/brand families only).
  final Color? shade900;

  /// Access a shade by its numeric key (50–900).
  Color operator [](int shade) {
    return switch (shade) {
      50 => shade50,
      100 => shade100,
      200 => shade200,
      300 => shade300,
      400 => shade400,
      500 => shade500,
      600 => shade600,
      700 => shade700,
      800 => shade800 ?? shade700,
      900 => shade900 ?? shade700,
      _ => throw ArgumentError(
          'Invalid utility shade: $shade. '
          'Valid shades: 50, 100, 200, 300, 400, 500, 600, 700'
          '${shade800 != null ? ", 800, 900" : ""}.',
        ),
    };
  }

  /// Linearly interpolates between two [UtilityScale] instances.
  static UtilityScale? lerpScale(UtilityScale? a, UtilityScale? b, double t) {
    if (a == null && b == null) return null;
    final effectiveA = a ?? b;
    final effectiveB = b ?? a;
    if (effectiveA == null || effectiveB == null) return null;
    return UtilityScale(
      shade50: Color.lerp(effectiveA.shade50, effectiveB.shade50, t)!,
      shade100: Color.lerp(effectiveA.shade100, effectiveB.shade100, t)!,
      shade200: Color.lerp(effectiveA.shade200, effectiveB.shade200, t)!,
      shade300: Color.lerp(effectiveA.shade300, effectiveB.shade300, t)!,
      shade400: Color.lerp(effectiveA.shade400, effectiveB.shade400, t)!,
      shade500: Color.lerp(effectiveA.shade500, effectiveB.shade500, t)!,
      shade600: Color.lerp(effectiveA.shade600, effectiveB.shade600, t)!,
      shade700: Color.lerp(effectiveA.shade700, effectiveB.shade700, t)!,
      shade800: Color.lerp(effectiveA.shade800, effectiveB.shade800, t),
      shade900: Color.lerp(effectiveA.shade900, effectiveB.shade900, t),
    );
  }
}
