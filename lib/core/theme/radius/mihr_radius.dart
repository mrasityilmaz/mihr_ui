import 'package:flutter/widgets.dart';

/// Border radius tokens for the Mihr UI design system.
///
/// 11 named sizes from `none` (0px) to `full` (9999px), derived from
/// the Mihr UI Figma spacing primitives.
///
/// Two access patterns:
///
/// 1. **Raw doubles** — `MihrRadius.md` returns `8.0`.
/// 2. **BorderRadius constants** — `MihrRadius.borderMd` returns
///    `BorderRadius.circular(8)`.
///
/// ## Usage
///
/// ```dart
/// // As BorderRadius (most common)
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: MihrRadius.borderMd,
///   ),
/// )
///
/// // As raw double
/// ClipRRect(
///   borderRadius: BorderRadius.circular(MihrRadius.xl),
///   child: image,
/// )
///
/// // Pill / circle
/// Container(
///   decoration: BoxDecoration(
///     borderRadius: MihrRadius.borderFull,
///   ),
/// )
/// ```
class MihrRadius {
  MihrRadius._();

  // ---------------------------------------------------------------------------
  // RAW VALUES (double)
  // ---------------------------------------------------------------------------

  /// 0px — Sharp corners.
  static const double none = 0;

  /// 2px — Barely rounded (checkboxes, tiny badges).
  static const double xxs = 2;

  /// 4px — Subtle rounding (tags, small inputs).
  static const double xs = 4;

  /// 6px — Compact rounding (buttons sm, chips).
  static const double sm = 6;

  /// 8px — Default rounding (buttons, inputs, cards).
  static const double md = 8;

  /// 10px — Slightly larger (dropdowns, popovers).
  static const double lg = 10;

  /// 12px — Cards, dialogs, FABs.
  static const double xl = 12;

  /// 16px — Bottom sheets, large cards.
  static const double xxl = 16;

  /// 20px — Modal containers, feature cards.
  static const double xxxl = 20;

  /// 24px — Hero cards, image containers.
  static const double xxxxl = 24;

  /// 9999px — Pill / full-circle shape.
  static const double full = 9999;

  // ---------------------------------------------------------------------------
  // BORDER RADIUS CONSTANTS
  // ---------------------------------------------------------------------------

  /// Sharp corners (0px).
  static const BorderRadius borderNone = BorderRadius.zero;

  /// 2px all corners.
  static const BorderRadius borderXxs = BorderRadius.all(Radius.circular(xxs));

  /// 4px all corners.
  static const BorderRadius borderXs = BorderRadius.all(Radius.circular(xs));

  /// 6px all corners.
  static const BorderRadius borderSm = BorderRadius.all(Radius.circular(sm));

  /// 8px all corners — default for buttons, inputs.
  static const BorderRadius borderMd = BorderRadius.all(Radius.circular(md));

  /// 10px all corners.
  static const BorderRadius borderLg = BorderRadius.all(Radius.circular(lg));

  /// 12px all corners — cards, dialogs.
  static const BorderRadius borderXl = BorderRadius.all(Radius.circular(xl));

  /// 16px all corners — bottom sheets.
  static const BorderRadius borderXxl = BorderRadius.all(Radius.circular(xxl));

  /// 20px all corners — modals.
  static const BorderRadius borderXxxl = BorderRadius.all(
    Radius.circular(xxxl),
  );

  /// 24px all corners — hero cards.
  static const BorderRadius borderXxxxl = BorderRadius.all(
    Radius.circular(xxxxl),
  );

  /// 9999px all corners — pill shape.
  static const BorderRadius borderFull = BorderRadius.all(
    Radius.circular(full),
  );

  // ---------------------------------------------------------------------------
  // TOP-ONLY RADIUS — for bottom sheets, modals
  // ---------------------------------------------------------------------------

  /// Top-only 16px — standard bottom sheet.
  static const BorderRadius topXxl = BorderRadius.vertical(
    top: Radius.circular(xxl),
  );

  /// Top-only 20px — large bottom sheet.
  static const BorderRadius topXxxl = BorderRadius.vertical(
    top: Radius.circular(xxxl),
  );

  /// Top-only 24px — hero bottom sheet.
  static const BorderRadius topXxxxl = BorderRadius.vertical(
    top: Radius.circular(xxxxl),
  );
}
