import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('MihrTheme.light()', () {
    late ThemeData theme;

    setUp(() {
      theme = MihrTheme.light();
    });

    test('returns a valid ThemeData', () {
      expect(theme, isA<ThemeData>());
    });

    test('has Brightness.light in ColorScheme', () {
      expect(theme.colorScheme.brightness, Brightness.light);
    });

    test('has Brightness.light in ThemeData', () {
      expect(theme.brightness, Brightness.light);
    });

    test('registers TextColors extension', () {
      expect(theme.extension<TextColors>(), isNotNull);
      expect(theme.extension<TextColors>(), isA<TextColors>());
    });

    test('registers BackgroundColors extension', () {
      expect(theme.extension<BackgroundColors>(), isNotNull);
      expect(
        theme.extension<BackgroundColors>(),
        isA<BackgroundColors>(),
      );
    });

    test('registers BorderColors extension', () {
      expect(theme.extension<BorderColors>(), isNotNull);
      expect(
        theme.extension<BorderColors>(),
        isA<BorderColors>(),
      );
    });

    test('registers ForegroundColors extension', () {
      expect(theme.extension<ForegroundColors>(), isNotNull);
      expect(
        theme.extension<ForegroundColors>(),
        isA<ForegroundColors>(),
      );
    });

    test('registers AlphaColors extension', () {
      expect(theme.extension<AlphaColors>(), isNotNull);
      expect(
        theme.extension<AlphaColors>(),
        isA<AlphaColors>(),
      );
    });

    test('registers UtilityColors extension', () {
      expect(theme.extension<UtilityColors>(), isNotNull);
      expect(
        theme.extension<UtilityColors>(),
        isA<UtilityColors>(),
      );
    });

    test('registers ComponentColors extension', () {
      expect(theme.extension<ComponentColors>(), isNotNull);
      expect(
        theme.extension<ComponentColors>(),
        isA<ComponentColors>(),
      );
    });

    test('registers MihrButtonThemeData extension', () {
      expect(
        theme.extension<MihrButtonThemeData>(),
        isNotNull,
      );
      expect(
        theme.extension<MihrButtonThemeData>(),
        isA<MihrButtonThemeData>(),
      );
    });
  });

  group('MihrTheme.dark()', () {
    late ThemeData theme;

    setUp(() {
      theme = MihrTheme.dark();
    });

    test('returns a valid ThemeData', () {
      expect(theme, isA<ThemeData>());
    });

    test('has Brightness.dark in ColorScheme', () {
      expect(theme.colorScheme.brightness, Brightness.dark);
    });

    test('has Brightness.dark in ThemeData', () {
      expect(theme.brightness, Brightness.dark);
    });

    test('registers TextColors extension', () {
      expect(theme.extension<TextColors>(), isNotNull);
    });

    test('registers BackgroundColors extension', () {
      expect(theme.extension<BackgroundColors>(), isNotNull);
    });

    test('registers BorderColors extension', () {
      expect(theme.extension<BorderColors>(), isNotNull);
    });

    test('registers ForegroundColors extension', () {
      expect(theme.extension<ForegroundColors>(), isNotNull);
    });

    test('registers AlphaColors extension', () {
      expect(theme.extension<AlphaColors>(), isNotNull);
    });

    test('registers UtilityColors extension', () {
      expect(theme.extension<UtilityColors>(), isNotNull);
    });

    test('registers ComponentColors extension', () {
      expect(theme.extension<ComponentColors>(), isNotNull);
    });

    test('registers MihrButtonThemeData extension', () {
      expect(
        theme.extension<MihrButtonThemeData>(),
        isNotNull,
      );
    });
  });

  group('MihrTheme custom brand palette', () {
    test('light theme propagates custom brand to ColorScheme', () {
      final customBrand = ColorScaleGenerator.fromHex('#E63946');
      final theme = MihrTheme.light(brand: customBrand);

      expect(
        theme.colorScheme.primary,
        equals(customBrand.shade600),
      );
    });

    test('dark theme propagates custom brand to ColorScheme', () {
      final customBrand = ColorScaleGenerator.fromHex('#E63946');
      final theme = MihrTheme.dark(brand: customBrand);

      expect(
        theme.colorScheme.primary,
        equals(customBrand.shade500),
      );
    });

    test('custom brand reaches TextColors extension', () {
      final customBrand = ColorScaleGenerator.fromHex('#3B82F6');
      final theme = MihrTheme.light(brand: customBrand);
      final textColors = theme.extension<TextColors>()!;

      expect(textColors, isNotNull);
    });

    test('custom brand reaches ComponentColors extension', () {
      final customBrand = ColorScaleGenerator.fromHex('#3B82F6');
      final theme = MihrTheme.light(brand: customBrand);
      final compColors = theme.extension<ComponentColors>()!;

      expect(compColors, isNotNull);
    });
  });

  group('MihrTheme fontFamily parameter', () {
    test('light theme defaults to Inter in TextTheme', () {
      final theme = MihrTheme.light();
      expect(
        theme.textTheme.bodyMedium?.fontFamily,
        equals('Inter'),
      );
    });

    test('dark theme defaults to Inter in TextTheme', () {
      final theme = MihrTheme.dark();
      expect(
        theme.textTheme.bodyMedium?.fontFamily,
        equals('Inter'),
      );
    });

    test('light theme applies custom fontFamily', () {
      final theme = MihrTheme.light(fontFamily: 'DM Sans');
      expect(
        theme.textTheme.bodyMedium?.fontFamily,
        equals('DM Sans'),
      );
    });

    test('dark theme applies custom fontFamily', () {
      final theme = MihrTheme.dark(fontFamily: 'Roboto');
      expect(
        theme.textTheme.bodyMedium?.fontFamily,
        equals('Roboto'),
      );
    });

    test(
      'custom fontFamily propagates to display styles',
      () {
        final theme = MihrTheme.light(fontFamily: 'DM Sans');
        expect(
          theme.textTheme.displayLarge?.fontFamily,
          equals('DM Sans'),
        );
      },
    );
  });
}
