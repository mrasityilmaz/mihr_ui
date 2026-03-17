import 'package:flutter/widgets.dart';

/// Spacing tokens for the Mihr UI design system.
///
/// Built on a **4px soft-grid** system. Every spacing value is divisible
/// by 4, with a 2px (xxs) and 6px (sm) exception for fine-tuning.
///
/// Two layers are provided:
///
/// 1. **Primitives** — Raw numeric scale (`p0`–`p480`) mapping
///    multiplier × 4 = pixels. Use when semantic names don't fit.
/// 2. **Semantic tokens** — Named sizes (`none`–`x11l`) for gaps,
///    padding, and margins in components and layouts.
///
/// ## Usage
///
/// ```dart
/// // Semantic tokens (preferred)
/// Padding(padding: EdgeInsets.all(MihrSpacing.xl))    // 16px
/// SizedBox(height: MihrSpacing.lg)                     // 12px
///
/// // Primitives (when exact value is needed)
/// SizedBox(width: MihrSpacing.p48)                     // 192px
/// ```
///
/// ## EdgeInsets helpers
///
/// ```dart
/// Padding(padding: MihrSpacing.insetsXl)               // all-16
/// Padding(padding: MihrSpacing.insetsH_xl)              // horizontal-16
/// ```
class MihrSpacing {
  MihrSpacing._();

  // ---------------------------------------------------------------------------
  // PRIMITIVES — raw 4px-grid scale (multiplier × 4 = pixels)
  // ---------------------------------------------------------------------------

  /// 0 × 4 = 0px
  static const double p0 = 0;

  /// 0.5 × 4 = 2px
  static const double p0_5 = 2;

  /// 1 × 4 = 4px
  static const double p1 = 4;

  /// 1.5 × 4 = 6px
  static const double p1_5 = 6;

  /// 2 × 4 = 8px
  static const double p2 = 8;

  /// 3 × 4 = 12px
  static const double p3 = 12;

  /// 4 × 4 = 16px
  static const double p4 = 16;

  /// 5 × 4 = 20px
  static const double p5 = 20;

  /// 6 × 4 = 24px
  static const double p6 = 24;

  /// 8 × 4 = 32px
  static const double p8 = 32;

  /// 10 × 4 = 40px
  static const double p10 = 40;

  /// 12 × 4 = 48px
  static const double p12 = 48;

  /// 16 × 4 = 64px
  static const double p16 = 64;

  /// 20 × 4 = 80px
  static const double p20 = 80;

  /// 24 × 4 = 96px
  static const double p24 = 96;

  /// 32 × 4 = 128px
  static const double p32 = 128;

  /// 40 × 4 = 160px
  static const double p40 = 160;

  /// 48 × 4 = 192px
  static const double p48 = 192;

  /// 56 × 4 = 224px
  static const double p56 = 224;

  /// 64 × 4 = 256px
  static const double p64 = 256;

  /// 80 × 4 = 320px
  static const double p80 = 320;

  /// 96 × 4 = 384px
  static const double p96 = 384;

  /// 120 × 4 = 480px
  static const double p120 = 480;

  /// 140 × 4 = 560px
  static const double p140 = 560;

  /// 160 × 4 = 640px
  static const double p160 = 640;

  /// 180 × 4 = 720px
  static const double p180 = 720;

  /// 192 × 4 = 768px
  static const double p192 = 768;

  /// 256 × 4 = 1024px
  static const double p256 = 1024;

  /// 320 × 4 = 1280px
  static const double p320 = 1280;

  /// 360 × 4 = 1440px
  static const double p360 = 1440;

  /// 400 × 4 = 1600px
  static const double p400 = 1600;

  /// 480 × 4 = 1920px
  static const double p480 = 1920;

  // ---------------------------------------------------------------------------
  // SEMANTIC TOKENS — named spacing for components and layouts
  // ---------------------------------------------------------------------------

  /// 0px — No spacing.
  static const double none = 0;

  /// 2px — Hairline gaps (icon-to-label in compact badges).
  static const double xxs = 2;

  /// 4px — Tight gaps (heading-to-subtext, inline icon padding).
  static const double xs = 4;

  /// 6px — Small padding (compact button vertical padding).
  static const double sm = 6;

  /// 8px — Default inner padding (input fields, small cards).
  static const double md = 8;

  /// 12px — List item gaps, button horizontal padding.
  static const double lg = 12;

  /// 16px — Standard component padding, section gap on mobile.
  static const double xl = 16;

  /// 20px — Relaxed component padding, text-to-content gap.
  static const double x2l = 20;

  /// 24px — Card padding, section gap on tablet.
  static const double x3l = 24;

  /// 32px — Section gap on desktop, container padding desktop.
  static const double x4l = 32;

  /// 40px — Large section gaps.
  static const double x5l = 40;

  /// 48px — Hero/feature section padding.
  static const double x6l = 48;

  /// 64px — Page section vertical spacing.
  static const double x7l = 64;

  /// 80px — Major page section breaks.
  static const double x8l = 80;

  /// 96px — Full-bleed section padding.
  static const double x9l = 96;

  /// 128px — Extra-large page sections.
  static const double x10l = 128;

  /// 160px — Maximum named spacing token.
  static const double x11l = 160;

  // ---------------------------------------------------------------------------
  // EDGE INSETS HELPERS — all-sides
  // ---------------------------------------------------------------------------

  /// All-sides: 0px.
  static const EdgeInsets insetsNone = EdgeInsets.zero;

  /// All-sides: 2px.
  static const EdgeInsets insetsXxs = EdgeInsets.all(xxs);

  /// All-sides: 4px.
  static const EdgeInsets insetsXs = EdgeInsets.all(xs);

  /// All-sides: 6px.
  static const EdgeInsets insetsSm = EdgeInsets.all(sm);

  /// All-sides: 8px.
  static const EdgeInsets insetsMd = EdgeInsets.all(md);

  /// All-sides: 12px.
  static const EdgeInsets insetsLg = EdgeInsets.all(lg);

  /// All-sides: 16px.
  static const EdgeInsets insetsXl = EdgeInsets.all(xl);

  /// All-sides: 20px.
  static const EdgeInsets insetsX2l = EdgeInsets.all(x2l);

  /// All-sides: 24px.
  static const EdgeInsets insetsX3l = EdgeInsets.all(x3l);

  /// All-sides: 32px.
  static const EdgeInsets insetsX4l = EdgeInsets.all(x4l);

  /// All-sides: 40px.
  static const EdgeInsets insetsX5l = EdgeInsets.all(x5l);

  /// All-sides: 48px.
  static const EdgeInsets insetsX6l = EdgeInsets.all(x6l);

  // ---------------------------------------------------------------------------
  // EDGE INSETS HELPERS — horizontal only
  // ---------------------------------------------------------------------------

  /// Horizontal: 2px.
  static const EdgeInsets insetsHXxs = EdgeInsets.symmetric(horizontal: xxs);

  /// Horizontal: 4px.
  static const EdgeInsets insetsHXs = EdgeInsets.symmetric(horizontal: xs);

  /// Horizontal: 6px.
  static const EdgeInsets insetsHSm = EdgeInsets.symmetric(horizontal: sm);

  /// Horizontal: 8px.
  static const EdgeInsets insetsHMd = EdgeInsets.symmetric(horizontal: md);

  /// Horizontal: 12px.
  static const EdgeInsets insetsHLg = EdgeInsets.symmetric(horizontal: lg);

  /// Horizontal: 16px.
  static const EdgeInsets insetsHXl = EdgeInsets.symmetric(horizontal: xl);

  /// Horizontal: 20px.
  static const EdgeInsets insetsHX2l = EdgeInsets.symmetric(horizontal: x2l);

  /// Horizontal: 24px.
  static const EdgeInsets insetsHX3l = EdgeInsets.symmetric(horizontal: x3l);

  /// Horizontal: 32px.
  static const EdgeInsets insetsHX4l = EdgeInsets.symmetric(horizontal: x4l);

  // ---------------------------------------------------------------------------
  // EDGE INSETS HELPERS — vertical only
  // ---------------------------------------------------------------------------

  /// Vertical: 2px.
  static const EdgeInsets insetsVXxs = EdgeInsets.symmetric(vertical: xxs);

  /// Vertical: 4px.
  static const EdgeInsets insetsVXs = EdgeInsets.symmetric(vertical: xs);

  /// Vertical: 6px.
  static const EdgeInsets insetsVSm = EdgeInsets.symmetric(vertical: sm);

  /// Vertical: 8px.
  static const EdgeInsets insetsVMd = EdgeInsets.symmetric(vertical: md);

  /// Vertical: 12px.
  static const EdgeInsets insetsVLg = EdgeInsets.symmetric(vertical: lg);

  /// Vertical: 16px.
  static const EdgeInsets insetsVXl = EdgeInsets.symmetric(vertical: xl);

  /// Vertical: 20px.
  static const EdgeInsets insetsVX2l = EdgeInsets.symmetric(vertical: x2l);

  /// Vertical: 24px.
  static const EdgeInsets insetsVX3l = EdgeInsets.symmetric(vertical: x3l);

  /// Vertical: 32px.
  static const EdgeInsets insetsVX4l = EdgeInsets.symmetric(vertical: x4l);

  // ---------------------------------------------------------------------------
  // GAP HELPERS — for Row / Column / Wrap spacing
  // ---------------------------------------------------------------------------

  /// Vertical gap: 2px.
  static const SizedBox gapVXxs = SizedBox(height: xxs);

  /// Vertical gap: 4px.
  static const SizedBox gapVXs = SizedBox(height: xs);

  /// Vertical gap: 6px.
  static const SizedBox gapVSm = SizedBox(height: sm);

  /// Vertical gap: 8px.
  static const SizedBox gapVMd = SizedBox(height: md);

  /// Vertical gap: 12px.
  static const SizedBox gapVLg = SizedBox(height: lg);

  /// Vertical gap: 16px.
  static const SizedBox gapVXl = SizedBox(height: xl);

  /// Vertical gap: 20px.
  static const SizedBox gapVX2l = SizedBox(height: x2l);

  /// Vertical gap: 24px.
  static const SizedBox gapVX3l = SizedBox(height: x3l);

  /// Vertical gap: 32px.
  static const SizedBox gapVX4l = SizedBox(height: x4l);

  /// Vertical gap: 40px.
  static const SizedBox gapVX5l = SizedBox(height: x5l);

  /// Vertical gap: 48px.
  static const SizedBox gapVX6l = SizedBox(height: x6l);

  /// Horizontal gap: 2px.
  static const SizedBox gapHXxs = SizedBox(width: xxs);

  /// Horizontal gap: 4px.
  static const SizedBox gapHXs = SizedBox(width: xs);

  /// Horizontal gap: 6px.
  static const SizedBox gapHSm = SizedBox(width: sm);

  /// Horizontal gap: 8px.
  static const SizedBox gapHMd = SizedBox(width: md);

  /// Horizontal gap: 12px.
  static const SizedBox gapHLg = SizedBox(width: lg);

  /// Horizontal gap: 16px.
  static const SizedBox gapHXl = SizedBox(width: xl);

  /// Horizontal gap: 20px.
  static const SizedBox gapHX2l = SizedBox(width: x2l);

  /// Horizontal gap: 24px.
  static const SizedBox gapHX3l = SizedBox(width: x3l);

  /// Horizontal gap: 32px.
  static const SizedBox gapHX4l = SizedBox(width: x4l);

  /// Horizontal gap: 40px.
  static const SizedBox gapHX5l = SizedBox(width: x5l);

  /// Horizontal gap: 48px.
  static const SizedBox gapHX6l = SizedBox(width: x6l);
}
