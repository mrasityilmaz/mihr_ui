import 'package:flutter/painting.dart';

import 'package:mihr_ui/core/theme/colors/color_scale.dart';

/// Core color palettes for the Mihr UI design system.
///
/// All values are extracted from the design reference source.
/// These are primitive color tokens — the raw palette values that
/// semantic tokens (TextColors, BackgroundColors, etc.) reference.
///
/// The system uses 5 core palettes:
/// - [brand]   — Primary brand color (default: purple). Replace to rebrand.
/// - [gray]    — Neutral palette for light mode UI.
/// - [grayDark] — Neutral palette optimized for dark mode contrast.
/// - [error]   — Destructive / error states (red).
/// - [warning] — Warning / caution states (amber).
/// - [success] — Positive / success states (green).
///
/// For accent colors (blue, teal, pink, etc.) see `accent_colors.dart`.
/// For gray variants (gray-blue, gray-cool, etc.) see `gray_variants.dart`.
class MihrColors {
  MihrColors._();

  /// Pure white (#FFFFFF).
  static const Color white = Color(0xFFFFFFFF);

  /// Pure black (#000000).
  static const Color black = Color(0xFF000000);

  /// Fully transparent color.
  static const Color transparent = Color(0x00000000);

  /// Primary brand palette (default: purple ~264° hue).
  ///
  /// Swap this [ColorScale] to change the entire brand identity.
  static const brand = ColorScale(
    shade25:  Color(0xFFFCFAFF),
    shade50:  Color(0xFFF9F5FF),
    shade100: Color(0xFFF4EBFF),
    shade200: Color(0xFFE9D7FE),
    shade300: Color(0xFFD6BBFB),
    shade400: Color(0xFFB692F6),
    shade500: Color(0xFF9E77ED),
    shade600: Color(0xFF7F56D9),
    shade700: Color(0xFF6941C6),
    shade800: Color(0xFF53389E),
    shade900: Color(0xFF42307D),
    shade950: Color(0xFF2C1C5F),
  );

  /// Neutral gray palette for light mode.
  ///
  /// Used for text, borders, backgrounds, dividers, and neutral elements.
  static const gray = ColorScale(
    shade25:  Color(0xFFFDFDFD),
    shade50:  Color(0xFFFAFAFA),
    shade100: Color(0xFFF5F5F5),
    shade200: Color(0xFFE9EAEB),
    shade300: Color(0xFFD5D7DA),
    shade400: Color(0xFFA4A7AE),
    shade500: Color(0xFF717680),
    shade600: Color(0xFF535862),
    shade700: Color(0xFF414651),
    shade800: Color(0xFF252B37),
    shade900: Color(0xFF181D27),
    shade950: Color(0xFF0A0D12),
  );

  /// Neutral gray palette optimized for dark mode contrast.
  ///
  /// Automatically used in place of [gray] when building dark themes.
  static const grayDark = ColorScale(
    shade25:  Color(0xFFFAFAFA),
    shade50:  Color(0xFFF7F7F7),
    shade100: Color(0xFFF0F0F1),
    shade200: Color(0xFFECECED),
    shade300: Color(0xFFCECFD2),
    shade400: Color(0xFF94979C),
    shade500: Color(0xFF85888E),
    shade600: Color(0xFF61656C),
    shade700: Color(0xFF373A41),
    shade800: Color(0xFF22262F),
    shade900: Color(0xFF13161B),
    shade950: Color(0xFF0C0E12),
  );

  /// Red palette for destructive actions and error states (~4° hue).
  static const error = ColorScale(
    shade25:  Color(0xFFFFFBFA),
    shade50:  Color(0xFFFEF3F2),
    shade100: Color(0xFFFEE4E2),
    shade200: Color(0xFFFECDCA),
    shade300: Color(0xFFFDA29B),
    shade400: Color(0xFFF97066),
    shade500: Color(0xFFF04438),
    shade600: Color(0xFFD92D20),
    shade700: Color(0xFFB42318),
    shade800: Color(0xFF912018),
    shade900: Color(0xFF7A271A),
    shade950: Color(0xFF55160C),
  );

  /// Amber palette for caution and warning states (~36° hue).
  static const warning = ColorScale(
    shade25:  Color(0xFFFFFCF5),
    shade50:  Color(0xFFFFFAEB),
    shade100: Color(0xFFFEF0C7),
    shade200: Color(0xFFFEDF89),
    shade300: Color(0xFFFEC84B),
    shade400: Color(0xFFFDB022),
    shade500: Color(0xFFF79009),
    shade600: Color(0xFFDC6803),
    shade700: Color(0xFFB54708),
    shade800: Color(0xFF93370D),
    shade900: Color(0xFF7A2E0E),
    shade950: Color(0xFF4E1D09),
  );

  /// Green palette for positive and success states (~156° hue).
  static const success = ColorScale(
    shade25:  Color(0xFFF6FEF9),
    shade50:  Color(0xFFECFDF3),
    shade100: Color(0xFFDCFAE6),
    shade200: Color(0xFFABEFC6),
    shade300: Color(0xFF75E0A7),
    shade400: Color(0xFF47CD89),
    shade500: Color(0xFF17B26A),
    shade600: Color(0xFF079455),
    shade700: Color(0xFF067647),
    shade800: Color(0xFF085D3A),
    shade900: Color(0xFF074D31),
    shade950: Color(0xFF053321),
  );
}
