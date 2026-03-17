import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_base.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart';
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

enum _Hierarchy { primary, softPrimary, secondary, tertiary, link }

/// Destructive button — for dangerous / irreversible actions.
///
/// Supports five hierarchy levels:
///
/// | Hierarchy | Constructor | Look |
/// |-----------|-----------|------|
/// | Primary | `MihrDestructiveButton()` | Solid red bg |
/// | Soft Primary | `.softPrimary()` | Tinted red bg, red text |
/// | Secondary | `.secondary()` | Red border, transparent bg |
/// | Tertiary | `.tertiary()` | Ghost, red text |
/// | Link | `.link()` | Text-only, red |
class MihrDestructiveButton extends MihrButtonBase {
  // -- PRIMARY --

  /// Creates a medium destructive primary button.
  const MihrDestructiveButton({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.md,
        _isSquare = false;

  /// Creates a small destructive primary button.
  const MihrDestructiveButton.sm({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.sm,
        _isSquare = false;

  /// Creates a large destructive primary button.
  const MihrDestructiveButton.lg({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.lg,
        _isSquare = false;

  /// Creates an extra-large destructive primary button.
  const MihrDestructiveButton.xl({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.xl,
        _isSquare = false;

  /// Creates an icon-only destructive primary button (medium, square).
  const MihrDestructiveButton.icon({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.md,
        _isSquare = true,
        super(child: icon);

  /// Creates a small icon-only destructive primary button.
  const MihrDestructiveButton.iconSm({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.sm,
        _isSquare = true,
        super(child: icon);

  /// Creates a large icon-only destructive primary button.
  const MihrDestructiveButton.iconLg({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.lg,
        _isSquare = true,
        super(child: icon);

  /// Creates an extra-large icon-only destructive primary button.
  const MihrDestructiveButton.iconXl({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.primary,
        _size = MihrButtonSize.xl,
        _isSquare = true,
        super(child: icon);

  // -- SOFT PRIMARY --

  /// Creates a medium destructive soft-primary button.
  const MihrDestructiveButton.softPrimary({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.md,
        _isSquare = false;

  /// Creates a small destructive soft-primary button.
  const MihrDestructiveButton.softPrimarySm({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.sm,
        _isSquare = false;

  /// Creates a large destructive soft-primary button.
  const MihrDestructiveButton.softPrimaryLg({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.lg,
        _isSquare = false;

  /// Creates an extra-large destructive soft-primary button.
  const MihrDestructiveButton.softPrimaryXl({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.xl,
        _isSquare = false;

  /// Creates an icon-only destructive soft-primary button (medium, square).
  const MihrDestructiveButton.softPrimaryIcon({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.md,
        _isSquare = true,
        super(child: icon);

  /// Creates a small icon-only destructive soft-primary button.
  const MihrDestructiveButton.softPrimaryIconSm({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.sm,
        _isSquare = true,
        super(child: icon);

  /// Creates a large icon-only destructive soft-primary button.
  const MihrDestructiveButton.softPrimaryIconLg({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.lg,
        _isSquare = true,
        super(child: icon);

  /// Creates an extra-large icon-only destructive soft-primary button.
  const MihrDestructiveButton.softPrimaryIconXl({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.softPrimary,
        _size = MihrButtonSize.xl,
        _isSquare = true,
        super(child: icon);

  // -- SECONDARY --

  /// Creates a medium destructive secondary button.
  const MihrDestructiveButton.secondary({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.md,
        _isSquare = false;

  /// Creates a small destructive secondary button.
  const MihrDestructiveButton.secondarySm({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.sm,
        _isSquare = false;

  /// Creates a large destructive secondary button.
  const MihrDestructiveButton.secondaryLg({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.lg,
        _isSquare = false;

  /// Creates an extra-large destructive secondary button.
  const MihrDestructiveButton.secondaryXl({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.xl,
        _isSquare = false;

  /// Creates an icon-only destructive secondary button (medium, square).
  const MihrDestructiveButton.secondaryIcon({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.md,
        _isSquare = true,
        super(child: icon);

  /// Creates a small icon-only destructive secondary button.
  const MihrDestructiveButton.secondaryIconSm({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.sm,
        _isSquare = true,
        super(child: icon);

  /// Creates a large icon-only destructive secondary button.
  const MihrDestructiveButton.secondaryIconLg({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.lg,
        _isSquare = true,
        super(child: icon);

  /// Creates an extra-large icon-only destructive secondary button.
  const MihrDestructiveButton.secondaryIconXl({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.secondary,
        _size = MihrButtonSize.xl,
        _isSquare = true,
        super(child: icon);

  // -- TERTIARY --

  /// Creates a medium destructive tertiary (ghost) button.
  const MihrDestructiveButton.tertiary({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.md,
        _isSquare = false;

  /// Creates a small destructive tertiary button.
  const MihrDestructiveButton.tertiarySm({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.sm,
        _isSquare = false;

  /// Creates a large destructive tertiary button.
  const MihrDestructiveButton.tertiaryLg({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.lg,
        _isSquare = false;

  /// Creates an extra-large destructive tertiary button.
  const MihrDestructiveButton.tertiaryXl({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.xl,
        _isSquare = false;

  /// Creates an icon-only destructive tertiary button (medium, square).
  const MihrDestructiveButton.tertiaryIcon({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.md,
        _isSquare = true,
        super(child: icon);

  /// Creates a small icon-only destructive tertiary button.
  const MihrDestructiveButton.tertiaryIconSm({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.sm,
        _isSquare = true,
        super(child: icon);

  /// Creates a large icon-only destructive tertiary button.
  const MihrDestructiveButton.tertiaryIconLg({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.lg,
        _isSquare = true,
        super(child: icon);

  /// Creates an extra-large icon-only destructive tertiary button.
  const MihrDestructiveButton.tertiaryIconXl({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.tertiary,
        _size = MihrButtonSize.xl,
        _isSquare = true,
        super(child: icon);

  // -- LINK --

  /// Creates a medium destructive link button.
  const MihrDestructiveButton.link({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.link,
        _size = MihrButtonSize.md,
        _isSquare = false;

  /// Creates a small destructive link button.
  const MihrDestructiveButton.linkSm({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.link,
        _size = MihrButtonSize.sm,
        _isSquare = false;

  /// Creates a large destructive link button.
  const MihrDestructiveButton.linkLg({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.link,
        _size = MihrButtonSize.lg,
        _isSquare = false;

  /// Creates an extra-large destructive link button.
  const MihrDestructiveButton.linkXl({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _hierarchy = _Hierarchy.link,
        _size = MihrButtonSize.xl,
        _isSquare = false;

  final _Hierarchy _hierarchy;
  final MihrButtonSize _size;
  final bool _isSquare;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final theme = MihrButtonThemeData.of(context);
    final bg = context.bgColors;
    final fg = context.fgColors;
    final border = context.borderColors;

    if (_hierarchy == _Hierarchy.link) {
      final linkSizes = theme?.linkSizes ?? MihrLinkButtonSizes();
      final base = MihrButtonDefaults.linkBaseStyle(
        sizeData: linkSizes.forSize(_size),
        hoverDecorationColor: fg.errorSecondary,
        shape: theme?.shape,
      );
      final colors = MihrButtonDefaults.destructiveLinkColors(fg: fg);
      return base.merge(colors);
    }

    final sizes = theme?.sizes ?? MihrButtonSizes();
    final base = MihrButtonDefaults.baseStyle(
      sizeData: sizes.forSize(_size),
      shape: theme?.shape,
      isSquare: _isSquare,
    );

    final colors = switch (_hierarchy) {
      _Hierarchy.primary => MihrButtonDefaults.destructivePrimaryColors(
          bg: bg,
          fg: fg,
        ),
      _Hierarchy.softPrimary => MihrButtonDefaults.destructiveSoftPrimaryColors(
          bg: bg,
          fg: fg,
          errorScale: context.utilityColors.error,
        ),
      _Hierarchy.secondary => MihrButtonDefaults.destructiveSecondaryColors(
          bg: bg,
          fg: fg,
          border: border,
        ),
      _Hierarchy.tertiary => MihrButtonDefaults.destructiveTertiaryColors(
          bg: bg,
          fg: fg,
        ),
      _Hierarchy.link => throw StateError('Unreachable'),
    };

    return base.merge(colors);
  }

  @override
  MihrButtonShadows shadowsOf(BuildContext context) {
    if (_hierarchy == _Hierarchy.softPrimary ||
        _hierarchy == _Hierarchy.tertiary ||
        _hierarchy == _Hierarchy.link) {
      return MihrButtonShadows.flat;
    }
    return super.shadowsOf(context);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      MihrButtonThemeData.of(context)?.destructiveStyle;
}
