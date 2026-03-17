import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart';
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
import 'package:mihr_ui/core/theme/radius/mihr_radius.dart';
import 'package:mihr_ui/core/theme/typography/mihr_typography.dart';

/// Central theme configuration for the Mihr UI design system.
///
/// Provides [light] and [dark] factory methods that wire all semantic
/// color tokens into Flutter's [ThemeData] via [ThemeExtension], and
/// provide structural styling for Material buttons via
/// [MihrButtonDefaults.baseStyle].
///
/// ## Basic usage
/// ```dart
/// MaterialApp(
///   theme: MihrTheme.light(),
///   darkTheme: MihrTheme.dark(),
///   child: MyApp(),
/// );
/// ```
///
/// ## Custom brand color
/// ```dart
/// final myBrand = ColorScaleGenerator.fromHex('#E63946');
/// MaterialApp(
///   theme: MihrTheme.light(brand: myBrand),
///   darkTheme: MihrTheme.dark(brand: myBrand),
/// );
/// ```
///
/// ## Custom button shape
/// ```dart
/// MihrTheme.light(
///   brand: myBrand,
///   buttonTheme: MihrButtonThemeData(
///     shape: RoundedRectangleBorder(
///       borderRadius: BorderRadius.circular(12),
///     ),
///   ),
/// )
/// ```
class MihrTheme {
  MihrTheme._();

  static const _defaultRadius = MihrRadius.md;
  static const _cardRadius = MihrRadius.xl;
  static const _sheetRadius = MihrRadius.xxl;
  static const _chipRadius = MihrRadius.xxl;
  static const _fabRadius = MihrRadius.xl;

  /// Creates a light mode [ThemeData] with all semantic extensions.
  ///
  /// [brand] — Override the brand color scale. Default: purple.
  /// [gray] — Override the neutral gray scale.
  /// [error] — Override error colors.
  /// [warning] — Override warning colors.
  /// [success] — Override success colors.
  /// [fontFamily] — Override the font family. Default: 'Inter'.
  /// [buttonTheme] — Override button shape, shadows, sizes, or
  ///   per-variant styles.
  static ThemeData light({
    ColorScale? brand,
    ColorScale? gray,
    ColorScale? error,
    ColorScale? warning,
    ColorScale? success,
    String fontFamily = MihrTypography.defaultFontFamily,
    MihrButtonThemeData? buttonTheme,
  }) {
    final b = brand ?? MihrColors.brand;
    final g = gray ?? MihrColors.gray;
    final e = error ?? MihrColors.error;
    final w = warning ?? MihrColors.warning;
    final s = success ?? MihrColors.success;

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

    final baseTextTheme =
        MihrTypography.textTheme(fontFamily: fontFamily);
    final textTheme = baseTextTheme.apply(
      bodyColor: g.shade900,
      displayColor: g.shade900,
    );

    // Structural button base (shared by Material buttons)
    final btnTheme = buttonTheme ?? const MihrButtonThemeData();
    final sizes = btnTheme.sizes ?? MihrButtonSizes();
    final mdBase = MihrButtonDefaults.baseStyle(
      sizeData: sizes.md,
      shape: btnTheme.shape,
    );

    return ThemeData(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: MihrColors.white,
      splashFactory: InkSparkle.splashFactory,

      // -- Material buttons: structural base, colors from ColorScheme --
      elevatedButtonTheme: ElevatedButtonThemeData(style: mdBase),
      outlinedButtonTheme: OutlinedButtonThemeData(style: mdBase),
      textButtonTheme: TextButtonThemeData(style: mdBase),

      // -- AppBar --
      appBarTheme: AppBarTheme(
        backgroundColor: MihrColors.white,
        foregroundColor: g.shade900,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: g.shade500),
      ),

      // -- Input / TextField --
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

      // -- Card --
      cardTheme: CardThemeData(
        color: MihrColors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
          side: BorderSide(color: g.shade200),
        ),
      ),

      // -- Dialog --
      dialogTheme: DialogThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
      ),

      // -- Bottom Sheet --
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_sheetRadius),
          ),
        ),
      ),

      // -- Divider --
      dividerTheme: DividerThemeData(
        color: g.shade200,
        thickness: 1,
        space: 1,
      ),

      // -- Checkbox --
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
        checkColor:
            const WidgetStatePropertyAll(MihrColors.white),
        overlayColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade100;
          }
          return null;
        }),
        side: BorderSide(color: g.shade300, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // -- Switch --
      switchTheme: SwitchThemeData(
        thumbColor:
            const WidgetStatePropertyAll(MihrColors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade100;
        }),
        trackOutlineColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade500;
          }
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade300;
        }),
        overlayColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade100;
          }
          return null;
        }),
      ),

      // -- Radio --
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade300;
        }),
        overlayColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade100;
          }
          return null;
        }),
      ),

      // -- Chip --
      chipTheme: ChipThemeData(
        backgroundColor: b.shade50,
        labelStyle: TextStyle(color: b.shade700),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_chipRadius),
        ),
      ),

      // -- FAB --
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: b.shade600,
        foregroundColor: MihrColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_fabRadius),
        ),
      ),

      // -- Progress Indicator --
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: b.shade600,
        linearTrackColor: g.shade200,
        circularTrackColor: g.shade200,
      ),

      // -- SnackBar --
      snackBarTheme: SnackBarThemeData(
        backgroundColor: g.shade950,
        contentTextStyle:
            const TextStyle(color: MihrColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // -- Popup Menu --
      popupMenuTheme: PopupMenuThemeData(
        color: MihrColors.white,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
      ),

      // -- Tooltip --
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: g.shade950,
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        textStyle: const TextStyle(color: MihrColors.white),
      ),

      // -- Icon --
      iconTheme: IconThemeData(color: g.shade400),

      // -- Text Selection --
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: b.shade600,
        selectionColor: b.shade100,
        selectionHandleColor: b.shade600,
      ),

      // -- Tab Bar --
      tabBarTheme: TabBarThemeData(
        labelColor: b.shade700,
        unselectedLabelColor: g.shade500,
        indicatorColor: b.shade600,
        dividerColor: g.shade200,
      ),

      // -- Navigation Bar --
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

      // -- Drawer --
      drawerTheme: const DrawerThemeData(
        backgroundColor: MihrColors.white,
        surfaceTintColor: Colors.transparent,
      ),

      // -- ListTile --
      listTileTheme: ListTileThemeData(
        iconColor: g.shade400,
        textColor: g.shade900,
      ),

      // -- Semantic extensions --
      extensions: [
        TextColors.light(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        BackgroundColors.light(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        BorderColors.light(brand: b, gray: g, error: e),
        ForegroundColors.light(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        AlphaColors.light(),
        UtilityColors.light(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        ComponentColors.light(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        btnTheme,
      ],
    );
  }

  /// Creates a dark mode [ThemeData] with all semantic extensions.
  ///
  /// Uses [MihrColors.grayDark] by default for dark-mode-optimized grays.
  static ThemeData dark({
    ColorScale? brand,
    ColorScale? gray,
    ColorScale? error,
    ColorScale? warning,
    ColorScale? success,
    String fontFamily = MihrTypography.defaultFontFamily,
    MihrButtonThemeData? buttonTheme,
  }) {
    final b = brand ?? MihrColors.brand;
    final g = gray ?? MihrColors.grayDark;
    final e = error ?? MihrColors.error;
    final w = warning ?? MihrColors.warning;
    final s = success ?? MihrColors.success;

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

    final baseTextTheme =
        MihrTypography.textTheme(fontFamily: fontFamily);
    final textTheme = baseTextTheme.apply(
      bodyColor: g.shade50,
      displayColor: g.shade50,
    );

    final btnTheme = buttonTheme ?? const MihrButtonThemeData();
    final sizes = btnTheme.sizes ?? MihrButtonSizes();
    final mdBase = MihrButtonDefaults.baseStyle(
      sizeData: sizes.md,
      shape: btnTheme.shape,
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      fontFamily: fontFamily,
      textTheme: textTheme,
      scaffoldBackgroundColor: g.shade950,
      splashFactory: InkSparkle.splashFactory,

      // -- Material buttons: structural base, colors from ColorScheme --
      elevatedButtonTheme: ElevatedButtonThemeData(style: mdBase),
      outlinedButtonTheme: OutlinedButtonThemeData(style: mdBase),
      textButtonTheme: TextButtonThemeData(style: mdBase),

      // -- AppBar --
      appBarTheme: AppBarTheme(
        backgroundColor: g.shade950,
        foregroundColor: g.shade50,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: g.shade400),
      ),

      // -- Input / TextField --
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

      // -- Card --
      cardTheme: CardThemeData(
        color: g.shade900,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
          side: BorderSide(color: g.shade800),
        ),
      ),

      // -- Dialog --
      dialogTheme: DialogThemeData(
        backgroundColor: g.shade900,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_cardRadius),
        ),
      ),

      // -- Bottom Sheet --
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: g.shade900,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(_sheetRadius),
          ),
        ),
      ),

      // -- Divider --
      dividerTheme: DividerThemeData(
        color: g.shade800,
        thickness: 1,
        space: 1,
      ),

      // -- Checkbox --
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
        checkColor:
            const WidgetStatePropertyAll(MihrColors.white),
        overlayColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade800;
          }
          return null;
        }),
        side: BorderSide(color: g.shade700, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),

      // -- Switch --
      switchTheme: SwitchThemeData(
        thumbColor:
            const WidgetStatePropertyAll(MihrColors.white),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade600;
          }
          return g.shade800;
        }),
        trackOutlineColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade400;
          }
          if (states.contains(WidgetState.selected)) {
            return Colors.transparent;
          }
          return Colors.transparent;
        }),
        overlayColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade800;
          }
          return null;
        }),
      ),

      // -- Radio --
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return b.shade500;
          }
          return g.shade700;
        }),
        overlayColor:
            WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return b.shade800;
          }
          return null;
        }),
      ),

      // -- Chip --
      chipTheme: ChipThemeData(
        backgroundColor: b.shade900,
        labelStyle: TextStyle(color: b.shade200),
        side: BorderSide.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_chipRadius),
        ),
      ),

      // -- FAB --
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: b.shade600,
        foregroundColor: MihrColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_fabRadius),
        ),
      ),

      // -- Progress Indicator --
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: b.shade500,
        linearTrackColor: g.shade800,
        circularTrackColor: g.shade800,
      ),

      // -- SnackBar --
      snackBarTheme: SnackBarThemeData(
        backgroundColor: g.shade200,
        contentTextStyle: TextStyle(color: g.shade900),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // -- Popup Menu --
      popupMenuTheme: PopupMenuThemeData(
        color: g.shade900,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
      ),

      // -- Tooltip --
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: g.shade200,
          borderRadius: BorderRadius.circular(_defaultRadius),
        ),
        textStyle: TextStyle(color: g.shade950),
      ),

      // -- Icon --
      iconTheme: IconThemeData(color: g.shade400),

      // -- Text Selection --
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: b.shade500,
        selectionColor: b.shade800,
        selectionHandleColor: b.shade500,
      ),

      // -- Tab Bar --
      tabBarTheme: TabBarThemeData(
        labelColor: g.shade50,
        unselectedLabelColor: g.shade500,
        indicatorColor: b.shade500,
        dividerColor: g.shade800,
      ),

      // -- Navigation Bar --
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

      // -- Drawer --
      drawerTheme: DrawerThemeData(
        backgroundColor: g.shade950,
        surfaceTintColor: Colors.transparent,
      ),

      // -- ListTile --
      listTileTheme: ListTileThemeData(
        iconColor: g.shade400,
        textColor: g.shade50,
      ),

      // -- Semantic extensions --
      extensions: [
        TextColors.dark(
          gray: g, error: e, warning: w, success: s,
        ),
        BackgroundColors.dark(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        BorderColors.dark(brand: b, gray: g, error: e),
        ForegroundColors.dark(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        AlphaColors.dark(),
        UtilityColors.dark(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        ComponentColors.dark(
          brand: b, gray: g, error: e, warning: w, success: s,
        ),
        btnTheme,
      ],
    );
  }
}

/// Convenience extensions for accessing semantic tokens
/// from [BuildContext].
extension MihrThemeExtension on BuildContext {
  /// Semantic text color tokens (23 tokens).
  TextColors get textColors =>
      Theme.of(this).extension<TextColors>()!;

  /// Semantic background color tokens (32 tokens).
  BackgroundColors get bgColors =>
      Theme.of(this).extension<BackgroundColors>()!;

  /// Semantic border color tokens (10 tokens).
  BorderColors get borderColors =>
      Theme.of(this).extension<BorderColors>()!;

  /// Semantic foreground/icon color tokens (21 tokens).
  ForegroundColors get fgColors =>
      Theme.of(this).extension<ForegroundColors>()!;

  /// White/black opacity tokens (20 tokens).
  AlphaColors get alphaColors =>
      Theme.of(this).extension<AlphaColors>()!;

  /// Multi-color utility tokens for badges, tags, and charts.
  UtilityColors get utilityColors =>
      Theme.of(this).extension<UtilityColors>()!;

  /// Component-specific color tokens (29 tokens).
  ComponentColors get componentColors =>
      Theme.of(this).extension<ComponentColors>()!;

  /// Mihr button theme overrides, or `null` if none registered.
  MihrButtonThemeData? get mihrButtonTheme =>
      Theme.of(this).extension<MihrButtonThemeData>();
}
