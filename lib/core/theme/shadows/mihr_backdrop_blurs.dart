import 'dart:ui';

/// Backdrop blur presets for the Mihr UI design system.
///
/// Combines a semi-transparent overlay color with a blur sigma value,
/// used for frosted-glass effects on navigation bars, modals, overlays, etc.
///
/// ## Light mode
/// - Overlay: `#FFFFFF` at 60% opacity
/// - Blur: sm(8), md(16), lg(24), xl(40)
///
/// ## Dark mode
/// - Overlay: `#000000` at 60% opacity
/// - Blur: sm(8), md(16), lg(24), xl(40)
///
/// ## Usage with BackdropFilter
///
/// ```dart
/// final blur = MihrBackdropBlurs.md;
///
/// ClipRRect(
///   borderRadius: BorderRadius.circular(12),
///   child: BackdropFilter(
///     filter: ImageFilter.blur(sigmaX: blur.sigma, sigmaY: blur.sigma),
///     child: Container(
///       color: blur.lightOverlay, // or blur.darkOverlay
///       child: content,
///     ),
///   ),
/// );
/// ```
///
/// ## Usage with context (auto light/dark)
///
/// ```dart
/// final blur = MihrBackdropBlurs.lg;
/// final isDark = Theme.of(context).brightness == Brightness.dark;
///
/// BackdropFilter(
///   filter: blur.imageFilter,
///   child: Container(
///     color: isDark ? blur.darkOverlay : blur.lightOverlay,
///   ),
/// );
/// ```
class MihrBackdropBlurs {
  MihrBackdropBlurs._();

  /// Small blur — subtle frosted effect for toolbars, chips.
  static const sm = BackdropBlurStyle._(sigma: 4, blurPx: 8);

  /// Medium blur — navigation bars, floating headers.
  static const md = BackdropBlurStyle._(sigma: 8, blurPx: 16);

  /// Large blur — modals, overlays, side panels.
  static const lg = BackdropBlurStyle._(sigma: 12, blurPx: 24);

  /// Extra-large blur — full-screen overlays, hero backgrounds.
  static const xl = BackdropBlurStyle._(sigma: 20, blurPx: 40);

  /// All presets in ascending order.
  static const List<BackdropBlurStyle> all = [sm, md, lg, xl];
}

/// A single backdrop blur preset with overlay colors and blur value.
class BackdropBlurStyle {
  const BackdropBlurStyle._({required this.sigma, required this.blurPx})
    : lightOverlay = const Color(0x99FFFFFF),
      darkOverlay = const Color(0x99000000);

  /// Creates a custom [BackdropBlurStyle] with overridden overlay colors.
  const BackdropBlurStyle.custom({
    required this.sigma,
    required this.blurPx,
    required this.lightOverlay,
    required this.darkOverlay,
  });

  /// The Gaussian blur sigma for [ImageFilter.blur].
  ///
  /// Approximation: sigma ≈ blurPx / 2 for visual equivalence with CSS blur().
  final double sigma;

  /// The original CSS/Figma blur radius in pixels (for reference).
  final int blurPx;

  /// Light mode overlay — white at 60% opacity.
  final Color lightOverlay;

  /// Dark mode overlay — black at 60% opacity.
  final Color darkOverlay;

  /// Creates an [ImageFilter] with this preset's sigma.
  ImageFilter get imageFilter => ImageFilter.blur(sigmaX: sigma, sigmaY: sigma);

  /// Returns the appropriate overlay color for the given [brightness].
  Color overlay(Brightness brightness) =>
      brightness == Brightness.dark ? darkOverlay : lightOverlay;
}
