import 'package:flutter/material.dart';

import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Alpha (opacity) color tokens as a [ThemeExtension].
///
/// Provides white and black colors at 10 opacity levels (10%–100%).
/// In dark mode, the base colors swap:
///   - "white" becomes gray-950 (near-black)
///   - "black" becomes white
///
/// This ensures overlays, scrims, and transparency effects maintain
/// correct visual weight across both modes.
///
/// Access via context:
/// ```dart
/// final alphaColors = Theme.of(context).extension<AlphaColors>()!;
/// Container(color: alphaColors.white50); // 50% white overlay
/// ```
class AlphaColors extends ThemeExtension<AlphaColors> {
  /// Creates an [AlphaColors] with all white/black opacity tokens.
  const AlphaColors({
    required this.white10,
    required this.white20,
    required this.white30,
    required this.white40,
    required this.white50,
    required this.white60,
    required this.white70,
    required this.white80,
    required this.white90,
    required this.white100,
    required this.black10,
    required this.black20,
    required this.black30,
    required this.black40,
    required this.black50,
    required this.black60,
    required this.black70,
    required this.black80,
    required this.black90,
    required this.black100,
  });

  /// Light mode: white = #FFFFFF, black = #000000
  factory AlphaColors.light() {
    const white = MihrColors.white;
    const black = MihrColors.black;
    return AlphaColors(
      white10: white.withValues(alpha: 0.1),
      white20: white.withValues(alpha: 0.2),
      white30: white.withValues(alpha: 0.3),
      white40: white.withValues(alpha: 0.4),
      white50: white.withValues(alpha: 0.5),
      white60: white.withValues(alpha: 0.6),
      white70: white.withValues(alpha: 0.7),
      white80: white.withValues(alpha: 0.8),
      white90: white.withValues(alpha: 0.9),
      white100: white,
      black10: black.withValues(alpha: 0.1),
      black20: black.withValues(alpha: 0.2),
      black30: black.withValues(alpha: 0.3),
      black40: black.withValues(alpha: 0.4),
      black50: black.withValues(alpha: 0.5),
      black60: black.withValues(alpha: 0.6),
      black70: black.withValues(alpha: 0.7),
      black80: black.withValues(alpha: 0.8),
      black90: black.withValues(alpha: 0.9),
      black100: black,
    );
  }

  /// Dark mode: "white" swaps to gray-950, "black" swaps to white.
  /// This ensures overlays maintain correct visual weight on dark backgrounds.
  factory AlphaColors.dark() {
    const darkWhite = Color(0xFF0C0E12); // gray-950
    const darkBlack = MihrColors.white;
    return AlphaColors(
      white10: darkWhite.withValues(alpha: 0.1),
      white20: darkWhite.withValues(alpha: 0.2),
      white30: darkWhite.withValues(alpha: 0.3),
      white40: darkWhite.withValues(alpha: 0.4),
      white50: darkWhite.withValues(alpha: 0.5),
      white60: darkWhite.withValues(alpha: 0.6),
      white70: darkWhite.withValues(alpha: 0.7),
      white80: darkWhite.withValues(alpha: 0.8),
      white90: darkWhite.withValues(alpha: 0.9),
      white100: darkWhite,
      black10: darkBlack.withValues(alpha: 0.1),
      black20: darkBlack.withValues(alpha: 0.2),
      black30: darkBlack.withValues(alpha: 0.3),
      black40: darkBlack.withValues(alpha: 0.4),
      black50: darkBlack.withValues(alpha: 0.5),
      black60: darkBlack.withValues(alpha: 0.6),
      black70: darkBlack.withValues(alpha: 0.7),
      black80: darkBlack.withValues(alpha: 0.8),
      black90: darkBlack.withValues(alpha: 0.9),
      black100: darkBlack,
    );
  }

  /// White at 10% opacity.
  final Color white10;

  /// White at 20% opacity.
  final Color white20;

  /// White at 30% opacity.
  final Color white30;

  /// White at 40% opacity.
  final Color white40;

  /// White at 50% opacity.
  final Color white50;

  /// White at 60% opacity.
  final Color white60;

  /// White at 70% opacity.
  final Color white70;

  /// White at 80% opacity.
  final Color white80;

  /// White at 90% opacity.
  final Color white90;

  /// White at 100% opacity (fully opaque).
  final Color white100;

  /// Black at 10% opacity.
  final Color black10;

  /// Black at 20% opacity.
  final Color black20;

  /// Black at 30% opacity.
  final Color black30;

  /// Black at 40% opacity.
  final Color black40;

  /// Black at 50% opacity.
  final Color black50;

  /// Black at 60% opacity.
  final Color black60;

  /// Black at 70% opacity.
  final Color black70;

  /// Black at 80% opacity.
  final Color black80;

  /// Black at 90% opacity.
  final Color black90;

  /// Black at 100% opacity (fully opaque).
  final Color black100;

  /// Creates a copy with the given fields replaced.
  @override
  AlphaColors copyWith({
    Color? white10,
    Color? white20,
    Color? white30,
    Color? white40,
    Color? white50,
    Color? white60,
    Color? white70,
    Color? white80,
    Color? white90,
    Color? white100,
    Color? black10,
    Color? black20,
    Color? black30,
    Color? black40,
    Color? black50,
    Color? black60,
    Color? black70,
    Color? black80,
    Color? black90,
    Color? black100,
  }) {
    return AlphaColors(
      white10: white10 ?? this.white10,
      white20: white20 ?? this.white20,
      white30: white30 ?? this.white30,
      white40: white40 ?? this.white40,
      white50: white50 ?? this.white50,
      white60: white60 ?? this.white60,
      white70: white70 ?? this.white70,
      white80: white80 ?? this.white80,
      white90: white90 ?? this.white90,
      white100: white100 ?? this.white100,
      black10: black10 ?? this.black10,
      black20: black20 ?? this.black20,
      black30: black30 ?? this.black30,
      black40: black40 ?? this.black40,
      black50: black50 ?? this.black50,
      black60: black60 ?? this.black60,
      black70: black70 ?? this.black70,
      black80: black80 ?? this.black80,
      black90: black90 ?? this.black90,
      black100: black100 ?? this.black100,
    );
  }

  /// Linearly interpolates between two [AlphaColors] instances.
  @override
  AlphaColors lerp(AlphaColors? other, double t) {
    if (other is! AlphaColors) return this;
    return AlphaColors(
      white10: Color.lerp(white10, other.white10, t)!,
      white20: Color.lerp(white20, other.white20, t)!,
      white30: Color.lerp(white30, other.white30, t)!,
      white40: Color.lerp(white40, other.white40, t)!,
      white50: Color.lerp(white50, other.white50, t)!,
      white60: Color.lerp(white60, other.white60, t)!,
      white70: Color.lerp(white70, other.white70, t)!,
      white80: Color.lerp(white80, other.white80, t)!,
      white90: Color.lerp(white90, other.white90, t)!,
      white100: Color.lerp(white100, other.white100, t)!,
      black10: Color.lerp(black10, other.black10, t)!,
      black20: Color.lerp(black20, other.black20, t)!,
      black30: Color.lerp(black30, other.black30, t)!,
      black40: Color.lerp(black40, other.black40, t)!,
      black50: Color.lerp(black50, other.black50, t)!,
      black60: Color.lerp(black60, other.black60, t)!,
      black70: Color.lerp(black70, other.black70, t)!,
      black80: Color.lerp(black80, other.black80, t)!,
      black90: Color.lerp(black90, other.black90, t)!,
      black100: Color.lerp(black100, other.black100, t)!,
    );
  }
}
