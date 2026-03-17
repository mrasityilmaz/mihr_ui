import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_base.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart';
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

/// Inline text link button — no background, padding, or shadow.
///
/// Defaults to brand-colored foreground. Use [MihrLinkButton.gray]
/// and related constructors for the gray variant.
///
/// ```dart
/// MihrLinkButton(
///   onPressed: _learnMore,
///   child: const Text('Learn more'),
/// )
///
/// MihrLinkButton.gray(
///   onPressed: _viewAll,
///   child: const Text('View all'),
/// )
/// ```
class MihrLinkButton extends MihrButtonBase {
  /// Creates a medium brand-colored link button.
  const MihrLinkButton({
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
  })  : _size = MihrButtonSize.md,
        _isGray = false;

  /// Creates a small brand-colored link button.
  const MihrLinkButton.sm({
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
  })  : _size = MihrButtonSize.sm,
        _isGray = false;

  /// Creates a large brand-colored link button.
  const MihrLinkButton.lg({
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
  })  : _size = MihrButtonSize.lg,
        _isGray = false;

  /// Creates an extra-large brand-colored link button.
  const MihrLinkButton.xl({
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
  })  : _size = MihrButtonSize.xl,
        _isGray = false;

  /// Creates a medium gray link button.
  const MihrLinkButton.gray({
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
  })  : _size = MihrButtonSize.md,
        _isGray = true;

  /// Creates a small gray link button.
  const MihrLinkButton.graySm({
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
  })  : _size = MihrButtonSize.sm,
        _isGray = true;

  /// Creates a large gray link button.
  const MihrLinkButton.grayLg({
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
  })  : _size = MihrButtonSize.lg,
        _isGray = true;

  /// Creates an extra-large gray link button.
  const MihrLinkButton.grayXl({
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
  })  : _size = MihrButtonSize.xl,
        _isGray = true;

  final MihrButtonSize _size;
  final bool _isGray;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final theme = MihrButtonThemeData.of(context);
    final fg = context.fgColors;
    final linkSizes = theme?.linkSizes ?? MihrLinkButtonSizes();

    final hoverFg = _isGray ? fg.secondaryHover : fg.brandSecondaryHover;

    final base = MihrButtonDefaults.linkBaseStyle(
      sizeData: linkSizes.forSize(_size),
      hoverDecorationColor: hoverFg,
      shape: theme?.shape,
    );
    final colors = _isGray
        ? MihrButtonDefaults.linkGrayColors(fg: fg)
        : MihrButtonDefaults.linkBrandColors(fg: fg);

    return base.merge(colors);
  }

  @override
  MihrButtonShadows shadowsOf(BuildContext context) => MihrButtonShadows.flat;

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      MihrButtonThemeData.of(context)?.linkStyle;
}
