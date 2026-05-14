# Mihr UI

[![pub package](https://img.shields.io/pub/v/mihr_ui.svg)](https://pub.dev/packages/mihr_ui)
[![CI](https://github.com/mrasityilmaz/mihr_ui/actions/workflows/ci.yaml/badge.svg?branch=develop)](https://github.com/mrasityilmaz/mihr_ui/actions/workflows/ci.yaml)
[![codecov](https://codecov.io/gh/mrasityilmaz/mihr_ui/branch/develop/graph/badge.svg)](https://codecov.io/gh/mrasityilmaz/mihr_ui)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

A complete Flutter UI kit with design tokens, semantic theme extensions, WCAG-compliant palette generation, and production-ready components.

## Features

- 6 core + 17 accent + 7 gray color palettes (12 shades each)
- 7 semantic ThemeExtension classes (TextColors, BackgroundColors, BorderColors, ForegroundColors, AlphaColors, UtilityColors, ComponentColors)
- Runtime palette generation from any color with WCAG AA auto-correction
- Typography scale: 11 sizes × 4 weights with Material TextTheme bridge
- Spacing system: 30 primitives + 17 semantic tokens + EdgeInsets/Gap helpers
- Border radius: 11 named sizes with pre-built BorderRadius constants
- Shadows, backdrop blurs, and gradient systems
- Automatic light/dark mode switching
- Button component system: 6 types × 4 sizes with icon variants
- Full Material ColorScheme bridge (30+ properties, 22 widget themes)

## Installation

```yaml
dependencies:
  mihr_ui: ^0.1.0-dev.1
```

## Quick Start

```dart
import 'package:mihr_ui/mihr_ui.dart';

MaterialApp(
  theme: MihrTheme.light(),
  darkTheme: MihrTheme.dark(),
  home: const MyApp(),
);
```

## Customization

Mihr UI exposes four independent customization layers — pick the narrowest one
that solves your problem.

| # | Layer | Scope | API |
|---|---|---|---|
| 1 | **Preset** | App-wide defaults | `MihrThemeConfig` |
| 2 | **Component theme** | One component family | `MihrThemeConfig.buttonTheme` (and friends) |
| 3 | **Per-instance** | One widget | `style` / `styleBuilder` on the widget |
| 4 | **Material escape-hatch** | Raw `ThemeData` | `MihrThemeConfig.materialOverrides` |

### 1. Preset — `MihrThemeConfig`

The canonical configuration object. Groups brand palette, typography, and every
component theme into a single immutable value you can share across apps.

```dart
final cfg = MihrThemeConfig(
  brand: ColorScaleGenerator.fromHex('#E63946'),
  fontFamily: 'Roboto',
);

MaterialApp(
  theme: MihrTheme.light(config: cfg),
  darkTheme: MihrTheme.dark(config: cfg),
);
```

### 2. Component theme

Customize a whole component family (shape, shadows, per-variant style) via a
theme extension. Example: flatten every button and override the primary fill.

```dart
MihrThemeConfig(
  buttonTheme: MihrButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    shadows: MihrButtonShadows.flat,
    primaryStyle: const ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.indigo),
    ),
  ),
);
```

### 3. Per-instance

Every Mihr component accepts a `style` (and often `styleBuilder`) prop that
wins over theme-level defaults.

```dart
MihrPrimaryButton(
  onPressed: _save,
  style: const ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(Colors.teal),
  ),
  child: const Text('Save'),
);
```

### 4. Material escape-hatch — `materialOverrides`

For Material properties Mihr does not model semantically (e.g.
`scaffoldBackgroundColor`, `AppBarTheme.centerTitle`, `cardTheme`), pass a
callback that receives the fully-built `ThemeData` with every Mihr default and
returns a modified copy. Use `base.bgColors`, `base.textColors`,
`base.mihrTypography`, and friends to read Mihr tokens ergonomically — no new
classes required.

```dart
MihrThemeConfig(
  brand: AccentColors.indigo,
  materialOverrides: (base) => base.copyWith(
    scaffoldBackgroundColor: base.bgColors.secondary,
    appBarTheme: base.appBarTheme.copyWith(
      centerTitle: true,
      backgroundColor: base.bgColors.brandSolid,
      foregroundColor: base.textColors.white,
    ),
    cardTheme: base.cardTheme.copyWith(color: base.bgColors.tertiary),
  ),
);
```

### Accessing tokens anywhere

From a widget, use the `BuildContext` extension:

```dart
context.textColors.primary
context.bgColors.brandSolid
```

From a `ThemeData` (inside `materialOverrides`, tests, or non-widget code),
use the parallel `ThemeData` extension:

```dart
theme.textColors.primary
theme.bgColors.brandSolid
```

## Semantic Token Reference

| Extension | Getter | Tokens |
|---|---|---|
| TextColors | `context.textColors` | 23 |
| BackgroundColors | `context.bgColors` | 32 |
| BorderColors | `context.borderColors` | 10 |
| ForegroundColors | `context.fgColors` | 21 |
| AlphaColors | `context.alphaColors` | 20 |
| UtilityColors | `context.utilityColors` | 18 families |
| ComponentColors | `context.componentColors` | 29 |

## Components

Available button types:

- **MihrPrimaryButton** — solid brand fill, highest emphasis
- **MihrSoftPrimaryButton** — tinted brand fill, no border
- **MihrSecondaryButton** — outlined with gray border
- **MihrTertiaryButton** — ghost / transparent
- **MihrLinkButton** — inline text link (brand or gray)
- **MihrDestructiveButton** — error variants (primary, soft, secondary, tertiary, link)

All buttons support 4 sizes (`sm`, `md`, `lg`, `xl`) and icon variants.

## Contributing

Contributions are welcome! Please read our [Contributing Guide](CONTRIBUTING.md) before submitting a PR.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
