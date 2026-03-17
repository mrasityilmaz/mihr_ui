import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/accent_colors.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';
import 'package:mihr_ui/core/theme/colors/utility_scale.dart';

/// Utility color tokens as a [ThemeExtension].
///
/// "Backup" variables for multi-color components (badges, labels, tags,
/// charts) where semantic tokens don't apply. Each family provides
/// 8 shades (50–700) that automatically invert in dark mode.
///
/// Gray and brand families include extended shades (800, 900).
/// Brand has an `_alt` variant that falls back to gray in dark mode.
///
/// Access via context:
/// ```dart
/// final util = Theme.of(context).extension<UtilityColors>()!;
/// Container(color: util.blue.shade100); // light blue bg, inverts in dark
/// ```
class UtilityColors extends ThemeExtension<UtilityColors> {
  /// Creates a [UtilityColors] with all color family scales.
  const UtilityColors({
    required this.gray,
    required this.brand,
    required this.brandAlt,
    required this.blue,
    required this.blueDark,
    required this.blueLight,
    required this.indigo,
    required this.purple,
    required this.fuchsia,
    required this.pink,
    required this.error,
    required this.warning,
    required this.success,
    required this.orange,
    required this.orangeDark,
    required this.grayBlue,
    required this.green,
    required this.yellow,
  });

  /// Light mode — shades map directly to base palette values.
  factory UtilityColors.light({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.gray,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return UtilityColors(
      gray: UtilityScale.directExtended(gray),
      brand: UtilityScale.directExtended(brand),
      brandAlt: UtilityScale.directExtended(brand),
      blue: UtilityScale.direct(AccentColors.blue),
      blueDark: UtilityScale.direct(AccentColors.blueDark),
      blueLight: UtilityScale.direct(AccentColors.blueLight),
      indigo: UtilityScale.direct(AccentColors.indigo),
      purple: UtilityScale.direct(AccentColors.purple),
      fuchsia: UtilityScale.direct(AccentColors.fuchsia),
      pink: UtilityScale.direct(AccentColors.pink),
      error: UtilityScale.direct(error),
      warning: UtilityScale.direct(warning),
      success: UtilityScale.direct(success),
      orange: UtilityScale.direct(AccentColors.orange),
      orangeDark: UtilityScale.direct(AccentColors.orangeDark),
      grayBlue: UtilityScale.direct(_grayBlue),
      green: UtilityScale.direct(AccentColors.green),
      yellow: UtilityScale.direct(AccentColors.yellow),
    );
  }

  /// Dark mode — shade positions are inverted for proper contrast.
  /// Gray uses special inversion (300→700 doubled, extended to 900→100).
  /// Brand alt falls back to gray inversion in dark mode.
  factory UtilityColors.dark({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.grayDark,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    final grayInverted = UtilityScale.grayDarkInverted(gray);
    return UtilityColors(
      gray: grayInverted,
      brand: UtilityScale.brandInverted(brand),
      brandAlt: grayInverted,
      blue: UtilityScale.inverted(AccentColors.blue),
      blueDark: UtilityScale.inverted(AccentColors.blueDark),
      blueLight: UtilityScale.inverted(AccentColors.blueLight),
      indigo: UtilityScale.inverted(AccentColors.indigo),
      purple: UtilityScale.inverted(AccentColors.purple),
      fuchsia: UtilityScale.inverted(AccentColors.fuchsia),
      pink: UtilityScale.inverted(AccentColors.pink),
      error: UtilityScale.inverted(error),
      warning: UtilityScale.inverted(warning),
      success: UtilityScale.inverted(success),
      orange: UtilityScale.inverted(AccentColors.orange),
      orangeDark: UtilityScale.inverted(AccentColors.orangeDark),
      grayBlue: UtilityScale.inverted(_grayBlue),
      green: UtilityScale.inverted(AccentColors.green),
      yellow: UtilityScale.inverted(AccentColors.yellow),
    );
  }

  /// Gray utility scale (extended to shade 900).
  final UtilityScale gray;

  /// Brand utility scale (extended to shade 900).
  final UtilityScale brand;

  /// Brand alt — falls back to gray in dark mode.
  final UtilityScale brandAlt;

  /// Blue utility scale.
  final UtilityScale blue;

  /// Dark blue utility scale.
  final UtilityScale blueDark;

  /// Light blue utility scale.
  final UtilityScale blueLight;

  /// Indigo utility scale.
  final UtilityScale indigo;

  /// Purple utility scale.
  final UtilityScale purple;

  /// Fuchsia utility scale.
  final UtilityScale fuchsia;

  /// Pink utility scale.
  final UtilityScale pink;

  /// Error (red) utility scale.
  final UtilityScale error;

  /// Warning (amber) utility scale.
  final UtilityScale warning;

  /// Success (green) utility scale.
  final UtilityScale success;

  /// Orange utility scale.
  final UtilityScale orange;

  /// Dark orange utility scale.
  final UtilityScale orangeDark;

  /// Gray-blue utility scale.
  final UtilityScale grayBlue;

  /// Green utility scale.
  final UtilityScale green;

  /// Yellow utility scale.
  final UtilityScale yellow;

  /// Creates a copy with the given fields replaced.
  @override
  UtilityColors copyWith({
    UtilityScale? gray,
    UtilityScale? brand,
    UtilityScale? brandAlt,
    UtilityScale? blue,
    UtilityScale? blueDark,
    UtilityScale? blueLight,
    UtilityScale? indigo,
    UtilityScale? purple,
    UtilityScale? fuchsia,
    UtilityScale? pink,
    UtilityScale? error,
    UtilityScale? warning,
    UtilityScale? success,
    UtilityScale? orange,
    UtilityScale? orangeDark,
    UtilityScale? grayBlue,
    UtilityScale? green,
    UtilityScale? yellow,
  }) {
    return UtilityColors(
      gray: gray ?? this.gray,
      brand: brand ?? this.brand,
      brandAlt: brandAlt ?? this.brandAlt,
      blue: blue ?? this.blue,
      blueDark: blueDark ?? this.blueDark,
      blueLight: blueLight ?? this.blueLight,
      indigo: indigo ?? this.indigo,
      purple: purple ?? this.purple,
      fuchsia: fuchsia ?? this.fuchsia,
      pink: pink ?? this.pink,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      orange: orange ?? this.orange,
      orangeDark: orangeDark ?? this.orangeDark,
      grayBlue: grayBlue ?? this.grayBlue,
      green: green ?? this.green,
      yellow: yellow ?? this.yellow,
    );
  }

  /// Linearly interpolates between two [UtilityColors] instances.
  @override
  UtilityColors lerp(UtilityColors? other, double t) {
    if (other is! UtilityColors) return this;
    return UtilityColors(
      gray: UtilityScale.lerpScale(gray, other.gray, t)!,
      brand: UtilityScale.lerpScale(brand, other.brand, t)!,
      brandAlt: UtilityScale.lerpScale(brandAlt, other.brandAlt, t)!,
      blue: UtilityScale.lerpScale(blue, other.blue, t)!,
      blueDark: UtilityScale.lerpScale(blueDark, other.blueDark, t)!,
      blueLight: UtilityScale.lerpScale(blueLight, other.blueLight, t)!,
      indigo: UtilityScale.lerpScale(indigo, other.indigo, t)!,
      purple: UtilityScale.lerpScale(purple, other.purple, t)!,
      fuchsia: UtilityScale.lerpScale(fuchsia, other.fuchsia, t)!,
      pink: UtilityScale.lerpScale(pink, other.pink, t)!,
      error: UtilityScale.lerpScale(error, other.error, t)!,
      warning: UtilityScale.lerpScale(warning, other.warning, t)!,
      success: UtilityScale.lerpScale(success, other.success, t)!,
      orange: UtilityScale.lerpScale(orange, other.orange, t)!,
      orangeDark: UtilityScale.lerpScale(orangeDark, other.orangeDark, t)!,
      grayBlue: UtilityScale.lerpScale(grayBlue, other.grayBlue, t)!,
      green: UtilityScale.lerpScale(green, other.green, t)!,
      yellow: UtilityScale.lerpScale(yellow, other.yellow, t)!,
    );
  }

  /// Gray-blue palette reference from gray_variants.dart values.
  /// Kept here to avoid circular dependency with GrayVariants.
  static const _grayBlue = ColorScale(
    shade25: Color(0xFFFCFCFD),
    shade50: Color(0xFFF8F9FC),
    shade100: Color(0xFFEAECF5),
    shade200: Color(0xFFD5D9EB),
    shade300: Color(0xFFB3B8DB),
    shade400: Color(0xFF717BBC),
    shade500: Color(0xFF4E5BA6),
    shade600: Color(0xFF3E4784),
    shade700: Color(0xFF363F72),
    shade800: Color(0xFF293056),
    shade900: Color(0xFF101323),
    shade950: Color(0xFF0D0F1C),
  );
}
