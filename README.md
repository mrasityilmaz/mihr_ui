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

Use a custom brand color:

```dart
MihrTheme.light(brand: ColorScaleGenerator.fromHex('#E63946'))
```

Access semantic tokens via context extensions:

```dart
context.textColors.primary
context.bgColors.brandSolid
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
