import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart';
import 'package:mihr_ui/mihr_ui.dart'
    show
        MihrDestructiveButton,
        MihrLinkButton,
        MihrPrimaryButton,
        MihrSecondaryButton,
        MihrTertiaryButton,
        MihrTheme;

/// Unified theme configuration for all Mihr button variants.
///
/// Register in [ThemeData.extensions] — typically via [MihrTheme.light]
/// / [MihrTheme.dark] — to control shape, shadows, sizes, and
/// per-variant style overrides from a single place.
///
/// ## Global shape (affects ALL buttons — Mihr + Material)
///
/// ```dart
/// MihrButtonThemeData(
///   shape: RoundedRectangleBorder(
///     borderRadius: BorderRadius.circular(12),
///   ),
/// )
/// ```
///
/// ## Shadow preset
///
/// ```dart
/// MihrButtonThemeData(
///   shadows: MihrButtonShadows.flat,   // no shadows
/// )
/// ```
///
/// ## Per-variant override (Mihr buttons only)
///
/// ```dart
/// MihrButtonThemeData(
///   primaryStyle: ButtonStyle(
///     backgroundColor: WidgetStatePropertyAll(Colors.indigo),
///   ),
/// )
/// ```
@immutable
class MihrButtonThemeData extends ThemeExtension<MihrButtonThemeData> {
  /// Creates a button theme configuration.
  const MihrButtonThemeData({
    this.shape,
    this.shadows,
    this.sizes,
    this.linkSizes,
    this.primaryStyle,
    this.secondaryStyle,
    this.tertiaryStyle,
    this.linkStyle,
    this.destructiveStyle,
  });

  /// Global shape applied to ALL button variants.
  ///
  /// When `null`, defaults to
  /// `RoundedRectangleBorder(borderRadius: MihrRadius.borderMd)`.
  final OutlinedBorder? shape;

  /// Shadow configuration (outer + inner + focus ring).
  ///
  /// When `null`, defaults to [MihrButtonShadows.standard].
  final MihrButtonShadows? shadows;

  /// Size presets (sm/md/lg/xl) for regular buttons.
  ///
  /// When `null`, uses default sizes.
  final MihrButtonSizes? sizes;

  /// Size presets for link-style buttons.
  ///
  /// When `null`, uses default link sizes.
  final MihrLinkButtonSizes? linkSizes;

  /// Style override merged on top of [MihrPrimaryButton] defaults.
  final ButtonStyle? primaryStyle;

  /// Style override merged on top of [MihrSecondaryButton] defaults.
  final ButtonStyle? secondaryStyle;

  /// Style override merged on top of [MihrTertiaryButton] defaults.
  final ButtonStyle? tertiaryStyle;

  /// Style override merged on top of [MihrLinkButton] defaults.
  final ButtonStyle? linkStyle;

  /// Style override merged on top of [MihrDestructiveButton] defaults.
  final ButtonStyle? destructiveStyle;

  /// Retrieves the nearest [MihrButtonThemeData], if any.
  static MihrButtonThemeData? of(BuildContext context) =>
      Theme.of(context).extension<MihrButtonThemeData>();

  @override
  MihrButtonThemeData copyWith({
    OutlinedBorder? shape,
    MihrButtonShadows? shadows,
    MihrButtonSizes? sizes,
    MihrLinkButtonSizes? linkSizes,
    ButtonStyle? primaryStyle,
    ButtonStyle? secondaryStyle,
    ButtonStyle? tertiaryStyle,
    ButtonStyle? linkStyle,
    ButtonStyle? destructiveStyle,
  }) =>
      MihrButtonThemeData(
        shape: shape ?? this.shape,
        shadows: shadows ?? this.shadows,
        sizes: sizes ?? this.sizes,
        linkSizes: linkSizes ?? this.linkSizes,
        primaryStyle: primaryStyle ?? this.primaryStyle,
        secondaryStyle: secondaryStyle ?? this.secondaryStyle,
        tertiaryStyle: tertiaryStyle ?? this.tertiaryStyle,
        linkStyle: linkStyle ?? this.linkStyle,
        destructiveStyle: destructiveStyle ?? this.destructiveStyle,
      );

  @override
  MihrButtonThemeData lerp(covariant MihrButtonThemeData? other, double t) {
    if (other == null) return this;
    return MihrButtonThemeData(
      shape: OutlinedBorder.lerp(shape, other.shape, t),
      shadows: t < 0.5 ? shadows : other.shadows,
      sizes: t < 0.5 ? sizes : other.sizes,
      linkSizes: t < 0.5 ? linkSizes : other.linkSizes,
      primaryStyle: ButtonStyle.lerp(primaryStyle, other.primaryStyle, t),
      secondaryStyle: ButtonStyle.lerp(secondaryStyle, other.secondaryStyle, t),
      tertiaryStyle: ButtonStyle.lerp(tertiaryStyle, other.tertiaryStyle, t),
      linkStyle: ButtonStyle.lerp(linkStyle, other.linkStyle, t),
      destructiveStyle: ButtonStyle.lerp(
        destructiveStyle,
        other.destructiveStyle,
        t,
      ),
    );
  }
}
