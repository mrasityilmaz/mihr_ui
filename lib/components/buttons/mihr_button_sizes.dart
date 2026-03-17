import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/buttons.dart' show MihrButtonThemeData;
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart' show MihrButtonThemeData;
import 'package:mihr_ui/core/theme/typography/mihr_typography.dart';
import 'package:mihr_ui/mihr_ui.dart' show MihrButtonThemeData;

/// Standard button size variants.
enum MihrButtonSize {
  /// Small (36px height).
  sm,

  /// Medium (40px height) — default.
  md,

  /// Large (44px height).
  lg,

  /// Extra-large (48px height).
  xl,
}

/// Layout metrics for a single button size level.
///
/// Defines height, padding, text style, and icon size.
/// Used by [MihrButtonSizes] to provide sm/md/lg/xl presets.
@immutable
class MihrButtonSizeData {
  /// Creates layout metrics for a button size level.
  const MihrButtonSizeData({
    required this.height,
    required this.paddingV,
    required this.paddingH,
    required this.textStyle,
    this.iconSize = 20.0,
  });

  /// Total button height constraint.
  final double height;

  /// Vertical content padding.
  final double paddingV;

  /// Horizontal content padding.
  final double paddingH;

  /// Label text style (includes font size and weight).
  final TextStyle textStyle;

  /// Icon frame size.
  final double iconSize;
}

/// Size presets for sm/md/lg/xl button variants.
///
/// Provide a custom [MihrButtonSizes] via [MihrButtonThemeData]
/// to override the default sizing globally.
///
/// ```dart
/// MihrButtonThemeData(
///   sizes: MihrButtonSizes(
///     md: MihrButtonSizeData(
///       height: 44,
///       paddingV: 12,
///       paddingH: 16,
///       textStyle: MihrTypography.textMd.semibold,
///     ),
///   ),
/// )
/// ```
@immutable
class MihrButtonSizes {
  /// Creates size presets, falling back to defaults for any omitted size.
  MihrButtonSizes({
    MihrButtonSizeData? sm,
    MihrButtonSizeData? md,
    MihrButtonSizeData? lg,
    MihrButtonSizeData? xl,
  })  : sm = sm ?? _defaultSm,
        md = md ?? _defaultMd,
        lg = lg ?? _defaultLg,
        xl = xl ?? _defaultXl;

  /// Small button size preset (36px height).
  final MihrButtonSizeData sm;

  /// Medium button size preset (40px height).
  final MihrButtonSizeData md;

  /// Large button size preset (44px height).
  final MihrButtonSizeData lg;

  /// Extra-large button size preset (48px height).
  final MihrButtonSizeData xl;

  /// Resolves the [MihrButtonSizeData] for a given [size].
  MihrButtonSizeData forSize(MihrButtonSize size) => switch (size) {
        MihrButtonSize.sm => sm,
        MihrButtonSize.md => md,
        MihrButtonSize.lg => lg,
        MihrButtonSize.xl => xl,
      };

  static final _defaultSm = MihrButtonSizeData(
    height: 36,
    paddingV: 8,
    paddingH: 10,
    textStyle: MihrTypography.textSm.semibold,
  );

  static final _defaultMd = MihrButtonSizeData(
    height: 40,
    paddingV: 10,
    paddingH: 12,
    textStyle: MihrTypography.textSm.semibold,
  );

  static final _defaultLg = MihrButtonSizeData(
    height: 44,
    paddingV: 10,
    paddingH: 14,
    textStyle: MihrTypography.textMd.semibold,
  );

  static final _defaultXl = MihrButtonSizeData(
    height: 48,
    paddingV: 12,
    paddingH: 16,
    textStyle: MihrTypography.textMd.semibold,
  );
}

/// Size presets for link-style buttons (no padding, smaller height).
@immutable
class MihrLinkButtonSizes {
  /// Creates link-button size presets, falling back to defaults for any omitted size.
  MihrLinkButtonSizes({
    MihrButtonSizeData? sm,
    MihrButtonSizeData? md,
    MihrButtonSizeData? lg,
    MihrButtonSizeData? xl,
  })  : sm = sm ?? _defaultSm,
        md = md ?? _defaultMd,
        lg = lg ?? _defaultLg,
        xl = xl ?? _defaultXl;

  /// Small link-button size preset (20px height).
  final MihrButtonSizeData sm;

  /// Medium link-button size preset (20px height).
  final MihrButtonSizeData md;

  /// Large link-button size preset (24px height).
  final MihrButtonSizeData lg;

  /// Extra-large link-button size preset (24px height).
  final MihrButtonSizeData xl;

  /// Resolves the [MihrButtonSizeData] for a given [size].
  MihrButtonSizeData forSize(MihrButtonSize size) => switch (size) {
        MihrButtonSize.sm => sm,
        MihrButtonSize.md => md,
        MihrButtonSize.lg => lg,
        MihrButtonSize.xl => xl,
      };

  static final _defaultSm = MihrButtonSizeData(
    height: 20,
    paddingV: 0,
    paddingH: 0,
    textStyle: MihrTypography.textSm.semibold,
  );

  static final _defaultMd = MihrButtonSizeData(
    height: 20,
    paddingV: 0,
    paddingH: 0,
    textStyle: MihrTypography.textSm.semibold,
  );

  static final _defaultLg = MihrButtonSizeData(
    height: 24,
    paddingV: 0,
    paddingH: 0,
    textStyle: MihrTypography.textMd.semibold,
  );

  static final _defaultXl = MihrButtonSizeData(
    height: 24,
    paddingV: 0,
    paddingH: 0,
    textStyle: MihrTypography.textMd.semibold,
  );
}
