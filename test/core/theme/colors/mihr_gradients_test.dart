import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('GrayGradients', () {
    test('dark600to500 is a LinearGradient', () {
      expect(
        GrayGradients.dark600to500,
        isA<LinearGradient>(),
      );
    });

    test('dark800to600_45 is a LinearGradient', () {
      expect(
        GrayGradients.dark800to600_45,
        isA<LinearGradient>(),
      );
    });

    test('light50toWhite is a LinearGradient', () {
      expect(
        GrayGradients.light50toWhite,
        isA<LinearGradient>(),
      );
    });

    test('dark600to500 has two colors', () {
      expect(
        GrayGradients.dark600to500.colors.length,
        equals(2),
      );
    });

    test(
      'dark600to500 starts with gray.shade600',
      () {
        expect(
          GrayGradients.dark600to500.colors.first,
          equals(MihrColors.gray.shade600),
        );
      },
    );

    test(
      'dark600to500 ends with gray.shade500',
      () {
        expect(
          GrayGradients.dark600to500.colors.last,
          equals(MihrColors.gray.shade500),
        );
      },
    );

    test('fromScale does not throw', () {
      expect(
        () => GrayGradients.fromScale(MihrColors.gray),
        returnsNormally,
      );
    });

    test('fromScale returns a list of 14 gradients', () {
      final gradients =
          GrayGradients.fromScale(MihrColors.gray);
      expect(gradients.length, equals(14));
    });
  });

  group('BrandGradients', () {
    test('dark600to500 is a LinearGradient', () {
      expect(
        BrandGradients.dark600to500,
        isA<LinearGradient>(),
      );
    });

    test('dark900to700 is a LinearGradient', () {
      expect(
        BrandGradients.dark900to700,
        isA<LinearGradient>(),
      );
    });

    test('fromScale does not throw', () {
      expect(
        () => BrandGradients.fromScale(MihrColors.brand),
        returnsNormally,
      );
    });

    test('fromScale returns a list of 7 gradients', () {
      final gradients =
          BrandGradients.fromScale(MihrColors.brand);
      expect(gradients.length, equals(7));
    });

    test(
      'dark600to500 starts with brand.shade600',
      () {
        expect(
          BrandGradients.dark600to500.colors.first,
          equals(MihrColors.brand.shade600),
        );
      },
    );
  });

  group('DecoGradients', () {
    test('all list has exactly 91 entries', () {
      expect(DecoGradients.all.length, equals(91));
    });

    test('every entry is a LinearGradient', () {
      for (final gradient in DecoGradients.all) {
        expect(gradient, isA<LinearGradient>());
      }
    });

    test('every gradient has exactly 2 colors', () {
      for (final gradient in DecoGradients.all) {
        expect(gradient.colors.length, equals(2));
      }
    });

    test('g01 is a LinearGradient', () {
      expect(DecoGradients.g01, isA<LinearGradient>());
    });

    test('g91 is a LinearGradient', () {
      expect(DecoGradients.g91, isA<LinearGradient>());
    });

    test('g01 has correct start color', () {
      expect(
        DecoGradients.g01.colors.first,
        equals(const Color(0xFFA5C9E8)),
      );
    });

    test('g91 has correct end color', () {
      expect(
        DecoGradients.g91.colors.last,
        equals(const Color(0xFF6867EA)),
      );
    });
  });
}
