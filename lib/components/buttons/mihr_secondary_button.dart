import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_base.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart'
    show MihrButtonSize;
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

/// Outlined button with gray border — medium visual weight.
///
/// ```dart
/// MihrSecondaryButton(
///   onPressed: _cancel,
///   child: const Text('Cancel'),
/// )
/// ```
class MihrSecondaryButton extends MihrButtonBase {
  /// Creates a secondary button with the given [size] (defaults to md).
  const MihrSecondaryButton({
    required super.onPressed,
    required super.child,
    super.key,
    MihrButtonSize size = MihrButtonSize.md,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _size = size,
        _isSquare = false;

  /// Creates a small secondary button.
  const MihrSecondaryButton.sm({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _size = MihrButtonSize.sm,
        _isSquare = false;

  /// Creates a large secondary button.
  const MihrSecondaryButton.lg({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _size = MihrButtonSize.lg,
        _isSquare = false;

  /// Creates an extra-large secondary button.
  const MihrSecondaryButton.xl({
    required super.onPressed,
    required super.child,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.leadingIcon,
    super.trailingIcon,
    super.tooltip,
  })  : _size = MihrButtonSize.xl,
        _isSquare = false;

  /// Creates an icon-only secondary button (square) with the given [size].
  const MihrSecondaryButton.icon({
    required super.onPressed,
    required Widget icon,
    super.key,
    MihrButtonSize size = MihrButtonSize.md,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _size = size,
        _isSquare = true,
        super(child: icon);

  /// Creates a small icon-only secondary button.
  const MihrSecondaryButton.iconSm({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _size = MihrButtonSize.sm,
        _isSquare = true,
        super(child: icon);

  /// Creates a large icon-only secondary button.
  const MihrSecondaryButton.iconLg({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
    super.focusNode,
    super.autofocus,
    super.statesController,
    super.tooltip,
  })  : _size = MihrButtonSize.lg,
        _isSquare = true,
        super(child: icon);

  /// Creates an extra-large icon-only secondary button.
  const MihrSecondaryButton.iconXl({
    required super.onPressed,
    required Widget icon,
    super.key,
    super.onLongPress,
    super.onHover,
    super.onFocusChange,
    super.style,
    super.styleBuilder,
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

    final base = MihrButtonDefaults.baseStyle(
      size: _size,
      shape: theme?.shape,
      isSquare: _isSquare,
    );
    final colors = MihrButtonDefaults.secondaryColors(
      bg: context.bgColors,
      fg: context.fgColors,
      border: context.borderColors,
    );

    return base.merge(colors);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      MihrButtonThemeData.of(context)?.secondaryStyle;
}
