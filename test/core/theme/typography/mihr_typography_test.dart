import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  final typo = MihrTypography.fromFontFamily(MihrTypography.defaultFontFamily);

  group('MihrTypography size levels', () {
    test('has exactly 11 size levels in allStyles', () {
      expect(typo.allStyles.length, equals(11));
    });

    test('display2xl has fontSize 72', () {
      expect(typo.display2xl.regular.fontSize, equals(72));
    });

    test('displayXl has fontSize 60', () {
      expect(typo.displayXl.regular.fontSize, equals(60));
    });

    test('displayLg has fontSize 48', () {
      expect(typo.displayLg.regular.fontSize, equals(48));
    });

    test('displayMd has fontSize 36', () {
      expect(typo.displayMd.regular.fontSize, equals(36));
    });

    test('displaySm has fontSize 30', () {
      expect(typo.displaySm.regular.fontSize, equals(30));
    });

    test('displayXs has fontSize 24', () {
      expect(typo.displayXs.regular.fontSize, equals(24));
    });

    test('textXl has fontSize 20', () {
      expect(typo.textXl.regular.fontSize, equals(20));
    });

    test('textLg has fontSize 18', () {
      expect(typo.textLg.regular.fontSize, equals(18));
    });

    test('textMd has fontSize 16', () {
      expect(typo.textMd.regular.fontSize, equals(16));
    });

    test('textSm has fontSize 14', () {
      expect(typo.textSm.regular.fontSize, equals(14));
    });

    test('textXs has fontSize 12', () {
      expect(typo.textXs.regular.fontSize, equals(12));
    });
  });

  group('TypeStyle weight variants', () {
    test('each TypeStyle has regular (w400)', () {
      for (final style in typo.allStyles) {
        expect(style.regular.fontWeight, equals(FontWeight.w400));
      }
    });

    test('each TypeStyle has medium (w500)', () {
      for (final style in typo.allStyles) {
        expect(style.medium.fontWeight, equals(FontWeight.w500));
      }
    });

    test('each TypeStyle has semibold (w600)', () {
      for (final style in typo.allStyles) {
        expect(style.semibold.fontWeight, equals(FontWeight.w600));
      }
    });

    test('each TypeStyle has bold (w700)', () {
      for (final style in typo.allStyles) {
        expect(style.bold.fontWeight, equals(FontWeight.w700));
      }
    });
  });

  group('Display styles letter spacing', () {
    final displayStyles = [
      ('display2xl', typo.display2xl, 72.0),
      ('displayXl', typo.displayXl, 60.0),
      ('displayLg', typo.displayLg, 48.0),
      ('displayMd', typo.displayMd, 36.0),
      ('displaySm', typo.displaySm, 30.0),
      ('displayXs', typo.displayXs, 24.0),
    ];

    for (final (name, style, fontSize) in displayStyles) {
      test('$name has -2% letter spacing', () {
        final expected = fontSize * -0.02;
        expect(style.regular.letterSpacing, closeTo(expected, 0.001));
        expect(style.bold.letterSpacing, closeTo(expected, 0.001));
      });
    }
  });

  group('Text styles letter spacing', () {
    final textStyles = [
      ('textXl', typo.textXl),
      ('textLg', typo.textLg),
      ('textMd', typo.textMd),
      ('textSm', typo.textSm),
      ('textXs', typo.textXs),
    ];

    for (final (name, style) in textStyles) {
      test('$name has zero letter spacing', () {
        expect(style.regular.letterSpacing, equals(0));
        expect(style.bold.letterSpacing, equals(0));
      });
    }
  });

  group('MihrTypography.textTheme()', () {
    test('returns a valid TextTheme', () {
      final textTheme = MihrTypography.textTheme();
      expect(textTheme, isA<TextTheme>());
    });

    test('all Material slots are filled', () {
      final textTheme = MihrTypography.textTheme();

      expect(textTheme.displayLarge, isNotNull);
      expect(textTheme.displayMedium, isNotNull);
      expect(textTheme.displaySmall, isNotNull);
      expect(textTheme.headlineLarge, isNotNull);
      expect(textTheme.headlineMedium, isNotNull);
      expect(textTheme.headlineSmall, isNotNull);
      expect(textTheme.titleLarge, isNotNull);
      expect(textTheme.titleMedium, isNotNull);
      expect(textTheme.titleSmall, isNotNull);
      expect(textTheme.bodyLarge, isNotNull);
      expect(textTheme.bodyMedium, isNotNull);
      expect(textTheme.bodySmall, isNotNull);
      expect(textTheme.labelLarge, isNotNull);
      expect(textTheme.labelMedium, isNotNull);
      expect(textTheme.labelSmall, isNotNull);
    });

    test('displayLarge maps to display2xl (72px)', () {
      final textTheme = MihrTypography.textTheme();
      expect(textTheme.displayLarge!.fontSize, equals(72));
    });

    test('bodyMedium maps to textSm (14px)', () {
      final textTheme = MihrTypography.textTheme();
      expect(textTheme.bodyMedium!.fontSize, equals(14));
    });

    test('headlineLarge maps to displayMd semibold (36px)', () {
      final textTheme = MihrTypography.textTheme();
      expect(textTheme.headlineLarge!.fontSize, equals(36));
      expect(
        textTheme.headlineLarge!.fontWeight,
        equals(FontWeight.w600),
      );
    });

    test('with custom fontFamily propagates to all slots', () {
      final textTheme =
          MihrTypography.textTheme(fontFamily: 'DM Sans');

      expect(
        textTheme.displayLarge!.fontFamily,
        equals('DM Sans'),
      );
      expect(
        textTheme.bodyMedium!.fontFamily,
        equals('DM Sans'),
      );
      expect(
        textTheme.labelSmall!.fontFamily,
        equals('DM Sans'),
      );
    });
  });

  group('TypeStyle.withFontFamily()', () {
    test('changes font family on all weight variants', () {
      final custom = typo.textMd.withFontFamily('DM Sans');

      expect(custom.regular.fontFamily, equals('DM Sans'));
      expect(custom.medium.fontFamily, equals('DM Sans'));
      expect(custom.semibold.fontFamily, equals('DM Sans'));
      expect(custom.bold.fontFamily, equals('DM Sans'));
    });

    test('preserves fontSize after font family change', () {
      final custom = typo.displayLg.withFontFamily('Roboto');

      expect(custom.regular.fontSize, equals(48));
      expect(custom.bold.fontSize, equals(48));
    });

    test('preserves letter spacing after font family change', () {
      final custom = typo.displayMd.withFontFamily('Poppins');
      const expected = 36.0 * -0.02;

      expect(
        custom.regular.letterSpacing,
        closeTo(expected, 0.001),
      );
    });
  });

  group('MihrTypography.fromFontFamily()', () {
    test('returns cached instance for default font', () {
      final a =
          MihrTypography.fromFontFamily(MihrTypography.defaultFontFamily);
      final b =
          MihrTypography.fromFontFamily(MihrTypography.defaultFontFamily);
      expect(identical(a, b), isTrue);
    });

    test('applies custom fontFamily to all type styles', () {
      final custom = MihrTypography.fromFontFamily('Exo');

      expect(custom.fontFamily, equals('Exo'));
      expect(custom.display2xl.regular.fontFamily, equals('Exo'));
      expect(custom.textMd.semibold.fontFamily, equals('Exo'));
      expect(custom.textXs.bold.fontFamily, equals('Exo'));
    });

    test('preserves font sizes from standard', () {
      final custom = MihrTypography.fromFontFamily('Exo');

      expect(custom.display2xl.regular.fontSize, equals(72));
      expect(custom.textMd.regular.fontSize, equals(16));
      expect(custom.textXs.regular.fontSize, equals(12));
    });
  });

  group('MihrTypography.defaultFontFamily', () {
    test('is Inter', () {
      expect(MihrTypography.defaultFontFamily, equals('Inter'));
    });
  });

  group('MihrTypography ThemeExtension', () {
    test('copyWith preserves unchanged fields', () {
      final copy = typo.copyWith(fontFamily: 'Exo');

      expect(copy.fontFamily, equals('Exo'));
      expect(
        copy.display2xl.regular.fontSize,
        equals(typo.display2xl.regular.fontSize),
      );
    });

    test('lerp returns this when other is null', () {
      final result = typo.lerp(null, 0.5);
      expect(identical(result, typo), isTrue);
    });

    test('lerp returns this below 0.5', () {
      final other = MihrTypography.fromFontFamily('Exo');
      final result = typo.lerp(other, 0.3);
      expect(identical(result, typo), isTrue);
    });

    test('lerp returns other at 0.5 or above', () {
      final other = MihrTypography.fromFontFamily('Exo');
      final result = typo.lerp(other, 0.5);
      expect(identical(result, other), isTrue);
    });
  });
}
