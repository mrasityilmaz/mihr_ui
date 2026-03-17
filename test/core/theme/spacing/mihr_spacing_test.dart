import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('MihrSpacing semantic token values', () {
    test('none equals 0', () {
      expect(MihrSpacing.none, equals(0));
    });

    test('xxs equals 2', () {
      expect(MihrSpacing.xxs, equals(2));
    });

    test('xs equals 4', () {
      expect(MihrSpacing.xs, equals(4));
    });

    test('sm equals 6', () {
      expect(MihrSpacing.sm, equals(6));
    });

    test('md equals 8', () {
      expect(MihrSpacing.md, equals(8));
    });

    test('lg equals 12', () {
      expect(MihrSpacing.lg, equals(12));
    });

    test('xl equals 16', () {
      expect(MihrSpacing.xl, equals(16));
    });

    test('x2l equals 20', () {
      expect(MihrSpacing.x2l, equals(20));
    });

    test('x3l equals 24', () {
      expect(MihrSpacing.x3l, equals(24));
    });

    test('x4l equals 32', () {
      expect(MihrSpacing.x4l, equals(32));
    });

    test('x5l equals 40', () {
      expect(MihrSpacing.x5l, equals(40));
    });

    test('x6l equals 48', () {
      expect(MihrSpacing.x6l, equals(48));
    });
  });

  group('MihrSpacing EdgeInsets all-sides helpers', () {
    test('insetsNone is EdgeInsets.zero', () {
      expect(MihrSpacing.insetsNone, equals(EdgeInsets.zero));
    });

    test('insetsXl equals EdgeInsets.all(16)', () {
      expect(MihrSpacing.insetsXl, equals(const EdgeInsets.all(16)));
    });

    test('insetsX3l equals EdgeInsets.all(24)', () {
      expect(MihrSpacing.insetsX3l, equals(const EdgeInsets.all(24)));
    });

    test('insetsMd equals EdgeInsets.all(8)', () {
      expect(MihrSpacing.insetsMd, equals(const EdgeInsets.all(8)));
    });
  });

  group('MihrSpacing EdgeInsets horizontal helpers', () {
    test('insetsHXl equals '
        'EdgeInsets.symmetric(horizontal: 16)', () {
      expect(
        MihrSpacing.insetsHXl,
        equals(const EdgeInsets.symmetric(horizontal: 16)),
      );
    });

    test('insetsHMd equals '
        'EdgeInsets.symmetric(horizontal: 8)', () {
      expect(
        MihrSpacing.insetsHMd,
        equals(const EdgeInsets.symmetric(horizontal: 8)),
      );
    });

    test('insetsHX3l equals '
        'EdgeInsets.symmetric(horizontal: 24)', () {
      expect(
        MihrSpacing.insetsHX3l,
        equals(const EdgeInsets.symmetric(horizontal: 24)),
      );
    });
  });

  group('MihrSpacing EdgeInsets vertical helpers', () {
    test('insetsVXl equals '
        'EdgeInsets.symmetric(vertical: 16)', () {
      expect(
        MihrSpacing.insetsVXl,
        equals(const EdgeInsets.symmetric(vertical: 16)),
      );
    });

    test('insetsVX3l equals '
        'EdgeInsets.symmetric(vertical: 24)', () {
      expect(
        MihrSpacing.insetsVX3l,
        equals(const EdgeInsets.symmetric(vertical: 24)),
      );
    });
  });

  group('MihrSpacing vertical gap helpers', () {
    test('gapVLg is SizedBox with height 12', () {
      const gap = MihrSpacing.gapVLg;
      expect(gap, isA<SizedBox>());
      expect(gap.height, equals(12));
    });

    test('gapVXl is SizedBox with height 16', () {
      const gap = MihrSpacing.gapVXl;
      expect(gap, isA<SizedBox>());
      expect(gap.height, equals(16));
    });

    test('gapVMd is SizedBox with height 8', () {
      const gap = MihrSpacing.gapVMd;
      expect(gap, isA<SizedBox>());
      expect(gap.height, equals(8));
    });

    test('gapVX3l is SizedBox with height 24', () {
      const gap = MihrSpacing.gapVX3l;
      expect(gap, isA<SizedBox>());
      expect(gap.height, equals(24));
    });
  });

  group('MihrSpacing horizontal gap helpers', () {
    test('gapHMd is SizedBox with width 8', () {
      const gap = MihrSpacing.gapHMd;
      expect(gap, isA<SizedBox>());
      expect(gap.width, equals(8));
    });

    test('gapHXl is SizedBox with width 16', () {
      const gap = MihrSpacing.gapHXl;
      expect(gap, isA<SizedBox>());
      expect(gap.width, equals(16));
    });

    test('gapHLg is SizedBox with width 12', () {
      const gap = MihrSpacing.gapHLg;
      expect(gap, isA<SizedBox>());
      expect(gap.width, equals(12));
    });
  });

  group('MihrSpacing primitives spot check', () {
    test('p0 equals 0', () {
      expect(MihrSpacing.p0, equals(0));
    });

    test('p4 equals 16', () {
      expect(MihrSpacing.p4, equals(16));
    });

    test('p48 equals 192', () {
      expect(MihrSpacing.p48, equals(192));
    });

    test('p320 equals 1280', () {
      expect(MihrSpacing.p320, equals(1280));
    });
  });
}
