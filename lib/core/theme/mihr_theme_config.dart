import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/typography/mihr_typography.dart';

/// Immutable preset object that groups every Mihr UI theme knob into
/// a single, shareable value.
///
/// A [MihrThemeConfig] is passed once to `MihrTheme.light` or
/// `MihrTheme.dark` to produce a fully wired [ThemeData]. Use
/// [copyWith] to create variants from a base preset, and share
/// configs across apps or features for consistent branding.
///
/// ## Customization layers
///
/// Mihr UI exposes four independent customization layers; pick the
/// narrowest layer that solves your problem:
///
/// 1. **Preset (this class)** — brand, gray, typography, and any
///    component theme extension. App-wide defaults.
/// 2. **Component theme** — e.g. [MihrButtonThemeData]. Overrides
///    shape, shadows, or per-variant style for one component family.
/// 3. **Per-instance** — the `style` / `styleBuilder` prop on an
///    individual widget. Highest precedence.
/// 4. **Material escape-hatch** — [materialOverrides] callback.
///    Receives the fully built [ThemeData] with every Mihr default
///    applied and returns a modified copy. Use this for Material
///    properties Mihr does not model semantically (e.g.
///    [ThemeData.scaffoldBackgroundColor], [AppBarTheme.centerTitle]).
///
/// ## Basic usage
///
/// ```dart
/// const cfg = MihrThemeConfig();
/// MaterialApp(
///   theme: MihrTheme.light(config: cfg),
///   darkTheme: MihrTheme.dark(config: cfg),
/// );
/// ```
///
/// ## Custom brand + button theme
///
/// ```dart
/// final cfg = MihrThemeConfig(
///   brand: ColorScaleGenerator.fromHex('#E63946'),
///   buttonTheme: MihrButtonThemeData(
///     shape: RoundedRectangleBorder(
///       borderRadius: BorderRadius.circular(12),
///     ),
///   ),
/// );
/// ```
///
/// ## Material escape-hatch
///
/// The [materialOverrides] callback receives the Mihr-built base
/// [ThemeData] with every widget theme, [ColorScheme] entry, and
/// semantic [ThemeExtension] pre-populated. Use `base.bgColors`,
/// `base.textColors`, `base.typography`, etc. to read Mihr tokens
/// ergonomically.
///
/// ```dart
/// MihrThemeConfig(
///   materialOverrides: (base) => base.copyWith(
///     scaffoldBackgroundColor: base.bgColors.secondary,
///     appBarTheme: base.appBarTheme.copyWith(centerTitle: true),
///   ),
/// );
/// ```
@immutable
class MihrThemeConfig {
  /// Creates an immutable theme configuration.
  ///
  /// Every field is optional; any [ColorScale] left `null` falls
  /// back to the built-in Mihr palette for the active brightness.
  const MihrThemeConfig({
    this.brand,
    this.gray,
    this.error,
    this.warning,
    this.success,
    this.fontFamily = MihrTypography.defaultFontFamily,
    this.typography,
    this.buttonTheme,
    this.extraExtensions = const <ThemeExtension<dynamic>>[],
    this.materialOverrides,
  });

  /// Brand color scale. Defaults to the built-in purple palette.
  final ColorScale? brand;

  /// Neutral gray scale.
  ///
  /// When `null`, `MihrTheme.light` uses `MihrColors.gray` and
  /// `MihrTheme.dark` uses `MihrColors.grayDark` for mode-optimized
  /// contrast.
  final ColorScale? gray;

  /// Error / destructive color scale. Defaults to the built-in red.
  final ColorScale? error;

  /// Warning / caution color scale. Defaults to the built-in amber.
  final ColorScale? warning;

  /// Success / positive color scale. Defaults to the built-in green.
  final ColorScale? success;

  /// Font family applied to all [MihrTypography] styles.
  ///
  /// Ignored when [typography] is provided.
  final String fontFamily;

  /// Fully custom typography. When non-null, wins over [fontFamily].
  final MihrTypography? typography;

  /// Unified button theme covering shape, shadows, and per-variant
  /// style overrides.
  final MihrButtonThemeData? buttonTheme;

  /// Additional [ThemeExtension]s to register on the produced
  /// [ThemeData].
  ///
  /// Enables forward-compatibility with future Mihr component theme
  /// extensions (e.g. `MihrInputThemeData`, `MihrCardThemeData`) without
  /// expanding the constructor surface.
  final List<ThemeExtension<dynamic>> extraExtensions;

  /// Last-mile Material override pass.
  ///
  /// Runs after all Mihr defaults and extensions are applied. The
  /// returned [ThemeData] is what [MaterialApp] receives. Use
  /// `base.copyWith(...)` to tweak only specific fields while
  /// keeping the rest of Mihr's output intact.
  final ThemeData Function(ThemeData base)? materialOverrides;

  /// Returns a copy of this config with the given fields replaced.
  ///
  /// Passing `null` leaves the current value unchanged.
  MihrThemeConfig copyWith({
    ColorScale? brand,
    ColorScale? gray,
    ColorScale? error,
    ColorScale? warning,
    ColorScale? success,
    String? fontFamily,
    MihrTypography? typography,
    MihrButtonThemeData? buttonTheme,
    List<ThemeExtension<dynamic>>? extraExtensions,
    ThemeData Function(ThemeData base)? materialOverrides,
  }) {
    return MihrThemeConfig(
      brand: brand ?? this.brand,
      gray: gray ?? this.gray,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
      fontFamily: fontFamily ?? this.fontFamily,
      typography: typography ?? this.typography,
      buttonTheme: buttonTheme ?? this.buttonTheme,
      extraExtensions: extraExtensions ?? this.extraExtensions,
      materialOverrides: materialOverrides ?? this.materialOverrides,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MihrThemeConfig &&
        other.brand == brand &&
        other.gray == gray &&
        other.error == error &&
        other.warning == warning &&
        other.success == success &&
        other.fontFamily == fontFamily &&
        other.typography == typography &&
        other.buttonTheme == buttonTheme &&
        _listEquals(other.extraExtensions, extraExtensions) &&
        other.materialOverrides == materialOverrides;
  }

  @override
  int get hashCode => Object.hash(
        brand,
        gray,
        error,
        warning,
        success,
        fontFamily,
        typography,
        buttonTheme,
        Object.hashAll(extraExtensions),
        materialOverrides,
      );

  static bool _listEquals<T>(List<T> a, List<T> b) {
    if (identical(a, b)) return true;
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}
