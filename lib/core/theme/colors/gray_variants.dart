import 'package:flutter/painting.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart' show MihrTheme;
import 'package:mihr_ui/mihr_ui.dart' show MihrTheme;

/// Alternative gray (neutral) palettes for different design moods.
///
/// Mihr UI provides 7 gray variants beyond the default.
/// Swap these into [MihrTheme] to change the neutral tone of your entire UI.
///
/// Each variant has a different undertone:
/// - [grayBlue]    — Blue undertone, professional/corporate feel
/// - [grayCool]    — Cool blue undertone, modern/tech feel
/// - [grayModern]  — Slightly cool, balanced/contemporary
/// - [grayNeutral] — Pure neutral, versatile
/// - [grayIron]    — Slight violet undertone, sleek
/// - [grayTrue]    — True achromatic gray, no undertone
/// - [grayWarm]    — Warm brown/beige undertone, friendly/organic
class GrayVariants {
  GrayVariants._();

  /// Gray with blue undertone — professional, corporate feel.
  static const grayBlue = ColorScale(
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

  /// Gray with cool blue undertone — modern, tech feel.
  static const grayCool = ColorScale(
    shade25: Color(0xFFFCFCFD),
    shade50: Color(0xFFF9F9FB),
    shade100: Color(0xFFEFF1F5),
    shade200: Color(0xFFDCDFEA),
    shade300: Color(0xFFB9C0D4),
    shade400: Color(0xFF7D89B0),
    shade500: Color(0xFF5D6B98),
    shade600: Color(0xFF4A5578),
    shade700: Color(0xFF404968),
    shade800: Color(0xFF30374F),
    shade900: Color(0xFF111322),
    shade950: Color(0xFF0E101B),
  );

  /// Gray slightly cool — balanced, contemporary feel.
  static const grayModern = ColorScale(
    shade25: Color(0xFFFCFCFD),
    shade50: Color(0xFFF8FAFC),
    shade100: Color(0xFFEEF2F6),
    shade200: Color(0xFFE3E8EF),
    shade300: Color(0xFFCDD5DF),
    shade400: Color(0xFF9AA4B2),
    shade500: Color(0xFF697586),
    shade600: Color(0xFF4B5565),
    shade700: Color(0xFF364152),
    shade800: Color(0xFF202939),
    shade900: Color(0xFF121926),
    shade950: Color(0xFF0D121C),
  );

  /// Pure neutral gray — no undertone, versatile.
  static const grayNeutral = ColorScale(
    shade25: Color(0xFFFCFCFD),
    shade50: Color(0xFFF9FAFB),
    shade100: Color(0xFFF3F4F6),
    shade200: Color(0xFFE5E7EB),
    shade300: Color(0xFFD2D6DB),
    shade400: Color(0xFF9DA4AE),
    shade500: Color(0xFF6C737F),
    shade600: Color(0xFF4D5761),
    shade700: Color(0xFF384250),
    shade800: Color(0xFF1F2A37),
    shade900: Color(0xFF111927),
    shade950: Color(0xFF0D121C),
  );

  /// Gray with slight violet undertone — sleek, modern.
  static const grayIron = ColorScale(
    shade25: Color(0xFFFCFCFC),
    shade50: Color(0xFFFAFAFA),
    shade100: Color(0xFFF4F4F5),
    shade200: Color(0xFFE4E4E7),
    shade300: Color(0xFFD1D1D6),
    shade400: Color(0xFFA0A0AB),
    shade500: Color(0xFF70707B),
    shade600: Color(0xFF51525C),
    shade700: Color(0xFF3F3F46),
    shade800: Color(0xFF26272B),
    shade900: Color(0xFF1A1A1E),
    shade950: Color(0xFF131316),
  );

  /// True achromatic gray — completely neutral, no color cast.
  static const grayTrue = ColorScale(
    shade25: Color(0xFFFCFCFC),
    shade50: Color(0xFFF7F7F7),
    shade100: Color(0xFFF5F5F5),
    shade200: Color(0xFFE5E5E5),
    shade300: Color(0xFFD6D6D6),
    shade400: Color(0xFFA3A3A3),
    shade500: Color(0xFF737373),
    shade600: Color(0xFF525252),
    shade700: Color(0xFF424242),
    shade800: Color(0xFF292929),
    shade900: Color(0xFF141414),
    shade950: Color(0xFF0F0F0F),
  );

  /// Gray with warm brown/beige undertone — friendly, organic feel.
  static const grayWarm = ColorScale(
    shade25: Color(0xFFFDFDFC),
    shade50: Color(0xFFFAFAF9),
    shade100: Color(0xFFF5F5F4),
    shade200: Color(0xFFE7E5E4),
    shade300: Color(0xFFD7D3D0),
    shade400: Color(0xFFA9A29D),
    shade500: Color(0xFF79716B),
    shade600: Color(0xFF57534E),
    shade700: Color(0xFF44403C),
    shade800: Color(0xFF292524),
    shade900: Color(0xFF1C1917),
    shade950: Color(0xFF171412),
  );
}
