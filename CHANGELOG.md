# Changelog

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
