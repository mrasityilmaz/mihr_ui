// The deprecated positional parameters on MihrTheme.light/dark are
// intentionally retained through the 0.1.x line to give consumers a
// grace period. The versioned ignore is per-package policy.
// ignore_for_file: remove_deprecations_in_breaking_versions

import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart'
    show MihrButtonSize;
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/colors/alpha_colors.dart';
import 'package:mihr_ui/core/theme/colors/background_colors.dart';
import 'package:mihr_ui/core/theme/colors/border_colors.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/component_colors.dart';
import 'package:mihr_ui/core/theme/colors/foreground_colors.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';
import 'package:mihr_ui/core/theme/colors/text_colors.dart';
import 'package:mihr_ui/core/theme/colors/utility_colors.dart';
import 'package:mihr_ui/core/theme/mihr_theme_config.dart';
import 'package:mihr_ui/core/theme/radius/mihr_radius.dart';
import 'package:mihr_ui/core/theme/typography/mihr_typography.dart';

/// Central theme factory for the Mihr UI design system.
///
/// Produces a fully wired [ThemeData] with semantic [ThemeExtension]s,
/// Material widget themes, a complete [ColorScheme], and
/// production-ready defaults for light and dark modes.
///
/// The canonical API takes a single [MihrThemeConfig] preset so apps
/// can centralize every customization in one shareable value.
///
/// ## Basic usage
///
/// ```dart
/// MaterialApp(
///   theme: MihrTheme.light(),
///   darkTheme: MihrTheme.dark(),
/// );
/// ```
///
/// ## Custom preset
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
///
/// MaterialApp(
///   theme: MihrTheme.light(config: cfg),
///   darkTheme: MihrTheme.dark(config: cfg),
/// );
/// ```
///
/// ## Material escape-hatch
///
/// For Material properties Mihr does not model semantically (e.g.
/// [ThemeData.scaffoldBackgroundColor], [AppBarTheme.centerTitle]),
/// use [MihrThemeConfig.materialOverrides]:
///
/// ```dart
/// MihrThemeConfig(
///   materialOverrides: (base) => base.copyWith(
///     scaffoldBackgroundColor: base.bgColors.secondary,
///     appBarTheme: base.appBarTheme.copyWith(centerTitle: true),
///   ),
/// );
/// ```
///
/// See also: [MihrThemeDataExtension] for the `base.bgColors` / etc.
/// getters available inside `materialOverrides`.
class MihrTheme {
  MihrTheme._();

  static const double _defaultRadius = MihrRadius.md;
  static const double _cardRadius = MihrRadius.xl;
  static const double _sheetRadius = MihrRadius.xxl;
  static const double _chipRadius = MihrRadius.xxl;
  static const double _fabRadius = MihrRadius.xl;

  /// Builds a light-mode [ThemeData] from the given [config].
  ///
  /// The legacy named parameters ([brand], [gray], ..., [buttonTheme])
  /// are retained for backward compatibility and forward into [config]
  /// when non-null. They are scheduled for removal in 0.2.0 — migrate
  /// to [MihrThemeConfig].
  static ThemeData light({
    MihrThemeConfig config = const MihrThemeConfig(),
    @Deprecated('Use MihrThemeConfig.brand. Removed in 0.2.0.')
    ColorScale? brand,
    @Deprecated('Use MihrThemeConfig.gray. Removed in 0.2.0.') ColorScale? gray,
    @Deprecated('Use MihrThemeConfig.error. Removed in 0.2.0.')
    ColorScale? error,
    @Deprecated('Use MihrThemeConfig.warning. Removed in 0.2.0.')
    ColorScale? warning,
    @Deprecated('Use MihrThemeConfig.success. Removed in 0.2.0.')
    ColorScale? success,
    @Deprecated('Use MihrThemeConfig.fontFamily. Removed in 0.2.0.')
    String? fontFamily,
    @Deprecated('Use MihrThemeConfig.buttonTheme. Removed in 0.2.0.')
    MihrButtonThemeData? buttonTheme,
  }) {
    return _buildThemeData(
      _mergeLegacy(
        config,
        brand: brand,
        gray: gray,
        error: error,
        warning: warning,
        success: success,
        fontFamily: fontFamily,
        buttonTheme: buttonTheme,
      ),
      Brightness.light,
    );
  }

  /// Builds a dark-mode [ThemeData] from the given [config].
  ///
  /// See [light] for parameter semantics. When `config.gray` is
  /// `null`, this uses [MihrColors.grayDark] for dark-optimized
  /// contrast.
  static ThemeData dark({
    MihrThemeConfig config = const MihrThemeConfig(),
    @Deprecated('Use MihrThemeConfig.brand. Removed in 0.2.0.')
    ColorScale? brand,
    @Deprecated('Use MihrThemeConfig.gray. Removed in 0.2.0.') ColorScale? gray,
    @Deprecated('Use MihrThemeConfig.error. Removed in 0.2.0.')
    ColorScale? error,
    @Deprecated('Use MihrThemeConfig.warning. Removed in 0.2.0.')
    ColorScale? warning,
    @Deprecated('Use MihrThemeConfig.success. Removed in 0.2.0.')
    ColorScale? success,
    @Deprecated('Use MihrThemeConfig.fontFamily. Removed in 0.2.0.')
    String? fontFamily,
    @Deprecated('Use MihrThemeConfig.buttonTheme. Removed in 0.2.0.')
    MihrButtonThemeData? buttonTheme,
  }) {
    return _buildThemeData(
      _mergeLegacy(
        config,
        brand: brand,
        gray: gray,
        error: error,
        warning: warning,
        success: success,
        fontFamily: fontFamily,
        buttonTheme: buttonTheme,
      ),
      Brightness.dark,
    );
  }

  /// Folds any non-null legacy parameter into a [MihrThemeConfig],
  /// leaving unrelated fields untouched.
  static MihrThemeConfig _mergeLegacy(
    MihrThemeConfig config, {
    ColorScale? brand,
    ColorScale? gray,
    ColorScale? error,
    ColorScale? warning,
    ColorScale? success,
    String? fontFamily,
    MihrButtonThemeData? buttonTheme,
  }) {
    final hasLegacy = brand != null ||
        gray != null ||
        error != null ||
        warning != null ||
        success != null ||
        fontFamily != null ||
        buttonTheme != null;
    if (!hasLegacy) return config;
    return config.copyWith(
      brand: brand,
      gray: gray,
      error: error,
      warning: warning,
      success: success,
      fontFamily: fontFamily,
      buttonTheme: buttonTheme,
    );
  }

  /// Builds a complete [ThemeData] for the given [brightness] and
  /// [config]. Runs [MihrThemeConfig.materialOverrides] as the last
  /// step so users can adjust any Material property on the final
  /// output.
  static ThemeData _buildThemeData(
    MihrThemeConfig config,
    Brightness brightness,
  ) {
    final isDark = brightness == Brightness.dark;
    final b = config.brand ?? MihrColors.brand;
    final g = config.gray ?? (isDark ? MihrColors.grayDark : MihrColors.gray);
    final e = config.error ?? MihrColors.error;
    final w = config.warning ?? MihrColors.warning;
    final s = config.success ?? MihrColors.success;

    final typo =
        config.typography ?? MihrTypography.fromFontFamily(config.fontFamily);

    final base = isDark
        ? _buildDark(config: config, typo: typo, b: b, g: g, e: e, w: w, s: s)
        : _buildLight(config: config, typo: typo, b: b, g: g, e: e, w: w, s: s);

    final overrides = config.materialOverrides;
    return overrides == null ? base : overrides(base);
  }

  // ──────────────────────────────────────────────────────────────────
  // Light
  // ──────────────────────────────────────────────────────────────────

  static ThemeData _buildLight({
    required MihrThemeConfig config,
    required MihrTypography typo,
    required ColorScale b,
    required ColorScale g,
    required ColorScale e,
    required ColorScale w,
    required ColorScale s,
  }) {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: b.shade600,
      onPrimary: MihrColors.white,
      primaryContainer: b.shade50,
      onPrimaryContainer: b.shade900,
      secondary: g.shade100,
      onSecondary: g.shade900,
      secondaryContainer: g.shade50,
      onSecondaryContainer: g.shade900,
      tertiary: b.shade500,
      onTertiary: MihrColors.white,
      tertiaryContainer: b.shade100,
      onTertiaryContainer: b.shade700,
      error: e.shade600,
      onError: MihrColors.white,
      errorContainer: e.shade50,
      onErrorContainer: e.shade700,
      surface: MihrColors.white,
      onSurface: g.shade900,
      surfaceDim: g.shade100,
      surfaceBright: MihrColors.white,
      surfaceContainerLowest: MihrColors.white,
      surfaceContainerLow: g.shade25,
      surfaceContainer: g.shade50,
      surfaceContainerHigh: g.shade100,
      surfaceContainerHighest: g.shade200,
      onSurfaceVariant: g.shade600,
      outline: g.shade300,
      outlineVariant: g.shade200,
      inverseSurface: g.shade950,
      onInverseSurface: g.shade50,
      inversePrimary: b.shade200,
      shadow: MihrColors.black,
      scrim: g.shade950,
      surfaceTint: Colors.transparent,
    );

    final textTheme = typo.toTextTheme().apply(
          bodyColor: g.shade900,
          displayColor: g.shade900,
        );

    final btnTheme = config.buttonTheme ?? const MihrButtonThemeData();
    final mdBase = MihrButtonDefaults.baseStyle(
      size: MihrButtonSize.md,
      shape: btnTheme.shape,
    );

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      fontFamily: typo.fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: MihrColors.white,
      splashFactory: InkSparkle.splashFactory,
      elevatedButtonTheme: ElevatedButtonThemeData(style: mdBase),
      outlinedButtonTheme: OutlinedButtonThemeData(style: mdBase),
      textButtonTheme: TextButtonThemeData(style: mdBase),
      appBarTheme: AppBarTheme(
        backgroundColor: MihrColors.white,
        foregroundColor: g.shade900,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: g.shade500),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: MihrColors.white,
        hintStyle: TextStyle(color: g.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: g.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: g.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: b.shade500, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: e.shade500),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: e.shade500, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: g.shade200),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
      ),
      cardTheme: CardThemeData(
        color: MihrColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
          side: BorderSide(color: g.shade200),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_sheetRadius),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: g.shade200, thickness: 1, space: 1),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return g.shade100;
          }
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return MihrColors.white;
        }),
        checkColor: const WidgetStatePropertyAll(MihrColors.white),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade100;
          }
          return null;
        }),
        side: BorderSide(color: g.shade300, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(MihrColors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade100;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade500;
          }
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade300;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade100;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade300;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade100;
          }
          return null;
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: b.shade50,
        labelStyle: TextStyle(color: b.shade700),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_chipRadius),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: b.shade600,
        foregroundColor: MihrColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_fabRadius),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: b.shade600,
        linearTrackColor: g.shade200,
        circularTrackColor: g.shade200,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: g.shade950,
        contentTextStyle: const TextStyle(color: MihrColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: g.shade950,
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        textStyle: const TextStyle(color: MihrColors.white),
      ),
      iconTheme: IconThemeData(color: g.shade400),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: b.shade600,
        selectionColor: b.shade100,
        selectionHandleColor: b.shade600,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: b.shade700,
        unselectedLabelColor: g.shade500,
        indicatorColor: b.shade600,
        dividerColor: g.shade200,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        indicatorColor: b.shade50,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: b.shade600);
          }
          return IconThemeData(color: g.shade400);
        }),
      ),
      drawerTheme: const DrawerThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: g.shade400,
        textColor: g.shade900,
      ),
      extensions: <ThemeExtension<dynamic>>[
        TextColors.light(brand: b, gray: g, error: e, warning: w, success: s),
        BackgroundColors.light(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        BorderColors.light(brand: b, gray: g, error: e),
        ForegroundColors.light(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        AlphaColors.light(),
        UtilityColors.light(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        ComponentColors.light(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        typo,
        btnTheme,
        ...config.extraExtensions.cast(),
      ],
    );
  }

  // ──────────────────────────────────────────────────────────────────
  // Dark
  // ──────────────────────────────────────────────────────────────────

  static ThemeData _buildDark({
    required MihrThemeConfig config,
    required MihrTypography typo,
    required ColorScale b,
    required ColorScale g,
    required ColorScale e,
    required ColorScale w,
    required ColorScale s,
  }) {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: b.shade500,
      onPrimary: MihrColors.white,
      primaryContainer: b.shade800,
      onPrimaryContainer: b.shade100,
      secondary: g.shade800,
      onSecondary: g.shade50,
      secondaryContainer: g.shade900,
      onSecondaryContainer: g.shade50,
      tertiary: b.shade400,
      onTertiary: MihrColors.white,
      tertiaryContainer: b.shade700,
      onTertiaryContainer: b.shade200,
      error: e.shade500,
      onError: MihrColors.white,
      errorContainer: e.shade950,
      onErrorContainer: e.shade200,
      surface: g.shade950,
      onSurface: g.shade50,
      surfaceDim: g.shade950,
      surfaceBright: g.shade800,
      surfaceContainerLowest: g.shade950,
      surfaceContainerLow: g.shade900,
      surfaceContainer: g.shade900,
      surfaceContainerHigh: g.shade800,
      surfaceContainerHighest: g.shade700,
      onSurfaceVariant: g.shade400,
      outline: g.shade700,
      outlineVariant: g.shade800,
      inverseSurface: g.shade50,
      onInverseSurface: g.shade950,
      inversePrimary: b.shade700,
      shadow: MihrColors.black,
      scrim: g.shade800,
      surfaceTint: Colors.transparent,
    );

    final textTheme = typo.toTextTheme().apply(
          bodyColor: g.shade50,
          displayColor: g.shade50,
        );

    final btnTheme = config.buttonTheme ?? const MihrButtonThemeData();
    final mdBase = MihrButtonDefaults.baseStyle(
      size: MihrButtonSize.md,
      shape: btnTheme.shape,
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      fontFamily: typo.fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: g.shade950,
      splashFactory: InkSparkle.splashFactory,
      elevatedButtonTheme: ElevatedButtonThemeData(style: mdBase),
      outlinedButtonTheme: OutlinedButtonThemeData(style: mdBase),
      textButtonTheme: TextButtonThemeData(style: mdBase),
      appBarTheme: AppBarTheme(
        backgroundColor: g.shade950,
        foregroundColor: g.shade50,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: g.shade400),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: g.shade950,
        hintStyle: TextStyle(color: g.shade500),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: g.shade700),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: g.shade700),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: b.shade400, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: e.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: e.shade400, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
          borderSide: BorderSide(color: g.shade800),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
      ),
      cardTheme: CardThemeData(
        color: g.shade900,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
          side: BorderSide(color: g.shade800),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: g.shade900,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: g.shade900,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_sheetRadius),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(color: g.shade800, thickness: 1, space: 1),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.disabled)) {
            return g.shade800;
          }
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade900;
        }),
        checkColor: const WidgetStatePropertyAll(MihrColors.white),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade800;
          }
          return null;
        }),
        side: BorderSide(color: g.shade700, width: 1.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: const WidgetStatePropertyAll(MihrColors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade800;
        }),
        trackOutlineColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade400;
          }
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade800;
          }
          return null;
        }),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade500;
          }
          return g.shade700;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade800;
          }
          return null;
        }),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: b.shade900,
        labelStyle: TextStyle(color: b.shade200),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_chipRadius),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: b.shade600,
        foregroundColor: MihrColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_fabRadius),
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: b.shade500,
        linearTrackColor: g.shade800,
        circularTrackColor: g.shade800,
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: g.shade200,
        contentTextStyle: TextStyle(color: g.shade900),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: g.shade900,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: g.shade200,
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        textStyle: TextStyle(color: g.shade950),
      ),
      iconTheme: IconThemeData(color: g.shade400),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: b.shade500,
        selectionColor: b.shade800,
        selectionHandleColor: b.shade500,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: g.shade50,
        unselectedLabelColor: g.shade500,
        indicatorColor: b.shade500,
        dividerColor: g.shade800,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: g.shade950,
        surfaceTintColor: Colors.transparent,
        indicatorColor: b.shade900,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(color: b.shade400);
          }
          return IconThemeData(color: g.shade400);
        }),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: g.shade950,
        surfaceTintColor: Colors.transparent,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: g.shade400,
        textColor: g.shade50,
      ),
      extensions: <ThemeExtension<dynamic>>[
        TextColors.dark(gray: g, error: e, warning: w, success: s),
        BackgroundColors.dark(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        BorderColors.dark(brand: b, gray: g, error: e),
        ForegroundColors.dark(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        AlphaColors.dark(),
        UtilityColors.dark(brand: b, gray: g, error: e, warning: w, success: s),
        ComponentColors.dark(
          brand: b,
          gray: g,
          error: e,
          warning: w,
          success: s,
        ),
        typo,
        btnTheme,
        ...config.extraExtensions.cast(),
      ],
    );
  }
}

/// Convenience extensions for accessing Mihr semantic tokens from a
/// [BuildContext].
///
/// ```dart
/// Container(color: context.bgColors.brandSolid);
/// Text('Hi', style: context.typography.textMd.semibold);
/// ```
extension MihrThemeExtension on BuildContext {
  /// Semantic text color tokens (23 tokens).
  TextColors get textColors => Theme.of(this).extension<TextColors>()!;

  /// Semantic background color tokens (32 tokens).
  BackgroundColors get bgColors =>
      Theme.of(this).extension<BackgroundColors>()!;

  /// Semantic border color tokens (10 tokens).
  BorderColors get borderColors => Theme.of(this).extension<BorderColors>()!;

  /// Semantic foreground/icon color tokens (21 tokens).
  ForegroundColors get fgColors =>
      Theme.of(this).extension<ForegroundColors>()!;

  /// White/black opacity tokens (20 tokens).
  AlphaColors get alphaColors => Theme.of(this).extension<AlphaColors>()!;

  /// Multi-color utility tokens for badges, tags, and charts.
  UtilityColors get utilityColors => Theme.of(this).extension<UtilityColors>()!;

  /// Component-specific color tokens (29 tokens).
  ComponentColors get componentColors =>
      Theme.of(this).extension<ComponentColors>()!;

  /// Typography theme with font-family-resolved [TypeStyle] instances.
  MihrTypography get typography => Theme.of(this).extension<MihrTypography>()!;

  /// Mihr button theme overrides, or `null` if none registered.
  MihrButtonThemeData? get mihrButtonTheme =>
      Theme.of(this).extension<MihrButtonThemeData>();
}

/// Convenience extensions for accessing Mihr semantic tokens directly
/// from a [ThemeData].
///
/// Mirrors the [BuildContext] getters so tokens remain ergonomic
/// inside [MihrThemeConfig.materialOverrides], tests, and any context
/// where only a [ThemeData] is available:
///
/// ```dart
/// MihrThemeConfig(
///   materialOverrides: (base) => base.copyWith(
///     scaffoldBackgroundColor: base.bgColors.secondary,
///     appBarTheme: base.appBarTheme.copyWith(
///       backgroundColor: base.bgColors.brandSolid,
///       foregroundColor: base.textColors.white,
///     ),
///   ),
/// );
/// ```
extension MihrThemeDataExtension on ThemeData {
  /// Semantic text color tokens (23 tokens).
  TextColors get textColors => extension<TextColors>()!;

  /// Semantic background color tokens (32 tokens).
  BackgroundColors get bgColors => extension<BackgroundColors>()!;

  /// Semantic border color tokens (10 tokens).
  BorderColors get borderColors => extension<BorderColors>()!;

  /// Semantic foreground/icon color tokens (21 tokens).
  ForegroundColors get fgColors => extension<ForegroundColors>()!;

  /// White/black opacity tokens (20 tokens).
  AlphaColors get alphaColors => extension<AlphaColors>()!;

  /// Multi-color utility tokens for badges, tags, and charts.
  UtilityColors get utilityColors => extension<UtilityColors>()!;

  /// Component-specific color tokens (29 tokens).
  ComponentColors get componentColors => extension<ComponentColors>()!;

  /// Mihr typography theme with font-family-resolved [TypeStyle]s.
  ///
  /// Named `mihrTypography` to avoid collision with the built-in
  /// Material [ThemeData.typography] (which returns a Material
  /// [Typography], not [MihrTypography]).
  MihrTypography get mihrTypography => extension<MihrTypography>()!;

  /// Mihr button theme overrides, or `null` if none registered.
  MihrButtonThemeData? get mihrButtonTheme => extension<MihrButtonThemeData>();
}
