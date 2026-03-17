import 'package:flutter/widgets.dart';

/// Max-width constraint tokens for the Mihr UI design system.
///
/// These values are used **exclusively** as `maxWidth` constraints —
/// never as fixed widths. Elements remain fluid and fill available
/// space up to the specified maximum.
///
/// ## Usage
///
/// ```dart
/// // Constrain content width (stays fluid, caps at 1280px)
/// ConstrainedBox(
///   constraints: BoxConstraints(maxWidth: MihrWidths.x3l),
///   child: content,
/// )
///
/// // Container max-width with responsive padding
/// Center(
///   child: ConstrainedBox(
///     constraints: BoxConstraints(
///       maxWidth: MihrWidths.containerMaxWidth,
///     ),
///     child: Padding(
///       padding: EdgeInsets.symmetric(
///         horizontal: MihrWidths.containerPaddingDesktop,
///       ),
///       child: content,
///     ),
///   ),
/// )
///
/// // Paragraph max-width for readability (45-85 chars)
/// ConstrainedBox(
///   constraints: BoxConstraints(maxWidth: MihrWidths.paragraphMaxWidth),
///   child: Text(longContent),
/// )
/// ```
///
/// ## WRONG — never use as fixed width
///
/// ```dart
/// // BAD — removes fluidity
/// SizedBox(width: MihrWidths.x3l, child: content)
/// ```
class MihrWidths {
  MihrWidths._();

  // ---------------------------------------------------------------------------
  // MAX-WIDTH TOKENS
  // ---------------------------------------------------------------------------

  /// 320px — Extra-extra-small (compact mobile dialogs).
  static const double xxs = 320;

  /// 384px — Extra-small (narrow modals, side panels).
  static const double xs = 384;

  /// 480px — Small (auth forms, settings panels).
  static const double sm = 480;

  /// 560px — Medium (content dialogs).
  static const double md = 560;

  /// 640px — Large (wide forms, media cards).
  static const double lg = 640;

  /// 768px — Extra-large (tablet viewport baseline).
  static const double xl = 768;

  /// 1024px — 2XL (dashboard panels).
  static const double x2l = 1024;

  /// 1280px — 3XL (desktop max-content).
  static const double x3l = 1280;

  /// 1440px — 4XL (wide desktop).
  static const double x4l = 1440;

  /// 1600px — 5XL (ultra-wide content).
  static const double x5l = 1600;

  /// 1920px — 6XL (full HD viewport).
  static const double x6l = 1920;

  // ---------------------------------------------------------------------------
  // CONTAINER TOKENS
  // ---------------------------------------------------------------------------

  /// 16px — Horizontal padding for containers on mobile.
  static const double containerPaddingMobile = 16;

  /// 32px — Horizontal padding for containers on desktop.
  static const double containerPaddingDesktop = 32;

  /// 1280px — Maximum content width for desktop layouts.
  static const double containerMaxWidth = 1280;

  // ---------------------------------------------------------------------------
  // PARAGRAPH
  // ---------------------------------------------------------------------------

  /// 720px — Maximum paragraph width for optimal readability.
  ///
  /// Targets ~45-85 characters per line depending on font size,
  /// preventing eye strain from overly long lines.
  static const double paragraphMaxWidth = 720;

  // ---------------------------------------------------------------------------
  // BOX CONSTRAINTS HELPERS
  // ---------------------------------------------------------------------------

  /// Max-width constraint: 320px.
  static const BoxConstraints constraintsXxs =
      BoxConstraints(maxWidth: xxs);

  /// Max-width constraint: 384px.
  static const BoxConstraints constraintsXs =
      BoxConstraints(maxWidth: xs);

  /// Max-width constraint: 480px.
  static const BoxConstraints constraintsSm =
      BoxConstraints(maxWidth: sm);

  /// Max-width constraint: 560px.
  static const BoxConstraints constraintsMd =
      BoxConstraints(maxWidth: md);

  /// Max-width constraint: 640px.
  static const BoxConstraints constraintsLg =
      BoxConstraints(maxWidth: lg);

  /// Max-width constraint: 768px.
  static const BoxConstraints constraintsXl =
      BoxConstraints(maxWidth: xl);

  /// Max-width constraint: 1024px.
  static const BoxConstraints constraintsX2l =
      BoxConstraints(maxWidth: x2l);

  /// Max-width constraint: 1280px.
  static const BoxConstraints constraintsX3l =
      BoxConstraints(maxWidth: x3l);

  /// Max-width constraint: 1280px — standard desktop container.
  static const BoxConstraints constraintsContainer =
      BoxConstraints(maxWidth: containerMaxWidth);

  /// Max-width constraint: 720px — paragraph readability.
  static const BoxConstraints constraintsParagraph =
      BoxConstraints(maxWidth: paragraphMaxWidth);
}
