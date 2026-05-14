// The legacy @Deprecated API on MihrTheme.light/dark is exercised here
// so we can assert it still forwards into the new config-based path.
// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('MihrThemeConfig', () {
    test('default constructor produces equal instances', () {
      const a = MihrThemeConfig();
      const b = MihrThemeConfig();
      expect(a, equals(b));
      expect(a.hashCode, equals(b.hashCode));
    });

    test('uses the default font family when unset', () {
      const cfg = MihrThemeConfig();
      expect(cfg.fontFamily, MihrTypography.defaultFontFamily);
    });

    test('copyWith replaces only the specified fields', () {
      const original = MihrThemeConfig();
      final updated = original.copyWith(brand: AccentColors.indigo);

      expect(updated.brand, AccentColors.indigo);
      expect(updated.fontFamily, original.fontFamily);
      expect(updated.gray, original.gray);
      expect(updated, isNot(equals(original)));
    });

    test('instances with identical fields compare equal', () {
      const buttonTheme = MihrButtonThemeData();
      const a = MihrThemeConfig(
        brand: AccentColors.indigo,
        buttonTheme: buttonTheme,
      );
      const b = MihrThemeConfig(
        brand: AccentColors.indigo,
        buttonTheme: buttonTheme,
      );
      expect(a, equals(b));
    });
  });

  group('MihrTheme.light(config:)', () {
    test('applies config.brand to ColorScheme.primary', () {
      const cfg = MihrThemeConfig(brand: AccentColors.indigo);
      final theme = MihrTheme.light(config: cfg);

      expect(theme.colorScheme.primary, AccentColors.indigo.shade600);
    });

    test('registers the supplied buttonTheme as a ThemeExtension', () {
      final shape = RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );
      final cfg = MihrThemeConfig(
        buttonTheme: MihrButtonThemeData(shape: shape),
      );

      final theme = MihrTheme.light(config: cfg);
      final registered = theme.extension<MihrButtonThemeData>();

      expect(registered, isNotNull);
      expect(registered!.shape, shape);
    });

    test('registers every extra extension', () {
      const extra = _DummyExtension(42);
      const cfg = MihrThemeConfig(
        extraExtensions: <ThemeExtension<dynamic>>[extra],
      );

      final theme = MihrTheme.light(config: cfg);

      expect(theme.extension<_DummyExtension>(), equals(extra));
    });

    test('materialOverrides runs last and can override scaffold bg', () {
      final cfg = MihrThemeConfig(
        materialOverrides: (base) => base.copyWith(
          scaffoldBackgroundColor: base.bgColors.secondary,
        ),
      );

      final theme = MihrTheme.light(config: cfg);

      expect(theme.scaffoldBackgroundColor, theme.bgColors.secondary);
    });

    test(
      'materialOverrides receives a base with Mihr extensions attached',
      () {
        late TextColors captured;
        final cfg = MihrThemeConfig(
          materialOverrides: (base) {
            captured = base.textColors;
            return base;
          },
        );

        MihrTheme.light(config: cfg);

        expect(captured, isNotNull);
      },
    );
  });

  group('MihrTheme.dark(config:)', () {
    test('uses grayDark when config.gray is null', () {
      final theme = MihrTheme.dark();

      expect(theme.scaffoldBackgroundColor, MihrColors.grayDark.shade950);
    });

    test('honours config.gray when provided', () {
      const cfg = MihrThemeConfig(gray: MihrColors.gray);
      final theme = MihrTheme.dark(config: cfg);

      expect(theme.scaffoldBackgroundColor, MihrColors.gray.shade950);
    });
  });

  group('deprecated API forwarding', () {
    test('MihrTheme.light(brand:) matches MihrTheme.light(config: ...)', () {
      const brand = AccentColors.orange;
      final legacy = MihrTheme.light(brand: brand);
      final modern = MihrTheme.light(
        config: const MihrThemeConfig(brand: brand),
      );

      expect(legacy.colorScheme.primary, modern.colorScheme.primary);
      expect(
        legacy.extension<BackgroundColors>()!.brandSolid,
        modern.extension<BackgroundColors>()!.brandSolid,
      );
    });

    test('legacy params merge into config when both are supplied', () {
      final buttonTheme = MihrButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      );
      final theme = MihrTheme.light(
        config: const MihrThemeConfig(brand: AccentColors.indigo),
        buttonTheme: buttonTheme,
      );

      expect(theme.colorScheme.primary, AccentColors.indigo.shade600);
      expect(theme.extension<MihrButtonThemeData>(), buttonTheme);
    });
  });

  group('MihrThemeDataExtension', () {
    test('mirrors BuildContext getters on ThemeData', () {
      final theme = MihrTheme.light();

      expect(theme.textColors, theme.extension<TextColors>());
      expect(theme.bgColors, theme.extension<BackgroundColors>());
      expect(theme.borderColors, theme.extension<BorderColors>());
      expect(theme.fgColors, theme.extension<ForegroundColors>());
      expect(theme.alphaColors, theme.extension<AlphaColors>());
      expect(theme.utilityColors, theme.extension<UtilityColors>());
      expect(theme.componentColors, theme.extension<ComponentColors>());
      expect(theme.mihrTypography, theme.extension<MihrTypography>());
      expect(theme.mihrButtonTheme, theme.extension<MihrButtonThemeData>());
    });
  });
}

@immutable
class _DummyExtension extends ThemeExtension<_DummyExtension> {
  const _DummyExtension(this.value);

  final int value;

  @override
  ThemeExtension<_DummyExtension> copyWith({int? value}) =>
      _DummyExtension(value ?? this.value);

  @override
  ThemeExtension<_DummyExtension> lerp(
    covariant ThemeExtension<_DummyExtension>? other,
    double t,
  ) =>
      this;

  @override
  bool operator ==(Object other) =>
      other is _DummyExtension && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
