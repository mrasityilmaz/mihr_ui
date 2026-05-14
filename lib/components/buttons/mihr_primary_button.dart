import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_base.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart'
    show MihrButtonSize;
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';

/// Solid brand-fill button — highest visual weight in the hierarchy.
///
/// ```dart
/// MihrPrimaryButton(
///   onPressed: _save,
///   child: const Text('Save'),
/// )
///
/// MihrPrimaryButton.sm(
///   onPressed: _save,
///   leadingIcon: const Icon(Icons.check),
///   child: const Text('Save'),
/// )
///
/// MihrPrimaryButton.icon(
///   onPressed: _add,
///   icon: const Icon(Icons.add),
/// )
/// ```
class MihrPrimaryButton extends MihrButtonBase {
  /// Creates a primary button with the given [size] (defaults to md).
  const MihrPrimaryButton({
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

  /// Creates a small primary button.
  const MihrPrimaryButton.sm({
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

  /// Creates a large primary button.
  const MihrPrimaryButton.lg({
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

  /// Creates an extra-large primary button.
  const MihrPrimaryButton.xl({
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

  /// Creates an icon-only primary button (square) with the given [size].
  const MihrPrimaryButton.icon({
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

  /// Creates a small icon-only primary button.
  const MihrPrimaryButton.iconSm({
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

  /// Creates a large icon-only primary button.
  const MihrPrimaryButton.iconLg({
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

  /// Creates an extra-large icon-only primary button.
  const MihrPrimaryButton.iconXl({
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
    final colors = MihrButtonDefaults.primaryColors(
      bg: context.bgColors,
      fg: context.fgColors,
    );

    return base.merge(colors);
  }

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      MihrButtonThemeData.of(context)?.primaryStyle;
}
