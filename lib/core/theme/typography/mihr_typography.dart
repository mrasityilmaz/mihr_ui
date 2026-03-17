import 'package:flutter/material.dart';

/// Weight variants of a single typographic size level.
///
/// Each [TypeStyle] provides four weight options:
/// - [regular] (w400)
/// - [medium] (w500)
/// - [semibold] (w600)
/// - [bold] (w700)
///
/// ```dart
/// Text('Heading', style: MihrTypography.displayLg.semibold);
/// Text('Body', style: MihrTypography.textMd.regular);
/// ```
class TypeStyle {
  /// Creates a [TypeStyle] with all four weight variants.
  const TypeStyle({
    required this.regular,
    required this.medium,
    required this.semibold,
    required this.bold,
  });

  /// Regular weight (400) variant.
  final TextStyle regular;

  /// Medium weight (500) variant.
  final TextStyle medium;

  /// Semibold weight (600) variant.
  final TextStyle semibold;

  /// Bold weight (700) variant.
  final TextStyle bold;

  /// Returns a copy with a different [fontFamily].
  TypeStyle withFontFamily(String fontFamily) {
    return TypeStyle(
      regular: regular.copyWith(fontFamily: fontFamily),
      medium: medium.copyWith(fontFamily: fontFamily),
      semibold: semibold.copyWith(fontFamily: fontFamily),
      bold: bold.copyWith(fontFamily: fontFamily),
    );
  }

  /// Returns a copy with [color] applied to all weight variants.
  TypeStyle withColor(Color color) {
    return TypeStyle(
      regular: regular.copyWith(color: color),
      medium: medium.copyWith(color: color),
      semibold: semibold.copyWith(color: color),
      bold: bold.copyWith(color: color),
    );
  }
}

/// Mihr UI Typography System.
///
/// 11 size levels × 4 weight variants = 44 text styles.
///
/// **Display** styles — headings, hero sections, marketing:
/// [display2xl] 72px, [displayXl] 60px, [displayLg] 48px,
/// [displayMd] 36px, [displaySm] 30px, [displayXs] 24px
///
/// **Text** styles — body, labels, UI elements:
/// [textXl] 20px, [textLg] 18px, [textMd] 16px,
/// [textSm] 14px, [textXs] 12px
///
/// Default font: **Inter**. Override via [textTheme] parameter or
/// [TypeStyle.withFontFamily].
///
/// ```dart
/// // Direct access
/// Text('Welcome', style: MihrTypography.displayLg.semibold);
/// Text('Description', style: MihrTypography.textMd.regular);
///
/// // With color from semantic tokens
/// Text(
///   'Hello',
///   style: MihrTypography.textMd.medium.copyWith(
///     color: context.textColors.primary,
///   ),
/// );
/// ```
class MihrTypography {
  MihrTypography._();

  /// Default font family used across all type styles.
  static const String defaultFontFamily = 'Inter';

  // ─── Display styles (headings, -2% letter spacing) ───────────────

  /// Display 2xl — 72px / 90px / -2% tracking.
  /// Hero sections, splash screens, marketing headlines.
  static final TypeStyle display2xl = _build(72, 90, _tracking(72));

  /// Display xl — 60px / 72px / -2% tracking.
  /// Page-level headings, large section titles.
  static final TypeStyle displayXl = _build(60, 72, _tracking(60));

  /// Display lg — 48px / 60px / -2% tracking.
  /// Section headings, feature titles.
  static final TypeStyle displayLg = _build(48, 60, _tracking(48));

  /// Display md — 36px / 44px / -2% tracking.
  /// Subsection headings, card titles on landing pages.
  static final TypeStyle displayMd = _build(36, 44, _tracking(36));

  /// Display sm — 30px / 38px / -2% tracking.
  /// Dialog titles, prominent subsection labels.
  static final TypeStyle displaySm = _build(30, 38, _tracking(30));

  /// Display xs — 24px / 32px / -2% tracking.
  /// Small headings, widget titles.
  static final TypeStyle displayXs = _build(24, 32, _tracking(24));

  // ─── Text styles (body, labels, no tracking) ─────────────────────

  /// Text xl — 20px / 30px.
  /// Large body text, lead paragraphs, emphasized descriptions.
  static final TypeStyle textXl = _build(20, 30);

  /// Text lg — 18px / 28px.
  /// Secondary body text, form labels, list items.
  static final TypeStyle textLg = _build(18, 28);

  /// Text md — 16px / 24px.
  /// Default body text, paragraph content, input values.
  static final TypeStyle textMd = _build(16, 24);

  /// Text sm — 14px / 20px.
  /// Supporting text, table content, secondary labels.
  static final TypeStyle textSm = _build(14, 20);

  /// Text xs — 12px / 18px.
  /// Captions, badges, timestamps, helper text.
  static final TypeStyle textXs = _build(12, 18);

  // ─── All TypeStyle instances for iteration ───────────────────────

  /// All 11 [TypeStyle] instances in size-descending order.
  static final List<TypeStyle> allStyles = [
    display2xl,
    displayXl,
    displayLg,
    displayMd,
    displaySm,
    displayXs,
    textXl,
    textLg,
    textMd,
    textSm,
    textXs,
  ];

  // ─── Material TextTheme bridge ───────────────────────────────────

  /// Builds a Material [TextTheme] mapped to the Mihr UI type scale.
  ///
  /// | Material slot    | Mihr UI style            | Size  |
  /// |------------------|--------------------------|-------|
  /// | displayLarge     | display2xl.regular       | 72px  |
  /// | displayMedium    | displayXl.regular        | 60px  |
  /// | displaySmall     | displayLg.regular        | 48px  |
  /// | headlineLarge    | displayMd.semibold       | 36px  |
  /// | headlineMedium   | displaySm.semibold       | 30px  |
  /// | headlineSmall    | displayXs.semibold       | 24px  |
  /// | titleLarge       | textXl.semibold          | 20px  |
  /// | titleMedium      | textLg.medium            | 18px  |
  /// | titleSmall       | textMd.medium            | 16px  |
  /// | bodyLarge        | textMd.regular           | 16px  |
  /// | bodyMedium       | textSm.regular           | 14px  |
  /// | bodySmall        | textXs.regular           | 12px  |
  /// | labelLarge       | textSm.medium            | 14px  |
  /// | labelMedium      | textXs.medium            | 12px  |
  /// | labelSmall       | textXs.regular           | 12px  |
  ///
  /// Pass [fontFamily] to generate for a different typeface (e.g. 'DM Sans').
  static TextTheme textTheme({String fontFamily = defaultFontFamily}) {
    final isDefault = fontFamily == defaultFontFamily;

    final d2xl = isDefault ? display2xl : display2xl.withFontFamily(fontFamily);
    final dxl = isDefault ? displayXl : displayXl.withFontFamily(fontFamily);
    final dlg = isDefault ? displayLg : displayLg.withFontFamily(fontFamily);
    final dmd = isDefault ? displayMd : displayMd.withFontFamily(fontFamily);
    final dsm = isDefault ? displaySm : displaySm.withFontFamily(fontFamily);
    final dxs = isDefault ? displayXs : displayXs.withFontFamily(fontFamily);
    final txl = isDefault ? textXl : textXl.withFontFamily(fontFamily);
    final tlg = isDefault ? textLg : textLg.withFontFamily(fontFamily);
    final tmd = isDefault ? textMd : textMd.withFontFamily(fontFamily);
    final tsm = isDefault ? textSm : textSm.withFontFamily(fontFamily);
    final txs = isDefault ? textXs : textXs.withFontFamily(fontFamily);

    return TextTheme(
      displayLarge: d2xl.regular,
      displayMedium: dxl.regular,
      displaySmall: dlg.regular,
      headlineLarge: dmd.semibold,
      headlineMedium: dsm.semibold,
      headlineSmall: dxs.semibold,
      titleLarge: txl.semibold,
      titleMedium: tlg.medium,
      titleSmall: tmd.medium,
      bodyLarge: tmd.regular,
      bodyMedium: tsm.regular,
      bodySmall: txs.regular,
      labelLarge: tsm.medium,
      labelMedium: txs.medium,
      labelSmall: txs.regular,
    );
  }

  // ─── Private helpers ─────────────────────────────────────────────

  static const double _displayTrackingPercent = -0.02;

  static double _tracking(double fontSize) =>
      fontSize * _displayTrackingPercent;

  static TypeStyle _build(
    double fontSize,
    double lineHeight, [
    double letterSpacing = 0,
    String fontFamily = defaultFontFamily,
  ]) {
    final heightRatio = lineHeight / fontSize;
    return TypeStyle(
      regular: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        height: heightRatio,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w400,
      ),
      medium: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        height: heightRatio,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500,
      ),
      semibold: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        height: heightRatio,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600,
      ),
      bold: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        height: heightRatio,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
