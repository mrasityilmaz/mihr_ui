import 'package:flutter/painting.dart';

import 'package:mihr_ui/core/theme/colors/color_scale.dart';

/// Result of a single WCAG contrast validation check.
class ContrastCheck {

  /// Creates a [ContrastCheck] with all validation parameters.
  const ContrastCheck({
    required this.label,
    required this.foregroundShade,
    required this.backgroundShade,
    required this.foreground,
    required this.background,
    required this.ratio,
    required this.requiredRatio,
  });

  /// Human-readable name of the check (e.g. "Interactive on white").
  final String label;

  /// Shade key of the foreground color (e.g. "600").
  final String foregroundShade;

  /// Shade key of the background color (e.g. "white").
  final String backgroundShade;

  /// The foreground [Color] being tested.
  final Color foreground;

  /// The background [Color] being tested against.
  final Color background;

  /// The actual computed contrast ratio.
  final double ratio;

  /// The minimum contrast ratio required to pass.
  final double requiredRatio;

  /// Whether [ratio] meets or exceeds [requiredRatio].
  bool get passed => ratio >= requiredRatio;

  @override
  String toString() {
    final status = passed ? 'PASS' : 'FAIL';
    return '$status $label: $foregroundShade on $backgroundShade '
        '= ${ratio.toStringAsFixed(2)}:1 '
        '(required ${requiredRatio.toStringAsFixed(1)}:1)';
  }
}

/// Aggregated WCAG contrast report for a generated [ColorScale].
class ContrastReport {

  /// Creates a [ContrastReport] from a list of [ContrastCheck]s.
  const ContrastReport(this.checks);

  /// The individual checks that make up this report.
  final List<ContrastCheck> checks;

  /// Whether every check in [checks] passed.
  bool get allPassed => checks.every((c) => c.passed);

  /// The subset of checks that failed their required contrast ratio.
  List<ContrastCheck> get failures => checks.where((c) => !c.passed).toList(growable: false);

  @override
  String toString() {
    final buf = StringBuffer('ContrastReport (${allPassed ? "ALL PASS" : "${failures.length} FAILURES"})\n');
    for (final c in checks) {
      buf.writeln('  $c');
    }
    return buf.toString();
  }
}

/// Generates a full 12-shade [ColorScale] from a single brand color.
///
/// The provided color is treated as **shade 600** — the primary interactive
/// shade used for buttons, links, and active states. All other shades are
/// derived using proportional HSL distribution with WCAG AA contrast
/// auto-correction.
///
/// ## Quick usage
/// ```dart
/// final palette = ColorScaleGenerator.fromColor(Color(0xFF7F56D9));
/// // or
/// final palette = ColorScaleGenerator.fromHex('#7F56D9');
///
/// MaterialApp(
///   theme: MihrTheme.light(brand: palette),
///   darkTheme: MihrTheme.dark(brand: palette),
/// );
/// ```
///
/// ## With contrast report
/// ```dart
/// final (palette, report) = ColorScaleGenerator.fromColorWithReport(
///   Color(0xFFE63946),
/// );
/// assert(report.allPassed, 'WCAG checks failed:\n$report');
/// ```
class ColorScaleGenerator {
  ColorScaleGenerator._();

  /// Fractional distances from shade 600 towards white for lighter shades.
  ///
  /// Derived from averaging the brand, error, warning, and success palettes
  /// in the Mihr UI design system. The fraction represents how far each
  /// shade sits between the anchor (shade 600) lightness and 1.0 (white).
  static const _lightFractions = <int, double>{
    25: 0.975,
    50: 0.946,
    100: 0.892,
    200: 0.771,
    300: 0.595,
    400: 0.388,
    500: 0.188,
  };

  /// Fractional distances from shade 600 towards black for darker shades.
  static const _darkFractions = <int, double>{700: 0.156, 800: 0.308, 900: 0.418, 950: 0.603};

  /// Saturation multipliers relative to the anchor shade's saturation.
  ///
  /// Light extremes keep high saturation (HSL saturation is barely visible
  /// at very high lightness anyway). Dark extremes taper to avoid muddiness.
  static const _saturationFactors = <int, double>{
    25: 1.00,
    50: 1.00,
    100: 1.00,
    200: 0.96,
    300: 0.92,
    400: 0.88,
    500: 0.94,
    600: 1.00,
    700: 0.96,
    800: 0.92,
    900: 0.86,
    950: 0.78,
  };

  static const Color _white = Color(0xFFFFFFFF);

  static const double _minAnchorLightness = 0.25;
  static const double _maxAnchorLightness = 0.60;
  static const double _minSaturation = 0.05;

  /// Generates a [ColorScale] from a single brand [Color].
  ///
  /// The color is placed at shade 600 (the primary interactive shade).
  /// If the color's HSL lightness falls outside [0.25, 0.60], it is
  /// clamped to the nearest valid value.
  ///
  /// Set [clampLightness] to `false` to preserve the exact lightness of
  /// the input color. This allows light brand colors (e.g. rose-300) to
  /// be used as shade 600. When disabled, the WCAG Rule 1 check
  /// (shade 600 on white >= 4.5:1) is skipped — pair with
  /// `ForegroundColors.onBrandSolid` for adaptive text contrast.
  static ColorScale fromColor(Color brandColor, {bool clampLightness = true}) {
    return fromColorWithReport(brandColor, clampLightness: clampLightness).$1;
  }

  /// Generates a [ColorScale] and a [ContrastReport] from a single [Color].
  ///
  /// Use the report to inspect which WCAG checks passed or failed.
  /// See [fromColor] for details on [clampLightness].
  static (ColorScale, ContrastReport) fromColorWithReport(Color brandColor, {bool clampLightness = true}) {
    final hsl = HSLColor.fromColor(brandColor);

    final anchorL = clampLightness
        ? hsl.lightness.clamp(_minAnchorLightness, _maxAnchorLightness)
        : hsl.lightness.clamp(_minAnchorLightness, 0.95);
    final baseHue = hsl.hue;
    final baseSat = hsl.saturation < _minSaturation ? _minSaturation : hsl.saturation;

    final headroom = 1.0 - anchorL;
    final legroom = anchorL;

    final shades = <int, HSLColor>{};

    shades[600] = HSLColor.fromAHSL(1, baseHue, baseSat, anchorL);

    for (final entry in _lightFractions.entries) {
      final shade = entry.key;
      final fraction = entry.value;
      final l = (anchorL + headroom * fraction).clamp(0.0, 1.0);
      final s = (baseSat * _saturationFactors[shade]!).clamp(0.0, 1.0);
      final h = _shiftHue(baseHue, fraction * 2.0);
      shades[shade] = HSLColor.fromAHSL(1, h, s, l);
    }

    for (final entry in _darkFractions.entries) {
      final shade = entry.key;
      final fraction = entry.value;
      final l = (anchorL - legroom * fraction).clamp(0.02, 1.0);
      final s = (baseSat * _saturationFactors[shade]!).clamp(0.0, 1.0);
      final h = _shiftHue(baseHue, -fraction * 4.0);
      shades[shade] = HSLColor.fromAHSL(1, h, s, l);
    }

    final colorShades = shades.map((k, v) => MapEntry(k, v.toColor()));

    _autoCorrectContrast(colorShades, enforceShade600OnWhite: clampLightness);

    final scale = ColorScale(
      shade25: colorShades[25]!,
      shade50: colorShades[50]!,
      shade100: colorShades[100]!,
      shade200: colorShades[200]!,
      shade300: colorShades[300]!,
      shade400: colorShades[400]!,
      shade500: colorShades[500]!,
      shade600: colorShades[600]!,
      shade700: colorShades[700]!,
      shade800: colorShades[800]!,
      shade900: colorShades[900]!,
      shade950: colorShades[950]!,
    );

    return (scale, _buildReport(scale, includeRule1: clampLightness));
  }

  /// Convenience constructor from a hex string (e.g. `'#7F56D9'` or `'7F56D9'`).
  ///
  /// See [fromColor] for details on [clampLightness].
  static ColorScale fromHex(String hex, {bool clampLightness = true}) {
    var cleaned = hex.replaceFirst('#', '').replaceFirst('0x', '');
    if (cleaned.length == 6) cleaned = 'FF$cleaned';
    return fromColor(Color(int.parse(cleaned, radix: 16)), clampLightness: clampLightness);
  }

  /// WCAG 2.2 relative luminance contrast ratio between two colors.
  ///
  /// Returns a value >= 1.0. Higher means more contrast.
  /// - >= 4.5 → WCAG AA for normal text
  /// - >= 3.0 → WCAG AA for large text / UI components
  /// - >= 7.0 → WCAG AAA
  static double contrastRatio(Color a, Color b) {
    final la = a.computeLuminance();
    final lb = b.computeLuminance();
    final lighter = la > lb ? la : lb;
    final darker = la > lb ? lb : la;
    return (lighter + 0.05) / (darker + 0.05);
  }

  /// Whether [foreground] on [background] meets WCAG AA (4.5:1).
  static bool meetsWcagAA(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= 4.5;
  }

  /// Whether [foreground] on [background] meets WCAG AA for large text (3:1).
  static bool meetsWcagAALarge(Color foreground, Color background) {
    return contrastRatio(foreground, background) >= 3.0;
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  static double _shiftHue(double baseHue, double shift) {
    return ((baseHue + shift) % 360.0 + 360.0) % 360.0;
  }

  static void _autoCorrectContrast(Map<int, Color> shades, {bool enforceShade600OnWhite = true}) {
    if (enforceShade600OnWhite) {
      // Rule 1: shade600 on white >= 4.5:1 (buttons, links)
      shades[600] = _ensureContrast(shades[600]!, _white, 4.5, darken: true);
    }

    // Rule 2: shade700 on white >= 4.5:1 (hover states)
    shades[700] = _ensureContrast(shades[700]!, _white, 4.5, darken: true);

    // Rule 3: shade500 on white >= 3:1 (base accent)
    shades[500] = _ensureContrast(shades[500]!, _white, 3, darken: true);

    // Rule 4: shade900 on shade25 >= 4.5:1 (primary text on light bg)
    shades[900] = _ensureContrast(shades[900]!, shades[25]!, 4.5, darken: true);

    // Rule 5: shade200 on shade900 >= 4.5:1 (light text on dark bg)
    shades[200] = _ensureContrast(shades[200]!, shades[900]!, 4.5, darken: false);

    // Rule 6: shade50 on shade600 >= 3:1 (text on brand solid bg)
    shades[50] = _ensureContrast(shades[50]!, shades[600]!, 3, darken: false);

    // Rule 7: shade300 on shade800 >= 3:1 (dark mode icon on dark bg)
    shades[300] = _ensureContrast(shades[300]!, shades[800]!, 3, darken: false);

    // Rule 8: shade400 on shade950 >= 4.5:1 (dark mode semantic text)
    shades[400] = _ensureContrast(shades[400]!, shades[950]!, 4.5, darken: false);

    _enforceMonotonicity(shades);
  }

  /// Ensures lightness decreases monotonically from shade25 to shade950.
  ///
  /// After WCAG auto-correction, individual shades may have been pushed
  /// past their neighbours. This pass walks the sorted shade list and
  /// pulls any out-of-order shade to match its tighter neighbour.
  static void _enforceMonotonicity(Map<int, Color> shades) {
    const keys = ColorScale.shadeKeys; // [25, 50, ..., 950] ascending

    // Forward pass: each shade must be <= its lighter neighbour's lightness.
    for (var i = 1; i < keys.length; i++) {
      final prevL = HSLColor.fromColor(shades[keys[i - 1]]!).lightness;
      final curHsl = HSLColor.fromColor(shades[keys[i]]!);
      if (curHsl.lightness > prevL) {
        shades[keys[i]] = curHsl.withLightness(prevL).toColor();
      }
    }

    // Backward pass: each shade must be >= its darker neighbour's lightness.
    for (var i = keys.length - 2; i >= 0; i--) {
      final nextL = HSLColor.fromColor(shades[keys[i + 1]]!).lightness;
      final curHsl = HSLColor.fromColor(shades[keys[i]]!);
      if (curHsl.lightness < nextL) {
        shades[keys[i]] = curHsl.withLightness(nextL).toColor();
      }
    }
  }

  /// Iteratively adjusts [fg] lightness until it achieves [minRatio] against [bg].
  static Color _ensureContrast(Color fg, Color bg, double minRatio, {required bool darken}) {
    if (contrastRatio(fg, bg) >= minRatio) return fg;

    var hsl = HSLColor.fromColor(fg);
    const step = 0.005;
    const maxIterations = 160;

    for (var i = 0; i < maxIterations; i++) {
      final newL = darken ? (hsl.lightness - step).clamp(0.0, 1.0) : (hsl.lightness + step).clamp(0.0, 1.0);
      hsl = hsl.withLightness(newL);
      if (contrastRatio(hsl.toColor(), bg) >= minRatio) return hsl.toColor();
    }

    return hsl.toColor();
  }

  static ContrastReport _buildReport(ColorScale scale, {bool includeRule1 = true}) {
    return ContrastReport([
      if (includeRule1) _check('Interactive on white', '600', 'white', scale.shade600, _white, 4.5),
      _check('Hover on white', '700', 'white', scale.shade700, _white, 4.5),
      _check('Base accent on white', '500', 'white', scale.shade500, _white, 3),
      _check('Primary text on light bg', '900', '25', scale.shade900, scale.shade25, 4.5),
      _check('Light text on dark bg', '200', '900', scale.shade200, scale.shade900, 4.5),
      _check('Text on brand solid', '50', '600', scale.shade50, scale.shade600, 3),
      _check('Icon on dark bg', '300', '800', scale.shade300, scale.shade800, 3),
      _check('Dark mode semantic text', '400', '950', scale.shade400, scale.shade950, 4.5),
    ]);
  }

  static ContrastCheck _check(String label, String fgShade, String bgShade, Color fg, Color bg, double requiredRatio) {
    return ContrastCheck(
      label: label,
      foregroundShade: fgShade,
      backgroundShade: bgShade,
      foreground: fg,
      background: bg,
      ratio: contrastRatio(fg, bg),
      requiredRatio: requiredRatio,
    );
  }
}
