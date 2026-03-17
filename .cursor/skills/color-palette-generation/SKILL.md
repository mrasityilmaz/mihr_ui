# Color Palette Generation for Mihr UI

## When to Use This Skill

Use this skill when the user asks to:
- Create a new brand/theme color palette from a single base color
- Generate a full 12-shade color scale (25 to 950) for any color
- Change the brand color of the Mihr UI Flutter theme
- Understand how color palette shades are constructed
- Create a custom gray or accent color palette
- Debug contrast issues or check WCAG compliance

**IMPORTANT**: After generating any palette, you MUST run `flutter test test/core/theme/colors/color_scale_generator_test.dart` and report the results. See "Automated Validation" section below.

## Color Scale Architecture

The Mihr UI system uses a **12-shade scale** per color family: `25, 50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 950`.

Each shade has a purpose:
| Shade | Purpose | Lightness Range (approx.) |
|-------|---------|--------------------------|
| 25    | Lightest tint, subtle backgrounds | 97-99% |
| 50    | Light backgrounds | 95-97% |
| 100   | Light accents, hover backgrounds | 90-94% |
| 200   | Light borders, secondary backgrounds | 83-88% |
| 300   | Borders, disabled states | 72-78% |
| 400   | Mid icons, placeholder text | 58-65% |
| 500   | **Base color** — the reference point | 48-55% |
| 600   | **Primary interactive** — buttons, links | 38-45% |
| 700   | Dark hover states | 30-38% |
| 800   | Dark accents | 24-30% |
| 900   | High-contrast text | 18-24% |
| 950   | Darkest shade, dark backgrounds | 10-16% |

## ColorScaleGenerator — Runtime Palette Generation

The `ColorScaleGenerator` utility class generates a complete 12-shade `ColorScale` from a single brand color. The provided color is treated as **shade 600** (the primary interactive shade used for buttons, links, and active states).

### Quick Usage

```dart
import 'package:mihr_ui/core/theme/colors/color_scale_generator.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

// Generate palette from a single color
final myBrand = ColorScaleGenerator.fromColor(Color(0xFFE63946));
// or from hex string
final myBrand = ColorScaleGenerator.fromHex('#E63946');

// Apply to theme — all semantic tokens auto-propagate
MaterialApp(
  theme: MihrTheme.light(brand: myBrand),
  darkTheme: MihrTheme.dark(brand: myBrand),
);
```

### With Contrast Report

```dart
final (palette, report) = ColorScaleGenerator.fromColorWithReport(
  Color(0xFFE63946),
);

if (!report.allPassed) {
  debugPrint('WCAG issues found:');
  for (final failure in report.failures) {
    debugPrint('  $failure');
  }
}
```

### How It Works

1. **Anchor at shade 600**: The input color's HSL lightness is clamped to [0.25, 0.60] and placed at shade 600.
2. **Proportional distribution**: Lighter shades (25-500) are spread proportionally between shade 600 and white. Darker shades (700-950) are spread between shade 600 and black. Fractions are derived from averaging Mihr UI's brand, error, warning, and success palettes.
3. **Saturation curve**: Peak saturation at shade 500-600, tapering at extremes. Light extremes keep high saturation (barely visible at high lightness anyway). Dark extremes reduce to avoid muddiness.
4. **Hue shift**: Subtle warmth shift (+2° max) for lighter shades, depth shift (-4° max) for darker shades.
5. **WCAG auto-correction**: Eight contrast rules are checked and shades are auto-corrected by adjusting lightness.

### WCAG Contrast Rules Enforced

| Rule | Foreground | Background | Required Ratio | Purpose |
|------|-----------|-----------|---------------|---------|
| 1 | shade600 | white | >= 4.5:1 | Buttons, links (WCAG AA) |
| 2 | shade700 | white | >= 4.5:1 | Hover states |
| 3 | shade500 | white | >= 3.0:1 | Base accent |
| 4 | shade900 | shade25 | >= 4.5:1 | Primary text on light bg |
| 5 | shade200 | shade900 | >= 4.5:1 | Light text on dark bg |
| 6 | shade50 | shade600 | >= 3.0:1 | Text on brand solid bg |
| 7 | shade300 | shade800 | >= 3.0:1 | Dark mode icon on dark bg |
| 8 | shade400 | shade950 | >= 4.5:1 | Dark mode semantic text |

### Utility Methods

```dart
// Check contrast between any two colors
final ratio = ColorScaleGenerator.contrastRatio(colorA, colorB);

// WCAG AA check (4.5:1 for normal text)
final passes = ColorScaleGenerator.meetsWcagAA(foreground, background);

// WCAG AA for large text / UI components (3:1)
final passes = ColorScaleGenerator.meetsWcagAALarge(foreground, background);
```

## Step-by-Step Manual Palette Generation

When generating palettes manually (without the generator), follow this method based on the Mihr UI methodology:

### Step 1: Define the Base Color (shade 600)

The user provides a single color (hex, RGB, or HSL). This becomes **shade 600** — the primary interactive color.

If the provided color is too light or too dark to be shade 600:
- Convert to HSL
- Adjust Lightness to ~35-55% range
- Keep the Hue, adjust Saturation if needed

### Step 2: Define the Extremes (shade 25 and shade 950)

From the base color's HSL values:

**Shade 25** (lightest):
- Hue: same as base (±2°)
- Saturation: can remain high (barely visible at 98% lightness)
- Lightness: 97-99%

**Shade 950** (darkest):
- Hue: same as base (±5°)
- Saturation: reduce by 20-40%
- Lightness: 10-16%

### Step 3: Fill In the Gaps

Use HSL interpolation with these guidelines:

**Key principle**: This is NOT linear interpolation. Each shade requires manual tuning because:
- Saturation behaves differently at light vs dark ends
- Colors need more saturation at extremes to show any color
- Human perception of "equal steps" is non-linear

**Lightness progression** (approximate targets):
```
25:  ~98%    50:  ~96%    100: ~92%    200: ~85%
300: ~74%    400: ~62%    500: ~50%    600: ~42%
700: ~34%    800: ~27%    900: ~20%    950: ~13%
```

**Saturation progression**:
- Shades 25-100: Keep high (tint barely shows at these lightness levels)
- Shades 200-400: Building saturation (85-95% of base)
- Shades 500-600: Peak saturation (94-100% of base)
- Shades 700-800: Slightly reduced (92-96% of base)
- Shades 900-950: Further reduced (78-86% of base)

### Step 4: Optical Matching

Compare your generated palette against existing palettes in the system:
- Do the shades "look" like they're at the same lightness as corresponding shades in other color families?
- Is the transition smooth from 25 to 950?
- Does shade 600 look appropriate for an interactive button?

## Generating a ColorScale in Dart

When the user asks for a new palette, prefer `ColorScaleGenerator.fromColor()` for automatic generation. For hand-crafted palettes:

```dart
import 'package:flutter/painting.dart';
import 'color_scale.dart';

const myBrand = ColorScale(
  shade25:  Color(0xFFFFF5F5),
  shade50:  Color(0xFFFEEBEB),
  shade100: Color(0xFFFDD5D5),
  shade200: Color(0xFFFBAAAA),
  shade300: Color(0xFFF87A7A),
  shade400: Color(0xFFF15454),
  shade500: Color(0xFFE63946),
  shade600: Color(0xFFCC2936),
  shade700: Color(0xFFAA1F2C),
  shade800: Color(0xFF891A26),
  shade900: Color(0xFF6E1520),
  shade950: Color(0xFF450D14),
);
```

## Applying to the Theme

```dart
import 'package:mihr_ui/core/theme/mihr_theme.dart';

MaterialApp(
  theme: MihrTheme.light(brand: myBrand),
  darkTheme: MihrTheme.dark(brand: myBrand),
);
```

This single call propagates the brand to **all** semantic tokens (TextColors, BackgroundColors, BorderColors, ForegroundColors, ComponentColors, UtilityColors) and the full Material `ColorScheme` + widget themes.

## Material Theme Bridge

`MihrTheme.light()` and `MihrTheme.dark()` configure **both**:

1. **Semantic extensions** (TextColors, BackgroundColors, etc.) — accessed via `context.textColors`, `context.bgColors`, etc.
2. **Full ColorScheme** (30+ properties) — used by standard Material widgets automatically.
3. **Widget theme overrides** (AppBarTheme, ElevatedButtonThemeData, InputDecorationTheme, CardThemeData, CheckboxThemeData, SwitchThemeData, etc.) — ensures Material widgets match the Mihr UI design system.

### Priority Rule

When building custom components, **always use semantic tokens first**:

```dart
// BEST — semantic tokens
Container(color: context.bgColors.brandSolid)
Text('Hi', style: TextStyle(color: context.textColors.primary))

// OK — for standard Material widgets, ColorScheme works automatically
ElevatedButton(onPressed: ..., child: Text('Save')) // uses brand shade600

// AVOID — direct ColorScheme access in custom components
Container(color: Theme.of(context).colorScheme.primary) // prefer context.bgColors
```

### ColorScheme Mapping Reference

| ColorScheme Property | Light Value | Dark Value |
|---------------------|-------------|------------|
| primary | brand.shade600 | brand.shade500 |
| onPrimary | white | white |
| primaryContainer | brand.shade50 | brand.shade800 |
| secondary | gray.shade100 | grayDark.shade800 |
| error | error.shade600 | error.shade500 |
| surface | white | grayDark.shade950 |
| onSurface | gray.shade900 | grayDark.shade50 |
| outline | gray.shade300 | grayDark.shade700 |
| outlineVariant | gray.shade200 | grayDark.shade800 |
| inverseSurface | gray.shade950 | grayDark.shade50 |

## HSL Conversion Formula

```dart
Color baseColor = Color(0xFFE63946);
HSLColor hsl = HSLColor.fromColor(baseColor);

Color shade200 = HSLColor.fromAHSL(
  1.0,
  hsl.hue,
  hsl.saturation * 0.96,
  0.85,
).toColor();
```

## Contrast Validation — WCAG 2.2 Guidelines

| Level | Contrast Ratio | When to Use |
|-------|---------------|-------------|
| Level A | < 4.5:1 | NOT suitable for text. Only decorations. |
| Level AA | >= 4.5:1 | **Minimum for all crucial UI**. Should be default. |
| Level AAA | >= 7:1 | High contrast. Nice-to-have. |

Use `ColorScaleGenerator.contrastRatio()` to validate:

```dart
double contrastRatio(Color a, Color b) {
  final la = a.computeLuminance();
  final lb = b.computeLuminance();
  final lighter = la > lb ? la : lb;
  final darker = la > lb ? lb : la;
  return (lighter + 0.05) / (darker + 0.05);
}
```

## Gray Palette Special Considerations

When generating gray palettes:
- True neutral gray has equal R, G, B values
- Most UI frameworks add a slight undertone (cool, warm, or tinted)
- Mihr UI uses a near-neutral gray — works regardless of brand color; cleaner, more modern
- For a truly flat look, consider `GrayVariants.grayTrue` (completely desaturated)
- For dark mode, use a separate `grayDark` scale with adjusted contrast for readability

When creating custom gray palettes, decide the undertone intentionally:
- Cool/blue-tinted: `GrayVariants.grayBlue`, `GrayVariants.grayCool`
- Warm: `GrayVariants.grayWarm`
- Neutral: default `MihrColors.gray` or `GrayVariants.grayTrue`

## Semantic Token Mapping — How Palettes Become UI

After creating a palette, it's used through semantic tokens. Understanding these mappings is essential:

### Text Color Mapping Pattern

| Hierarchy | Light Shade | Dark Shade | Usage |
|-----------|------------|-----------|-------|
| primary | gray-900 | gray-50 | Page headings |
| secondary | gray-700 | gray-300 | Labels, section headings |
| tertiary | gray-600 | gray-400 | Supporting text |
| quaternary | gray-500 | gray-400 | Subtle text |
| disabled | gray-500 | gray-500 | Disabled fields |
| placeholder | gray-500 | gray-500 | Input placeholders |
| brand-primary | brand-900 | **gray-50** | Brand headings (falls back to gray in dark!) |
| error/warning/success | X-600 | X-400 | Semantic states |

### Key Dark Mode Rules for New Palettes

1. Brand text tokens lose brand tint in dark mode -> map to gray
2. Error/warning/success shift 600->400 (lighter for dark bg contrast)
3. Hover always creates MORE contrast: light = +100 (darker), dark = -100 (lighter)
4. Utility colors invert shade positions: 50<->950, 100<->900, ..., 500 stays
5. Alpha colors swap bases: white->gray-950, black->white

### Runtime Theme Switching

```dart
class MyApp extends StatefulWidget { ... }

class _MyAppState extends State<MyApp> {
  ColorScale _brand = MihrColors.brand;

  void changeBrand(Color newBrandColor) {
    setState(() {
      _brand = ColorScaleGenerator.fromColor(newBrandColor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MihrTheme.light(brand: _brand),
      darkTheme: MihrTheme.dark(brand: _brand),
      home: BrandPicker(onBrandChanged: changeBrand),
    );
  }
}
```

## Automated Validation — Test After Every Palette Generation

**CRITICAL**: Every time you generate a new palette using `ColorScaleGenerator`, you MUST run the test suite to verify the output. Do not assume the palette is correct without test evidence.

### Step-by-step workflow when user requests a new brand palette

1. **Generate the palette** using `ColorScaleGenerator.fromColorWithReport()`:
   ```dart
   final (palette, report) = ColorScaleGenerator.fromColorWithReport(
     Color(0xFFE63946),
   );
   ```

2. **Run the existing test suite** immediately:
   ```bash
   flutter test test/core/theme/colors/color_scale_generator_test.dart
   ```
   This validates:
   - All 8 WCAG contrast rules pass
   - Lightness decreases monotonically (shade25→shade950)
   - shade25 is very light (L > 0.90), shade950 is very dark (L < 0.25)
   - Hue stays within the same color family
   - All semantic token classes accept the palette without error (TextColors, BackgroundColors, BorderColors, ForegroundColors, ComponentColors, UtilityColors)
   - UtilityScale factories (direct, directExtended, inverted, brandInverted) work
   - Real contrast measurements: text on white, text on brandSolid

3. **Add a dedicated test for the new color** if it will become a permanent palette. Add a new entry to the `testColors` map in the "WCAG compliance for diverse colors" group:
   ```dart
   // In test/core/theme/colors/color_scale_generator_test.dart
   final testColors = <String, Color>{
     // ... existing colors ...
     'CustomBrand #E63946': const Color(0xFFE63946), // add new color here
   };
   ```

4. **Report results** to the user — show the test output confirming all tests pass.

### What the tests cover

| Test Group | What It Validates |
|-----------|-------------------|
| Known palette verification | Brand purple (#7F56D9) shade accuracy, WCAG, monotonicity, hue family |
| WCAG compliance for diverse colors | 8+ colors across the spectrum pass all 8 WCAG rules |
| Edge cases | Pure white, pure black, pastels, very dark, low saturation, fully saturated |
| fromHex convenience | Hex parsing (#RRGGBB, RRGGBB, AARRGGBB) |
| Contrast utilities | contrastRatio(), meetsWcagAA() correctness |
| Semantic token compatibility | Generated palette plugs into ALL ThemeExtension factories + real contrast checks |

### If tests fail

- Check the `ContrastReport` output to see which WCAG rule failed
- If monotonicity fails, the generator's `_enforceMonotonicity` pass may need tuning
- If a semantic token factory throws, the palette structure is broken — regenerate
- Never ship a palette that fails tests

## Reference Palettes

The existing Mihr UI palette values are in:
- `lib/core/theme/colors/mihr_colors.dart` — Core (brand, gray, grayDark, error, warning, success)
- `lib/core/theme/colors/accent_colors.dart` — All accent colors (17 families)
- `lib/core/theme/colors/gray_variants.dart` — 7 gray variants with different undertones
- `lib/core/theme/colors/color_scale_generator.dart` — Runtime palette generation + WCAG validation
- `lib/core/theme/colors/mihr_gradients.dart` — Gray, brand, and decorative gradients
- `lib/core/theme/shadows/mihr_backdrop_blurs.dart` — Backdrop blur system

Use these as reference points when generating new palettes. A new palette should "match optically" with these existing ones — similar perceived lightness at each shade level.

## Defining Your Color Palette (Design Principles)

From the Mihr UI color system guide:

1. **A color palette is a set of colors that work well together.** Define it before building components.
2. **Include neutral, primary, and accent colors.** Also feedback colors (success=green, error=red) if forms are used.
3. **8-12 shades per color family is ideal.** Fewer = limited; more = paradox of choice.
4. **Use shades consistently.** Always use gray-300 for input borders, gray-200 for dividers, etc.
5. **Define your color system before you start.** Changing colors post-build cascades through everything.
6. **Use `ColorScaleGenerator` for quick prototyping.** Generate a palette from your brand color and iterate.
