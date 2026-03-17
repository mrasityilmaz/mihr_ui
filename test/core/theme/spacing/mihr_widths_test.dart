import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/mihr_ui.dart';

void main() {
  group('MihrWidths max-width tokens', () {
    test('xxs equals 320', () {
      expect(MihrWidths.xxs, equals(320));
    });

    test('xs equals 384', () {
      expect(MihrWidths.xs, equals(384));
    });

    test('sm equals 480', () {
      expect(MihrWidths.sm, equals(480));
    });

    test('md equals 560', () {
      expect(MihrWidths.md, equals(560));
    });

    test('lg equals 640', () {
      expect(MihrWidths.lg, equals(640));
    });

    test('xl equals 768', () {
      expect(MihrWidths.xl, equals(768));
    });

    test('x2l equals 1024', () {
      expect(MihrWidths.x2l, equals(1024));
    });

    test('x3l equals 1280', () {
      expect(MihrWidths.x3l, equals(1280));
    });

    test('x4l equals 1440', () {
      expect(MihrWidths.x4l, equals(1440));
    });

    test('x5l equals 1600', () {
      expect(MihrWidths.x5l, equals(1600));
    });

    test('x6l equals 1920', () {
      expect(MihrWidths.x6l, equals(1920));
    });
  });

  group('MihrWidths container tokens', () {
    test('containerPaddingMobile equals 16', () {
      expect(MihrWidths.containerPaddingMobile, equals(16));
    });

    test('containerPaddingDesktop equals 32', () {
      expect(MihrWidths.containerPaddingDesktop, equals(32));
    });

    test('containerMaxWidth equals 1280', () {
      expect(MihrWidths.containerMaxWidth, equals(1280));
    });

    test('paragraphMaxWidth equals 720', () {
      expect(MihrWidths.paragraphMaxWidth, equals(720));
    });
  });

  group('MihrWidths BoxConstraints helpers', () {
    test(
      'constraintsContainer has maxWidth 1280',
      () {
        expect(
          MihrWidths.constraintsContainer,
          equals(
            const BoxConstraints(maxWidth: 1280),
          ),
        );
      },
    );

    test(
      'constraintsParagraph has maxWidth 720',
      () {
        expect(
          MihrWidths.constraintsParagraph,
          equals(
            const BoxConstraints(maxWidth: 720),
          ),
        );
      },
    );

    test(
      'constraintsXxs has maxWidth 320',
      () {
        expect(
          MihrWidths.constraintsXxs,
          equals(
            const BoxConstraints(maxWidth: 320),
          ),
        );
      },
    );

    test(
      'constraintsSm has maxWidth 480',
      () {
        expect(
          MihrWidths.constraintsSm,
          equals(
            const BoxConstraints(maxWidth: 480),
          ),
        );
      },
    );

    test(
      'constraintsX3l has maxWidth 1280',
      () {
        expect(
          MihrWidths.constraintsX3l,
          equals(
            const BoxConstraints(maxWidth: 1280),
          ),
        );
      },
    );

    test(
      'constraintsContainer minWidth is 0',
      () {
        expect(
          MihrWidths.constraintsContainer.minWidth,
          equals(0),
        );
      },
    );
  });
}
