import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('MihrBackdropBlurs presets exist', () {
    test('sm preset exists', () {
      expect(MihrBackdropBlurs.sm, isA<BackdropBlurStyle>());
    });

    test('md preset exists', () {
      expect(MihrBackdropBlurs.md, isA<BackdropBlurStyle>());
    });

    test('lg preset exists', () {
      expect(MihrBackdropBlurs.lg, isA<BackdropBlurStyle>());
    });

    test('xl preset exists', () {
      expect(MihrBackdropBlurs.xl, isA<BackdropBlurStyle>());
    });

    test('all list contains 4 presets', () {
      expect(MihrBackdropBlurs.all.length, equals(4));
    });
  });

  group('MihrBackdropBlurs sigma values', () {
    test('sm has sigma 4', () {
      expect(MihrBackdropBlurs.sm.sigma, equals(4));
    });

    test('md has sigma 8', () {
      expect(MihrBackdropBlurs.md.sigma, equals(8));
    });

    test('lg has sigma 12', () {
      expect(MihrBackdropBlurs.lg.sigma, equals(12));
    });

    test('xl has sigma 20', () {
      expect(MihrBackdropBlurs.xl.sigma, equals(20));
    });
  });

  group('MihrBackdropBlurs blur pixels', () {
    test('sm has blurPx 8', () {
      expect(MihrBackdropBlurs.sm.blurPx, equals(8));
    });

    test('md has blurPx 16', () {
      expect(MihrBackdropBlurs.md.blurPx, equals(16));
    });

    test('lg has blurPx 24', () {
      expect(MihrBackdropBlurs.lg.blurPx, equals(24));
    });

    test('xl has blurPx 40', () {
      expect(MihrBackdropBlurs.xl.blurPx, equals(40));
    });
  });

  group('BackdropBlurStyle.imageFilter', () {
    test('sm imageFilter does not throw', () {
      expect(
        () => MihrBackdropBlurs.sm.imageFilter,
        returnsNormally,
      );
      expect(
        MihrBackdropBlurs.sm.imageFilter,
        isA<ImageFilter>(),
      );
    });

    test('md imageFilter does not throw', () {
      expect(
        () => MihrBackdropBlurs.md.imageFilter,
        returnsNormally,
      );
    });

    test('lg imageFilter does not throw', () {
      expect(
        () => MihrBackdropBlurs.lg.imageFilter,
        returnsNormally,
      );
    });

    test('xl imageFilter does not throw', () {
      expect(
        () => MihrBackdropBlurs.xl.imageFilter,
        returnsNormally,
      );
    });
  });

  group('BackdropBlurStyle.overlay()', () {
    test('returns light overlay for Brightness.light', () {
      final color =
          MihrBackdropBlurs.md.overlay(Brightness.light);
      expect(color, equals(MihrBackdropBlurs.md.lightOverlay));
    });

    test('returns dark overlay for Brightness.dark', () {
      final color =
          MihrBackdropBlurs.md.overlay(Brightness.dark);
      expect(color, equals(MihrBackdropBlurs.md.darkOverlay));
    });

    test('light overlay is white at 60% opacity', () {
      final overlay = MihrBackdropBlurs.sm.lightOverlay;
      expect(overlay, equals(const Color(0x99FFFFFF)));
    });

    test('dark overlay is black at 60% opacity', () {
      final overlay = MihrBackdropBlurs.sm.darkOverlay;
      expect(overlay, equals(const Color(0x99000000)));
    });
  });
}
