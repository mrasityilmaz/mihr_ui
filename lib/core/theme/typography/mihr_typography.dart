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
/// final typo = MihrTypography.of(context);
/// Text('Heading', style: typo.displayLg.semibold);
/// Text('Body', style: typo.textMd.regular);
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

/// Mihr UI Typography System — a [ThemeExtension] that holds
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
/// Default font: **Inter**. Override via `fontFamily` parameter in
/// `MihrTheme.light` / `MihrTheme.dark`.
///
/// ## Usage in widgets (recommended)
///
/// ```dart
/// final typo = MihrTypography.of(context);
/// Text('Welcome', style: typo.displayLg.semibold);
///
/// // or via context shorthand
/// Text('Welcome', style: context.typography.displayLg.semibold);
/// ```
@immutable
class MihrTypography extends ThemeExtension<MihrTypography> {
  /// Creates a typography set with all 11 type styles.
  const MihrTypography({
    required this.fontFamily,
    required this.display2xl,
    required this.displayXl,
    required this.displayLg,
    required this.displayMd,
    required this.displaySm,
    required this.displayXs,
    required this.textXl,
    required this.textLg,
    required this.textMd,
    required this.textSm,
    required this.textXs,
  });

  /// Builds a [MihrTypography] for the given [fontFamily].
  ///
  /// Returns the default Inter instance when [fontFamily] matches
  /// [defaultFontFamily].
  factory MihrTypography.fromFontFamily(String fontFamily) {
    if (fontFamily == defaultFontFamily) return _inter;
    return MihrTypography(
      fontFamily: fontFamily,
      display2xl: _inter.display2xl.withFontFamily(fontFamily),
      displayXl: _inter.displayXl.withFontFamily(fontFamily),
      displayLg: _inter.displayLg.withFontFamily(fontFamily),
      displayMd: _inter.displayMd.withFontFamily(fontFamily),
      displaySm: _inter.displaySm.withFontFamily(fontFamily),
      displayXs: _inter.displayXs.withFontFamily(fontFamily),
      textXl: _inter.textXl.withFontFamily(fontFamily),
      textLg: _inter.textLg.withFontFamily(fontFamily),
      textMd: _inter.textMd.withFontFamily(fontFamily),
      textSm: _inter.textSm.withFontFamily(fontFamily),
      textXs: _inter.textXs.withFontFamily(fontFamily),
    );
  }

  // ─── Instance fields ──────────────────────────────────────────────

  /// The active font family.
  final String fontFamily;

  /// Display 2xl — 72px / 90px / -2% tracking.
  final TypeStyle display2xl;

  /// Display xl — 60px / 72px / -2% tracking.
  final TypeStyle displayXl;

  /// Display lg — 48px / 60px / -2% tracking.
  final TypeStyle displayLg;

  /// Display md — 36px / 44px / -2% tracking.
  final TypeStyle displayMd;

  /// Display sm — 30px / 38px / -2% tracking.
  final TypeStyle displaySm;

  /// Display xs — 24px / 32px / -2% tracking.
  final TypeStyle displayXs;

  /// Text xl — 20px / 30px.
  final TypeStyle textXl;

  /// Text lg — 18px / 28px.
  final TypeStyle textLg;

  /// Text md — 16px / 24px.
  final TypeStyle textMd;

  /// Text sm — 14px / 20px.
  final TypeStyle textSm;

  /// Text xs — 12px / 18px.
  final TypeStyle textXs;

  /// All 11 [TypeStyle] instances in size-descending order.
  List<TypeStyle> get allStyles => [
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

  // ─── Static constants ─────────────────────────────────────────────

  /// Default font family used across all type styles.
  static const String defaultFontFamily = 'Inter';

  static final MihrTypography _inter = MihrTypography(
    fontFamily: defaultFontFamily,
    display2xl: _build(72, 90, _tracking(72)),
    displayXl: _build(60, 72, _tracking(60)),
    displayLg: _build(48, 60, _tracking(48)),
    displayMd: _build(36, 44, _tracking(36)),
    displaySm: _build(30, 38, _tracking(30)),
    displayXs: _build(24, 32, _tracking(24)),
    textXl: _build(20, 30),
    textLg: _build(18, 28),
    textMd: _build(16, 24),
    textSm: _build(14, 20),
    textXs: _build(12, 18),
  );

  // ─── Context access ───────────────────────────────────────────────

  /// Returns the theme-resolved typography with the active font family.
  ///
  /// ```dart
  /// final typo = MihrTypography.of(context);
  /// Text('Hello', style: typo.textMd.semibold);
  /// ```
  static MihrTypography of(BuildContext context) => Theme.of(context).extension<MihrTypography>()!;

  /// Returns the theme-resolved typography, or `null` if no
  /// [MihrTypography] is registered in the current theme.
  static MihrTypography? maybeOf(BuildContext context) => Theme.of(context).extension<MihrTypography>();

  // ─── Material TextTheme bridge ────────────────────────────────────

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
  /// Pass [fontFamily] to generate for a different typeface.
  static TextTheme textTheme({String fontFamily = defaultFontFamily}) {
    final source = fontFamily == defaultFontFamily ? _inter : MihrTypography.fromFontFamily(fontFamily);

    return source.toTextTheme();
  }

  /// Builds a Material [TextTheme] from this typography instance.
  ///
  /// Use this when you construct a custom [MihrTypography] directly
  /// (e.g. via a `MihrThemeConfig(typography: ...)` override) and
  /// want the Material [TextTheme] to reflect your custom styles.
  TextTheme toTextTheme() {
    return TextTheme(
      displayLarge: display2xl.regular,
      displayMedium: displayXl.regular,
      displaySmall: displayLg.regular,
      headlineLarge: displayMd.semibold,
      headlineMedium: displaySm.semibold,
      headlineSmall: displayXs.semibold,
      titleLarge: textXl.semibold,
      titleMedium: textLg.medium,
      titleSmall: textMd.medium,
      bodyLarge: textMd.regular,
      bodyMedium: textSm.regular,
      bodySmall: textXs.regular,
      labelLarge: textSm.medium,
      labelMedium: textXs.medium,
      labelSmall: textXs.regular,
    );
  }

  // ─── ThemeExtension overrides ─────────────────────────────────────

  @override
  MihrTypography copyWith({
    String? fontFamily,
    TypeStyle? display2xl,
    TypeStyle? displayXl,
    TypeStyle? displayLg,
    TypeStyle? displayMd,
    TypeStyle? displaySm,
    TypeStyle? displayXs,
    TypeStyle? textXl,
    TypeStyle? textLg,
    TypeStyle? textMd,
    TypeStyle? textSm,
    TypeStyle? textXs,
  }) =>
      MihrTypography(
        fontFamily: fontFamily ?? this.fontFamily,
        display2xl: display2xl ?? this.display2xl,
        displayXl: displayXl ?? this.displayXl,
        displayLg: displayLg ?? this.displayLg,
        displayMd: displayMd ?? this.displayMd,
        displaySm: displaySm ?? this.displaySm,
        displayXs: displayXs ?? this.displayXs,
        textXl: textXl ?? this.textXl,
        textLg: textLg ?? this.textLg,
        textMd: textMd ?? this.textMd,
        textSm: textSm ?? this.textSm,
        textXs: textXs ?? this.textXs,
      );

  @override
  MihrTypography lerp(
    covariant MihrTypography? other,
    double t,
  ) {
    if (other == null) return this;
    return t < 0.5 ? this : other;
  }

  // ─── Private helpers ──────────────────────────────────────────────

  static const double _displayTrackingPercent = -0.02;

  static double _tracking(double fontSize) => fontSize * _displayTrackingPercent;

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
