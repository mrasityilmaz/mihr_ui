import 'package:flutter/painting.dart';

/// A 12-shade color scale following the Mihr UI convention.
///
/// Shades range from 25 (lightest) to 950 (darkest).
/// This matches the Tailwind CSS / Material Design numeric naming
/// used in the design reference.
///
/// Typical usage per shade:
/// - 25, 50:    Background tints, subtle fills
/// - 100, 200:  Hover backgrounds, light accents
/// - 300, 400:  Borders, disabled states, icons
/// - 500:       Base color, mid-tone reference
/// - 600:       Primary interactive (buttons, links, active states)
/// - 700, 800:  Dark accents, hover on dark
/// - 900, 950:  High-contrast text, dark backgrounds
class ColorScale {
  /// Creates a [ColorScale] with all 12 shades specified.
  const ColorScale({
    required this.shade25,
    required this.shade50,
    required this.shade100,
    required this.shade200,
    required this.shade300,
    required this.shade400,
    required this.shade500,
    required this.shade600,
    required this.shade700,
    required this.shade800,
    required this.shade900,
    required this.shade950,
  });

  /// Lightest tint — subtle background fills.
  final Color shade25;

  /// Very light tint — background highlights.
  final Color shade50;

  /// Light shade — hover backgrounds, light accents.
  final Color shade100;

  /// Light accent — secondary hover states.
  final Color shade200;

  /// Mid-light — borders, disabled states.
  final Color shade300;

  /// Mid — icons, placeholder text.
  final Color shade400;

  /// Base color — mid-tone reference point.
  final Color shade500;

  /// Primary interactive — buttons, links, active states.
  final Color shade600;

  /// Dark accent — hover on dark surfaces.
  final Color shade700;

  /// Dark shade — emphasized elements.
  final Color shade800;

  /// High-contrast — headings, prominent text.
  final Color shade900;

  /// Darkest shade — dark backgrounds, maximum contrast.
  final Color shade950;

  /// Access a shade by its numeric key (25, 50, 100, ..., 950).
  ///
  /// Throws [ArgumentError] if the shade number is not valid.
  Color operator [](int shade) {
    return switch (shade) {
      25 => shade25,
      50 => shade50,
      100 => shade100,
      200 => shade200,
      300 => shade300,
      400 => shade400,
      500 => shade500,
      600 => shade600,
      700 => shade700,
      800 => shade800,
      900 => shade900,
      950 => shade950,
      _ => throw ArgumentError(
          'Invalid shade: $shade. '
          'Valid shades are: 25, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950.',
        ),
    };
  }

  /// All valid shade keys in ascending order.
  static const List<int> shadeKeys = [
    25,
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
    800,
    900,
    950,
  ];

  /// Returns all shades as an ordered map from shade key to [Color].
  Map<int, Color> toMap() {
    return {
      25: shade25,
      50: shade50,
      100: shade100,
      200: shade200,
      300: shade300,
      400: shade400,
      500: shade500,
      600: shade600,
      700: shade700,
      800: shade800,
      900: shade900,
      950: shade950,
    };
  }
}
