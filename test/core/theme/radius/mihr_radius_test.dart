import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('MihrRadius raw values', () {
    test('none equals 0', () {
      expect(MihrRadius.none, equals(0));
    });

    test('xxs equals 2', () {
      expect(MihrRadius.xxs, equals(2));
    });

    test('xs equals 4', () {
      expect(MihrRadius.xs, equals(4));
    });

    test('sm equals 6', () {
      expect(MihrRadius.sm, equals(6));
    });

    test('md equals 8', () {
      expect(MihrRadius.md, equals(8));
    });

    test('lg equals 10', () {
      expect(MihrRadius.lg, equals(10));
    });

    test('xl equals 12', () {
      expect(MihrRadius.xl, equals(12));
    });

    test('xxl equals 16', () {
      expect(MihrRadius.xxl, equals(16));
    });

    test('xxxl equals 20', () {
      expect(MihrRadius.xxxl, equals(20));
    });

    test('xxxxl equals 24', () {
      expect(MihrRadius.xxxxl, equals(24));
    });

    test('full equals 9999', () {
      expect(MihrRadius.full, equals(9999));
    });
  });

  group('MihrRadius BorderRadius constants', () {
    test('borderNone is BorderRadius.zero', () {
      expect(
        MihrRadius.borderNone,
        equals(BorderRadius.zero),
      );
    });

    test('borderMd produces BorderRadius.circular(8)', () {
      expect(
        MihrRadius.borderMd,
        equals(
          const BorderRadius.all(Radius.circular(8)),
        ),
      );
    });

    test(
      'borderFull produces BorderRadius.circular(9999)',
      () {
        expect(
          MihrRadius.borderFull,
          equals(
            const BorderRadius.all(Radius.circular(9999)),
          ),
        );
      },
    );

    test('borderXs produces BorderRadius.circular(4)', () {
      expect(
        MihrRadius.borderXs,
        equals(
          const BorderRadius.all(Radius.circular(4)),
        ),
      );
    });

    test('borderXl produces BorderRadius.circular(12)', () {
      expect(
        MihrRadius.borderXl,
        equals(
          const BorderRadius.all(Radius.circular(12)),
        ),
      );
    });

    test('borderXxl produces BorderRadius.circular(16)', () {
      expect(
        MihrRadius.borderXxl,
        equals(
          const BorderRadius.all(Radius.circular(16)),
        ),
      );
    });

    test('borderXxxl produces BorderRadius.circular(20)',
        () {
      expect(
        MihrRadius.borderXxxl,
        equals(
          const BorderRadius.all(Radius.circular(20)),
        ),
      );
    });

    test('borderXxxxl produces BorderRadius.circular(24)',
        () {
      expect(
        MihrRadius.borderXxxxl,
        equals(
          const BorderRadius.all(Radius.circular(24)),
        ),
      );
    });
  });

  group('MihrRadius top-only variants', () {
    test('topXxl has top-only 16px radius', () {
      expect(
        MihrRadius.topXxl,
        equals(
          const BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
      );
    });

    test('topXxxl has top-only 20px radius', () {
      expect(
        MihrRadius.topXxxl,
        equals(
          const BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      );
    });

    test('topXxxxl has top-only 24px radius', () {
      expect(
        MihrRadius.topXxxxl,
        equals(
          const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
      );
    });
  });
}
