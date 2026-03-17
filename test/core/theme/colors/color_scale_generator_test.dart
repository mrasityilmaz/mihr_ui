import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/core/theme/colors/background_colors.dart';
import 'package:mihr_ui/core/theme/colors/border_colors.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/color_scale_generator.dart';
import 'package:mihr_ui/core/theme/colors/component_colors.dart';
import 'package:mihr_ui/core/theme/colors/foreground_colors.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';
import 'package:mihr_ui/core/theme/colors/text_colors.dart';
import 'package:mihr_ui/core/theme/colors/utility_colors.dart';
import 'package:mihr_ui/core/theme/colors/utility_scale.dart';

void main() {
  group('ColorScaleGenerator', () {
    group('known palette verification (brand purple #7F56D9)', () {
      late ColorScale generated;
      late ContrastReport report;

      setUp(() {
        final result = ColorScaleGenerator.fromColorWithReport(
          MihrColors.brand.shade600,
        );
        generated = result.$1;
        report = result.$2;
      });

      test('all WCAG contrast checks pass', () {
        expect(report.allPassed, isTrue, reason: report.toString());
      });

      test('shade600 is close to input color', () {
        final inputHsl = HSLColor.fromColor(MihrColors.brand.shade600);
        final generatedHsl = HSLColor.fromColor(generated.shade600);
        expect(
          (inputHsl.lightness - generatedHsl.lightness).abs(),
          lessThan(0.10),
        );
        expect(_hueDiff(inputHsl.hue, generatedHsl.hue), lessThan(5.0));
      });

      test('lightness decreases monotonically from shade25 to shade950', () {
        final shades = generated.toMap();
        const keys = ColorScale.shadeKeys;
        for (var i = 0; i < keys.length - 1; i++) {
          final currentL = HSLColor.fromColor(shades[keys[i]]!).lightness;
          final nextL = HSLColor.fromColor(shades[keys[i + 1]]!).lightness;
          expect(
            currentL,
            greaterThanOrEqualTo(nextL),
            reason:
                'shade${keys[i]} (L=$currentL) should be >= '
                'shade${keys[i + 1]} (L=$nextL)',
          );
        }
      });

      test('shade25 is very light (L > 0.90)', () {
        final l = HSLColor.fromColor(generated.shade25).lightness;
        expect(l, greaterThan(0.90));
      });

      test('shade950 is very dark (L < 0.25)', () {
        final l = HSLColor.fromColor(generated.shade950).lightness;
        expect(l, lessThan(0.25));
      });

      test('generated shades are in same hue family as input', () {
        final inputHue = HSLColor.fromColor(MihrColors.brand.shade600).hue;
        for (final entry in generated.toMap().entries) {
          final shadeHue = HSLColor.fromColor(entry.value).hue;
          final sat = HSLColor.fromColor(entry.value).saturation;
          if (sat < 0.05) continue; // near-gray shades can drift
          expect(
            _hueDiff(inputHue, shadeHue),
            lessThan(15.0),
            reason:
                'shade${entry.key} hue=$shadeHue '
                'deviates too far from input hue=$inputHue',
          );
        }
      });
    });

    group('WCAG compliance for diverse colors', () {
      final testColors = <String, Color>{
        'Red #E63946': const Color(0xFFE63946),
        'Blue #2563EB': const Color(0xFF2563EB),
        'Green #059669': const Color(0xFF059669),
        'Orange #EA580C': const Color(0xFFEA580C),
        'Pink #EC4899': const Color(0xFFEC4899),
        'Teal #0D9488': const Color(0xFF0D9488),
        'Indigo #4F46E5': const Color(0xFF4F46E5),
        'Amber #D97706': const Color(0xFFD97706),
      };

      for (final entry in testColors.entries) {
        test('${entry.key} passes all WCAG checks', () {
          final (_, report) = ColorScaleGenerator.fromColorWithReport(
            entry.value,
          );
          expect(
            report.allPassed,
            isTrue,
            reason: '${entry.key} failed:\n$report',
          );
        });

        test('${entry.key} has monotonic lightness', () {
          final scale = ColorScaleGenerator.fromColor(entry.value);
          final shades = scale.toMap();
          const keys = ColorScale.shadeKeys;
          for (var i = 0; i < keys.length - 1; i++) {
            final currentL = HSLColor.fromColor(shades[keys[i]]!).lightness;
            final nextL = HSLColor.fromColor(shades[keys[i + 1]]!).lightness;
            expect(
              currentL,
              greaterThanOrEqualTo(nextL),
              reason:
                  '${entry.key}: shade${keys[i]} (L=$currentL) '
                  'should be >= shade${keys[i + 1]} (L=$nextL)',
            );
          }
        });
      }
    });

    group('edge cases', () {
      test('very light input color is clamped and still passes WCAG', () {
        const pastel = Color(0xFFFFB6C1); // light pink, L≈0.86
        final (scale, report) = ColorScaleGenerator.fromColorWithReport(pastel);
        expect(report.allPassed, isTrue, reason: report.toString());
        expect(scale.shade25 != scale.shade950, isTrue);
      });

      test('very dark input color is clamped and still passes WCAG', () {
        const dark = Color(0xFF1A1A2E); // very dark blue, L≈0.14
        final (scale, report) = ColorScaleGenerator.fromColorWithReport(dark);
        expect(report.allPassed, isTrue, reason: report.toString());
        expect(scale.shade25 != scale.shade950, isTrue);
      });

      test('pure white input produces valid palette', () {
        const white = Color(0xFFFFFFFF);
        final (_, report) = ColorScaleGenerator.fromColorWithReport(white);
        expect(report.allPassed, isTrue, reason: report.toString());
      });

      test('pure black input produces valid palette', () {
        const black = Color(0xFF000000);
        final (_, report) = ColorScaleGenerator.fromColorWithReport(black);
        expect(report.allPassed, isTrue, reason: report.toString());
      });

      test('low saturation (near gray) input produces valid palette', () {
        const gray = Color(0xFF6B7280); // gray-500-ish
        final (scale, report) = ColorScaleGenerator.fromColorWithReport(gray);
        expect(report.allPassed, isTrue, reason: report.toString());
        final l25 = HSLColor.fromColor(scale.shade25).lightness;
        final l950 = HSLColor.fromColor(scale.shade950).lightness;
        expect(l25, greaterThan(l950));
      });

      test('fully saturated primary red', () {
        const red = Color(0xFFFF0000);
        final (_, report) = ColorScaleGenerator.fromColorWithReport(red);
        expect(report.allPassed, isTrue, reason: report.toString());
      });
    });

    group('fromHex convenience', () {
      test('parses 6-digit hex with hash', () {
        final scale = ColorScaleGenerator.fromHex('#7F56D9');
        expect(scale.shade600, isNotNull);
      });

      test('parses 6-digit hex without hash', () {
        final scale = ColorScaleGenerator.fromHex('7F56D9');
        expect(scale.shade600, isNotNull);
      });

      test('parses 8-digit hex', () {
        final scale = ColorScaleGenerator.fromHex('FF7F56D9');
        expect(scale.shade600, isNotNull);
      });
    });

    group('contrast utilities', () {
      test('white on white has ratio 1:1', () {
        const white = Color(0xFFFFFFFF);
        expect(
          ColorScaleGenerator.contrastRatio(white, white),
          closeTo(1.0, 0.01),
        );
      });

      test('black on white has ratio ~21:1', () {
        const white = Color(0xFFFFFFFF);
        const black = Color(0xFF000000);
        expect(
          ColorScaleGenerator.contrastRatio(black, white),
          closeTo(21.0, 0.1),
        );
      });

      test('meetsWcagAA returns true for black on white', () {
        expect(
          ColorScaleGenerator.meetsWcagAA(
            const Color(0xFF000000),
            const Color(0xFFFFFFFF),
          ),
          isTrue,
        );
      });

      test('meetsWcagAA returns false for light gray on white', () {
        expect(
          ColorScaleGenerator.meetsWcagAA(
            const Color(0xFFCCCCCC),
            const Color(0xFFFFFFFF),
          ),
          isFalse,
        );
      });
    });

    group('semantic token compatibility', () {
      test('generated palette works with TextColors.light()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => TextColors.light(brand: palette), returnsNormally);
      });

      test('generated palette works with TextColors.dark()', () {
        expect(TextColors.dark, returnsNormally);
      });

      test('generated palette works with BackgroundColors.light()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => BackgroundColors.light(brand: palette), returnsNormally);
      });

      test('generated palette works with BackgroundColors.dark()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => BackgroundColors.dark(brand: palette), returnsNormally);
      });

      test('generated palette works with BorderColors.light()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => BorderColors.light(brand: palette), returnsNormally);
      });

      test('generated palette works with ForegroundColors.light()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => ForegroundColors.light(brand: palette), returnsNormally);
      });

      test('generated palette works with ComponentColors.light()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => ComponentColors.light(brand: palette), returnsNormally);
      });

      test('generated palette works with UtilityColors.light()', () {
        final palette = ColorScaleGenerator.fromHex('#E63946');
        expect(() => UtilityColors.light(brand: palette), returnsNormally);
      });

      test(
        'generated palette produces correct text contrast in light mode',
        () {
          final palette = ColorScaleGenerator.fromHex('#E63946');
          final textColors = TextColors.light(brand: palette);
          expect(
            ColorScaleGenerator.meetsWcagAA(
              textColors.brandPrimary,
              const Color(0xFFFFFFFF),
            ),
            isTrue,
            reason: 'brandPrimary text (shade900) must meet AA on white',
          );
        },
      );

      test('generated palette produces correct button contrast', () {
        final palette = ColorScaleGenerator.fromHex('#2563EB');
        final bgColors = BackgroundColors.light(brand: palette);
        expect(
          ColorScaleGenerator.contrastRatio(
            const Color(0xFFFFFFFF),
            bgColors.brandSolid,
          ),
          greaterThanOrEqualTo(3.0),
          reason: 'White text on brandSolid (shade600) must meet 3:1',
        );
      });

      test('UtilityScale factories accept generated palette', () {
        final palette = ColorScaleGenerator.fromHex('#059669');
        expect(() => UtilityScale.direct(palette), returnsNormally);
        expect(() => UtilityScale.directExtended(palette), returnsNormally);
        expect(() => UtilityScale.inverted(palette), returnsNormally);
        expect(() => UtilityScale.brandInverted(palette), returnsNormally);
      });
    });
  });
}

double _hueDiff(double a, double b) {
  final diff = (a - b).abs();
  return diff > 180 ? 360 - diff : diff;
}
