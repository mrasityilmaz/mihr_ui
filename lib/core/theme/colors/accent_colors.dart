import 'package:flutter/painting.dart';

import 'package:mihr_ui/core/theme/colors/color_scale.dart';

/// Accent color palettes for decorative and supplementary UI elements.
///
/// These are used for badges, labels, tags, charts, avatars, and any
/// element that needs color variety beyond the core brand/semantic colors.
///
/// All values from the design reference — organized by hue family.
class AccentColors {
  AccentColors._();

  // ---------------------------------------------------------------------------
  // GREENS
  // ---------------------------------------------------------------------------

  /// Moss green — muted, earthy green for natural or organic accents.
  static const moss = ColorScale(
    shade25:  Color(0xFFFAFDF7),
    shade50:  Color(0xFFF5FBEE),
    shade100: Color(0xFFE6F4D7),
    shade200: Color(0xFFCEEAB0),
    shade300: Color(0xFFACDC79),
    shade400: Color(0xFF86CB3C),
    shade500: Color(0xFF669F2A),
    shade600: Color(0xFF4F7A21),
    shade700: Color(0xFF3F621A),
    shade800: Color(0xFF335015),
    shade900: Color(0xFF2B4212),
    shade950: Color(0xFF1A280B),
  );

  /// Light green — bright, vivid green for fresh highlights.
  static const greenLight = ColorScale(
    shade25:  Color(0xFFFAFEF5),
    shade50:  Color(0xFFF3FEE7),
    shade100: Color(0xFFE3FBCC),
    shade200: Color(0xFFD0F8AB),
    shade300: Color(0xFFA6EF67),
    shade400: Color(0xFF85E13A),
    shade500: Color(0xFF66C61C),
    shade600: Color(0xFF4CA30D),
    shade700: Color(0xFF3B7C0F),
    shade800: Color(0xFF326212),
    shade900: Color(0xFF2B5314),
    shade950: Color(0xFF15290A),
  );

  /// Green — standard green for positive/success accents.
  static const green = ColorScale(
    shade25:  Color(0xFFF6FEF9),
    shade50:  Color(0xFFEDFCF2),
    shade100: Color(0xFFD3F8DF),
    shade200: Color(0xFFAAF0C4),
    shade300: Color(0xFF73E2A3),
    shade400: Color(0xFF3CCB7F),
    shade500: Color(0xFF16B364),
    shade600: Color(0xFF099250),
    shade700: Color(0xFF087443),
    shade800: Color(0xFF095C37),
    shade900: Color(0xFF084C2E),
    shade950: Color(0xFF052E1C),
  );

  /// Teal — blue-green for calm, trustworthy accents.
  static const teal = ColorScale(
    shade25:  Color(0xFFF6FEFC),
    shade50:  Color(0xFFF0FDF9),
    shade100: Color(0xFFCCFBEF),
    shade200: Color(0xFF99F6E0),
    shade300: Color(0xFF5FE9D0),
    shade400: Color(0xFF2ED3B7),
    shade500: Color(0xFF15B79E),
    shade600: Color(0xFF0E9384),
    shade700: Color(0xFF107569),
    shade800: Color(0xFF125D56),
    shade900: Color(0xFF134E48),
    shade950: Color(0xFF0A2926),
  );

  // ---------------------------------------------------------------------------
  // CYANS & BLUES
  // ---------------------------------------------------------------------------

  /// Cyan — bright aqua for informational and tech-forward accents.
  static const cyan = ColorScale(
    shade25:  Color(0xFFF5FEFF),
    shade50:  Color(0xFFECFDFF),
    shade100: Color(0xFFCFF9FE),
    shade200: Color(0xFFA5F0FC),
    shade300: Color(0xFF67E3F9),
    shade400: Color(0xFF22CCEE),
    shade500: Color(0xFF06AED4),
    shade600: Color(0xFF088AB2),
    shade700: Color(0xFF0E7090),
    shade800: Color(0xFF155B75),
    shade900: Color(0xFF164C63),
    shade950: Color(0xFF0D2D3A),
  );

  /// Light blue — sky-toned for soft informational highlights.
  static const blueLight = ColorScale(
    shade25:  Color(0xFFF5FBFF),
    shade50:  Color(0xFFF0F9FF),
    shade100: Color(0xFFE0F2FE),
    shade200: Color(0xFFB9E6FE),
    shade300: Color(0xFF7CD4FD),
    shade400: Color(0xFF36BFFA),
    shade500: Color(0xFF0BA5EC),
    shade600: Color(0xFF0086C9),
    shade700: Color(0xFF026AA2),
    shade800: Color(0xFF065986),
    shade900: Color(0xFF0B4A6F),
    shade950: Color(0xFF062C41),
  );

  /// Blue — standard blue for links, info badges, and selections.
  static const blue = ColorScale(
    shade25:  Color(0xFFF5FAFF),
    shade50:  Color(0xFFEFF8FF),
    shade100: Color(0xFFD1E9FF),
    shade200: Color(0xFFB2DDFF),
    shade300: Color(0xFF84CAFF),
    shade400: Color(0xFF53B1FD),
    shade500: Color(0xFF2E90FA),
    shade600: Color(0xFF1570EF),
    shade700: Color(0xFF175CD3),
    shade800: Color(0xFF1849A9),
    shade900: Color(0xFF194185),
    shade950: Color(0xFF102A56),
  );

  /// Dark blue — deep, saturated blue for bold accents.
  static const blueDark = ColorScale(
    shade25:  Color(0xFFF5F8FF),
    shade50:  Color(0xFFEFF4FF),
    shade100: Color(0xFFD1E0FF),
    shade200: Color(0xFFB2CCFF),
    shade300: Color(0xFF84ADFF),
    shade400: Color(0xFF528BFF),
    shade500: Color(0xFF2970FF),
    shade600: Color(0xFF155EEF),
    shade700: Color(0xFF004EEB),
    shade800: Color(0xFF0040C1),
    shade900: Color(0xFF00359E),
    shade950: Color(0xFF002266),
  );

  // ---------------------------------------------------------------------------
  // INDIGOS & VIOLETS
  // ---------------------------------------------------------------------------

  /// Indigo — deep blue-violet for premium and featured accents.
  static const indigo = ColorScale(
    shade25:  Color(0xFFF5F8FF),
    shade50:  Color(0xFFEEF4FF),
    shade100: Color(0xFFE0EAFF),
    shade200: Color(0xFFC7D7FE),
    shade300: Color(0xFFA4BCFD),
    shade400: Color(0xFF8098F9),
    shade500: Color(0xFF6172F3),
    shade600: Color(0xFF444CE7),
    shade700: Color(0xFF3538CD),
    shade800: Color(0xFF2D31A6),
    shade900: Color(0xFF2D3282),
    shade950: Color(0xFF1F235B),
  );

  /// Violet — rich purple for creative and expressive accents.
  static const violet = ColorScale(
    shade25:  Color(0xFFFBFAFF),
    shade50:  Color(0xFFF5F3FF),
    shade100: Color(0xFFECE9FE),
    shade200: Color(0xFFDDD6FE),
    shade300: Color(0xFFC3B5FD),
    shade400: Color(0xFFA48AFB),
    shade500: Color(0xFF875BF7),
    shade600: Color(0xFF7839EE),
    shade700: Color(0xFF6927DA),
    shade800: Color(0xFF5720B7),
    shade900: Color(0xFF491C96),
    shade950: Color(0xFF2E125E),
  );

  /// Purple — vivid purple similar to brand, for supplementary use.
  static const purple = ColorScale(
    shade25:  Color(0xFFFAFAFF),
    shade50:  Color(0xFFF4F3FF),
    shade100: Color(0xFFEBE9FE),
    shade200: Color(0xFFD9D6FE),
    shade300: Color(0xFFBDB4FE),
    shade400: Color(0xFF9B8AFB),
    shade500: Color(0xFF7A5AF8),
    shade600: Color(0xFF6938EF),
    shade700: Color(0xFF5925DC),
    shade800: Color(0xFF4A1FB8),
    shade900: Color(0xFF3E1C96),
    shade950: Color(0xFF27115F),
  );

  // ---------------------------------------------------------------------------
  // PINKS & REDS
  // ---------------------------------------------------------------------------

  /// Fuchsia — magenta-pink for bold, attention-grabbing accents.
  static const fuchsia = ColorScale(
    shade25:  Color(0xFFFEFAFF),
    shade50:  Color(0xFFFDF4FF),
    shade100: Color(0xFFFBE8FF),
    shade200: Color(0xFFF6D0FE),
    shade300: Color(0xFFEEAAFD),
    shade400: Color(0xFFE478FA),
    shade500: Color(0xFFD444F1),
    shade600: Color(0xFFBA24D5),
    shade700: Color(0xFF9F1AB1),
    shade800: Color(0xFF821890),
    shade900: Color(0xFF6F1877),
    shade950: Color(0xFF47104C),
  );

  /// Pink — warm pink for playful and expressive accents.
  static const pink = ColorScale(
    shade25:  Color(0xFFFEF6FB),
    shade50:  Color(0xFFFDF2FA),
    shade100: Color(0xFFFCE7F6),
    shade200: Color(0xFFFCCEEE),
    shade300: Color(0xFFFAA7E0),
    shade400: Color(0xFFF670C7),
    shade500: Color(0xFFEE46BC),
    shade600: Color(0xFFDD2590),
    shade700: Color(0xFFC11574),
    shade800: Color(0xFF9E165F),
    shade900: Color(0xFF851651),
    shade950: Color(0xFF4E0D30),
  );

  /// Rose — soft red-pink for romantic or notification accents.
  static const rose = ColorScale(
    shade25:  Color(0xFFFFF5F6),
    shade50:  Color(0xFFFFF1F3),
    shade100: Color(0xFFFFE4E8),
    shade200: Color(0xFFFECDD6),
    shade300: Color(0xFFFEA3B4),
    shade400: Color(0xFFFD6F8E),
    shade500: Color(0xFFF63D68),
    shade600: Color(0xFFE31B54),
    shade700: Color(0xFFC01048),
    shade800: Color(0xFFA11043),
    shade900: Color(0xFF89123E),
    shade950: Color(0xFF510B24),
  );

  // ---------------------------------------------------------------------------
  // ORANGES & YELLOWS
  // ---------------------------------------------------------------------------

  /// Dark orange — fiery, saturated orange for urgent accents.
  static const orangeDark = ColorScale(
    shade25:  Color(0xFFFFF9F5),
    shade50:  Color(0xFFFFF4ED),
    shade100: Color(0xFFFFE6D5),
    shade200: Color(0xFFFFD6AE),
    shade300: Color(0xFFFF9C66),
    shade400: Color(0xFFFF692E),
    shade500: Color(0xFFFF4405),
    shade600: Color(0xFFE62E05),
    shade700: Color(0xFFBC1B06),
    shade800: Color(0xFF97180C),
    shade900: Color(0xFF771A0D),
    shade950: Color(0xFF57130A),
  );

  /// Orange — warm orange for attention and decorative accents.
  static const orange = ColorScale(
    shade25:  Color(0xFFFEFAF5),
    shade50:  Color(0xFFFEF6EE),
    shade100: Color(0xFFFDEAD7),
    shade200: Color(0xFFF9DBAF),
    shade300: Color(0xFFF7B27A),
    shade400: Color(0xFFF38744),
    shade500: Color(0xFFEF6820),
    shade600: Color(0xFFE04F16),
    shade700: Color(0xFFB93815),
    shade800: Color(0xFF932F19),
    shade900: Color(0xFF772917),
    shade950: Color(0xFF511C10),
  );

  /// Yellow — bright gold for highlights, badges, and star ratings.
  static const yellow = ColorScale(
    shade25:  Color(0xFFFEFDF0),
    shade50:  Color(0xFFFEFBE8),
    shade100: Color(0xFFFEF7C3),
    shade200: Color(0xFFFEEE95),
    shade300: Color(0xFFFDE272),
    shade400: Color(0xFFFAC515),
    shade500: Color(0xFFEAAA08),
    shade600: Color(0xFFCA8504),
    shade700: Color(0xFFA15C07),
    shade800: Color(0xFF854A0E),
    shade900: Color(0xFF713B12),
    shade950: Color(0xFF542C0D),
  );
}
