import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_base.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart';
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

/// Ghost button — transparent background, no border or shadow.
///
/// ```dart
/// MihrTertiaryButton(
///   onPressed: _showMore,
///   child: const Text('Show more'),
/// )
/// ```
class MihrTertiaryButton extends MihrButtonBase {
  /// Creates a medium tertiary (ghost) button.
  const MihrTertiaryButton({
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
        _isSquare = false;

  /// Creates a small tertiary button.
  const MihrTertiaryButton.sm({
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
        _isSquare = false;

  /// Creates a large tertiary button.
  const MihrTertiaryButton.lg({
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
        _isSquare = false;

  /// Creates an extra-large tertiary button.
  const MihrTertiaryButton.xl({
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
        _isSquare = false;

  /// Creates an icon-only tertiary button (medium, square).
  const MihrTertiaryButton.icon({
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
  })  : _size = MihrButtonSize.md,
        _isSquare = true,
        super(child: icon);

  /// Creates a small icon-only tertiary button.
  const MihrTertiaryButton.iconSm({
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
  })  : _size = MihrButtonSize.sm,
        _isSquare = true,
        super(child: icon);

  /// Creates a large icon-only tertiary button.
  const MihrTertiaryButton.iconLg({
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
  })  : _size = MihrButtonSize.lg,
        _isSquare = true,
        super(child: icon);

  /// Creates an extra-large icon-only tertiary button.
  const MihrTertiaryButton.iconXl({
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
  })  : _size = MihrButtonSize.xl,
        _isSquare = true,
        super(child: icon);

  final MihrButtonSize _size;
  final bool _isSquare;

  @override
  ButtonStyle defaultStyleOf(BuildContext context) {
    final theme = MihrButtonThemeData.of(context);
    final sizes = theme?.sizes ?? MihrButtonSizes();

    final base = MihrButtonDefaults.baseStyle(
      sizeData: sizes.forSize(_size),
      shape: theme?.shape,
      isSquare: _isSquare,
    );
    final colors = MihrButtonDefaults.tertiaryColors(
      bg: context.bgColors,
      fg: context.fgColors,
    );

    return base.merge(colors);
  }

  @override
  MihrButtonShadows shadowsOf(BuildContext context) => MihrButtonShadows.flat;

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      MihrButtonThemeData.of(context)?.tertiaryStyle;
}
