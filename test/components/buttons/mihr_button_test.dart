import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mihr_ui/components/buttons/buttons.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

Widget _wrap(Widget child, {Brightness brightness = Brightness.light}) {
  final theme =
      brightness == Brightness.light ? MihrTheme.light() : MihrTheme.dark();
  return MaterialApp(
    theme: theme,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  // -----------------------------------------------------------------------
  // MihrPrimaryButton
  // -----------------------------------------------------------------------

  group('MihrPrimaryButton', () {
    testWidgets('renders text label', (tester) async {
      await tester.pumpWidget(
        _wrap(MihrPrimaryButton(onPressed: () {}, child: const Text('Save'))),
      );
      await tester.pumpAndSettle();

      expect(find.text('Save'), findsOneWidget);
      expect(find.byType(MihrPrimaryButton), findsOneWidget);
    });

    testWidgets('disabled when onPressed is null', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const MihrPrimaryButton(onPressed: null, child: Text('Disabled')),
        ),
      );
      await tester.pumpAndSettle();

      final flags =
          tester.getSemantics(find.byType(MihrPrimaryButton)).flagsCollection;
      expect(flags.isButton, isTrue);
      expect(flags.isEnabled, isNot(equals(Tristate.none)));
      expect(flags.isEnabled, equals(Tristate.isFalse));
    });

    testWidgets('.sm factory uses correct height', (tester) async {
      await tester.pumpWidget(
        _wrap(MihrPrimaryButton.sm(onPressed: () {}, child: const Text('Sm'))),
      );
      await tester.pumpAndSettle();

      final box = tester.getSize(find.byType(MihrPrimaryButton));
      expect(box.height, greaterThanOrEqualTo(36));
    });

    testWidgets('.lg factory uses correct height', (tester) async {
      await tester.pumpWidget(
        _wrap(MihrPrimaryButton.lg(onPressed: () {}, child: const Text('Lg'))),
      );
      await tester.pumpAndSettle();

      final box = tester.getSize(find.byType(MihrPrimaryButton));
      expect(box.height, greaterThanOrEqualTo(44));
    });

    testWidgets('.xl factory uses correct height', (tester) async {
      await tester.pumpWidget(
        _wrap(MihrPrimaryButton.xl(onPressed: () {}, child: const Text('Xl'))),
      );
      await tester.pumpAndSettle();

      final box = tester.getSize(find.byType(MihrPrimaryButton));
      expect(box.height, greaterThanOrEqualTo(48));
    });

    testWidgets('.icon creates square button', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton.icon(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
      );
      await tester.pumpAndSettle();

      final size = tester.getSize(find.byType(MihrPrimaryButton));
      expect(size.width, size.height);
    });

    testWidgets('.iconSm creates 36x36 square', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton.iconSm(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final size = tester.getSize(find.byType(MihrPrimaryButton));
      expect(size.width, 36);
      expect(size.height, 36);
    });

    testWidgets('has non-transparent background', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton(onPressed: () {}, child: const Text('Primary')),
        ),
      );
      await tester.pumpAndSettle();

      final container = tester.widget<MihrButtonContainer>(
        find.descendant(
          of: find.byType(MihrPrimaryButton),
          matching: find.byType(MihrButtonContainer),
        ),
      );
      expect(container.color, isNot(Colors.transparent));
    });

    testWidgets('leadingIcon renders in Row', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton(
            onPressed: () {},
            leadingIcon: const Icon(Icons.check),
            child: const Text('Save'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.check), findsOneWidget);
      expect(find.text('Save'), findsOneWidget);
    });

    testWidgets('dark mode renders without errors', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton(onPressed: () {}, child: const Text('Dark')),
          brightness: Brightness.dark,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dark'), findsOneWidget);
    });

    testWidgets('respects per-type theme override', (tester) async {
      final baseTheme = MihrTheme.light();
      final customTheme = baseTheme.copyWith(
        extensions: [
          ...baseTheme.extensions.values,
          const MihrButtonThemeData(
            primaryStyle: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Color(0xFFE91E63)),
            ),
          ),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          theme: customTheme,
          home: Scaffold(
            body: Center(
              child: MihrPrimaryButton(
                onPressed: () {},
                child: const Text('Themed'),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final container = tester.widget<MihrButtonContainer>(
        find.descendant(
          of: find.byType(MihrPrimaryButton),
          matching: find.byType(MihrButtonContainer),
        ),
      );
      expect(container.color, const Color(0xFFE91E63));
    });
  });

  // -----------------------------------------------------------------------
  // MihrSecondaryButton
  // -----------------------------------------------------------------------

  group('MihrSecondaryButton', () {
    testWidgets('renders and has border', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrSecondaryButton(onPressed: () {}, child: const Text('Cancel')),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Cancel'), findsOneWidget);

      final container = tester.widget<MihrButtonContainer>(
        find.descendant(
          of: find.byType(MihrSecondaryButton),
          matching: find.byType(MihrButtonContainer),
        ),
      );
      expect(container.side, isNot(BorderSide.none));
    });

    testWidgets('.icon creates square button', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrSecondaryButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final size = tester.getSize(find.byType(MihrSecondaryButton));
      expect(size.width, size.height);
    });

    testWidgets('dark mode renders without errors', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrSecondaryButton(onPressed: () {}, child: const Text('Dark')),
          brightness: Brightness.dark,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dark'), findsOneWidget);
    });
  });

  // -----------------------------------------------------------------------
  // MihrTertiaryButton
  // -----------------------------------------------------------------------

  group('MihrTertiaryButton', () {
    testWidgets('default bg is transparent', (tester) async {
      await tester.pumpWidget(
        _wrap(MihrTertiaryButton(onPressed: () {}, child: const Text('More'))),
      );
      await tester.pumpAndSettle();

      final container = tester.widget<MihrButtonContainer>(
        find.descendant(
          of: find.byType(MihrTertiaryButton),
          matching: find.byType(MihrButtonContainer),
        ),
      );
      expect(container.color, Colors.transparent);
    });

    testWidgets('.iconLg creates 44x44 square', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrTertiaryButton.iconLg(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final size = tester.getSize(find.byType(MihrTertiaryButton));
      expect(size.width, 44);
      expect(size.height, 44);
    });
  });

  // -----------------------------------------------------------------------
  // MihrLinkButton
  // -----------------------------------------------------------------------

  group('MihrLinkButton', () {
    testWidgets('brand variant renders', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrLinkButton(onPressed: () {}, child: const Text('Learn more')),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Learn more'), findsOneWidget);

      final container = tester.widget<MihrButtonContainer>(
        find.descendant(
          of: find.byType(MihrLinkButton),
          matching: find.byType(MihrButtonContainer),
        ),
      );
      expect(container.color, Colors.transparent);
    });

    testWidgets('.gray variant renders', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrLinkButton.gray(onPressed: () {}, child: const Text('View all')),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('View all'), findsOneWidget);
    });

    testWidgets('.graySm variant renders', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrLinkButton.graySm(onPressed: () {}, child: const Text('View')),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('View'), findsOneWidget);
    });

    testWidgets('dark mode gray link renders', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrLinkButton.gray(onPressed: () {}, child: const Text('Dark Link')),
          brightness: Brightness.dark,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dark Link'), findsOneWidget);
    });
  });

  // -----------------------------------------------------------------------
  // MihrDestructiveButton
  // -----------------------------------------------------------------------

  group('MihrDestructiveButton', () {
    testWidgets('renders with non-transparent bg', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrDestructiveButton(onPressed: () {}, child: const Text('Delete')),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Delete'), findsOneWidget);

      final container = tester.widget<MihrButtonContainer>(
        find.descendant(
          of: find.byType(MihrDestructiveButton),
          matching: find.byType(MihrButtonContainer),
        ),
      );
      expect(container.color, isNot(Colors.transparent));
    });

    testWidgets('.icon creates square button', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrDestructiveButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ),
      );
      await tester.pumpAndSettle();

      final size = tester.getSize(find.byType(MihrDestructiveButton));
      expect(size.width, size.height);
    });

    testWidgets('disabled shows disabled bg', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const MihrDestructiveButton(onPressed: null, child: Text('Disabled')),
        ),
      );
      await tester.pumpAndSettle();

      final flags = tester
          .getSemantics(find.byType(MihrDestructiveButton))
          .flagsCollection;
      expect(flags.isEnabled, isNot(equals(Tristate.none)));
      expect(flags.isEnabled, equals(Tristate.isFalse));
    });

    testWidgets('dark mode renders without errors', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrDestructiveButton(
            onPressed: () {},
            child: const Text('Dark Delete'),
          ),
          brightness: Brightness.dark,
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Dark Delete'), findsOneWidget);
    });
  });

  // -----------------------------------------------------------------------
  // Cross-cutting
  // -----------------------------------------------------------------------

  group('Cross-cutting', () {
    testWidgets('tooltip wraps button', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton(
            onPressed: () {},
            tooltip: 'Save document',
            child: const Text('Save'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(Tooltip), findsOneWidget);
    });

    testWidgets('trailingIcon renders', (tester) async {
      await tester.pumpWidget(
        _wrap(
          MihrSecondaryButton(
            onPressed: () {},
            trailingIcon: const Icon(Icons.arrow_forward),
            child: const Text('Next'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byIcon(Icons.arrow_forward), findsOneWidget);
    });

    testWidgets('onPressed fires callback', (tester) async {
      var fired = false;
      await tester.pumpWidget(
        _wrap(
          MihrPrimaryButton(
            onPressed: () => fired = true,
            child: const Text('Tap'),
          ),
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Tap'));
      expect(fired, isTrue);
    });

    testWidgets('disabled button does not fire', (tester) async {
      const fired = false;
      await tester.pumpWidget(
        _wrap(const MihrPrimaryButton(onPressed: null, child: Text('No tap'))),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('No tap'));
      expect(fired, isFalse);
    });
  });
}
