# Changelog

## [Unreleased]

## [0.1.0-dev.3] - 2026-05-14

### Added

- **Theme**: `MihrThemeConfig` — immutable preset that groups all theme
  customization (brand, gray, error/warning/success palettes, font family,
  button theme, extra extensions, and `materialOverrides` escape-hatch) into
  a single shareable value with `copyWith` support.
- **Buttons**: `MihrButtonData` — `InheritedWidget` inserted above every button's
  content; exposes resolved `foregroundColor`, `iconColor`, and `backgroundColor`
  to arbitrary child widgets (custom painters, SVGs, progress indicators).
- **Buttons**: `styleBuilder` parameter on all button variants — receives the
  fully merged default + theme `ButtonStyle` and returns a modified copy;
  mutually exclusive with `style`.
- **Typography**: `MihrTypography.of(context)` / `MihrTypography.maybeOf(context)`
  — typed context accessors for the font-family-aware instance registered in the
  theme. Also available as `context.typography`.
- **Typography**: `MihrTypography.fromFontFamily(String)` constructor — builds a
  full type-scale instance for any font family, caching the default Inter instance.

### Changed

- **Theme**: `MihrTheme.light()` / `MihrTheme.dark()` named parameters (`brand`,
  `gray`, `error`, `warning`, `success`, `fontFamily`, `buttonTheme`) are now
  `@Deprecated`. Pass a `MihrThemeConfig` via the `config:` parameter instead.
  Removal scheduled for **0.2.0**.

### Fixed

- **Buttons**: `MihrTertiaryButton` (ghost) hover background used `bg.tertiary`
  — semantically reserved for toggles/sliders and identical to `bg.primaryHover`
  in dark mode, producing invisible hover on dark surfaces. Corrected to
  `bg.primaryHover` (one step above the primary surface, consistent with
  `MihrSecondaryButton`). Added light + dark hover regression tests for
  `MihrTertiaryButton`, `MihrSecondaryButton`, and `MihrDestructiveButton.tertiary`.

### Removed

- **BREAKING — Buttons**: `MihrButtonThemeData.sizes` and `linkSizes` custom size
  override properties removed. Use the `styleBuilder` or per-instance `style`
  parameter to adjust padding and height constraints.
- **BREAKING — Buttons**: `MihrButtonShadows.focusOuter` property and
  `withFocusRing()` method removed. Focus rings are now handled internally.
- **BREAKING — Typography**: Static `MihrTypography.displayXxx` /
  `MihrTypography.textXxx` properties removed. Replace all direct static access
  with `context.typography.displayXxx` or `MihrTypography.of(context).displayXxx`.

## [0.1.0-dev.2]

### Fixed

- README badges now use dynamic Codecov coverage and CI status for
the `develop` branch instead of hardcoded values.

### Changed

- Widened SDK constraints: Dart `>=3.4.0`, Flutter `>=3.22.0`.

## [0.1.0-dev.1]

### Added

- **Color system**: `ColorScale` data class with 12 shades (25-950), 6 core
palettes (brand, gray, grayDark, error, warning, success), 17 accent palettes,
and 7 gray variants.
- **Semantic tokens**: `TextColors` (23), `BackgroundColors` (32),
`BorderColors` (10), `ForegroundColors` (21), `AlphaColors` (20),
`UtilityColors` (18 families), `ComponentColors` (29).
- `**ColorScaleGenerator`**: Runtime palette generation from a single color with
WCAG AA auto-correction and contrast reporting.
- **Typography**: `MihrTypography` with 11 sizes x 4 weights (44 styles) and
Material `TextTheme` bridge.
- **Spacing**: `MihrSpacing` with 30 primitives + 17 semantic tokens +
`EdgeInsets` / `SizedBox` gap helpers. `MihrWidths` for max-width constraints.
`MihrBreakpoints` for responsive grid configuration.
- **Border radius**: `MihrRadius` with 11 named sizes (none-full) and pre-built
`BorderRadius` constants.
- **Shadows**: `MihrBackdropBlurs` with 4 presets (sm/md/lg/xl).
- **Gradients**: `GrayGradients` (14), `BrandGradients` (7),
`DecoGradients` (91 decorative).
- **Theme**: `MihrTheme.light()` / `.dark()` with full Material `ColorScheme`
(30+ properties), 22 widget theme overrides, and all semantic token extensions.
- **Buttons**: `MihrPrimaryButton`, `MihrSoftPrimaryButton`,
`MihrSecondaryButton`, `MihrTertiaryButton`, `MihrLinkButton`,
`MihrDestructiveButton` with 4 sizes (sm/md/lg/xl), icon variants, loading
state, and `MihrButtonThemeData` extension.
