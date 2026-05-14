import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_base.dart';
import 'package:mihr_ui/components/buttons/mihr_button_defaults.dart';
import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart'
    show MihrButtonSize;
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/mihr_theme.dart';
import 'package:mihr_ui/mihr_ui.dart'
    show MihrPrimaryButton, MihrTertiaryButton, UtilityColors;

/// Soft brand-fill button — tinted brand bg with brand text.
///
/// Lower visual weight than [MihrPrimaryButton] (solid) but
/// stronger than [MihrTertiaryButton] (ghost). No border or
/// shadow — flat surface.
///
/// The bg tint auto-adapts when the brand palette changes
/// via [UtilityColors.brand].
///
/// ```dart
/// MihrSoftPrimaryButton(
///   onPressed: _save,
///   child: const Text('Save'),
/// )
/// ```
class MihrSoftPrimaryButton extends MihrButtonBase {
  /// Creates a soft-primary button with the given [size] (defaults to md).
  const MihrSoftPrimaryButton({
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

  /// Creates a small soft-primary button.
  const MihrSoftPrimaryButton.sm({
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

  /// Creates a large soft-primary button.
  const MihrSoftPrimaryButton.lg({
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

  /// Creates an extra-large soft-primary button.
  const MihrSoftPrimaryButton.xl({
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

  /// Creates an icon-only soft-primary button (square) with the given [size].
  const MihrSoftPrimaryButton.icon({
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

  /// Creates a small icon-only soft-primary button.
  const MihrSoftPrimaryButton.iconSm({
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

  /// Creates a large icon-only soft-primary button.
  const MihrSoftPrimaryButton.iconLg({
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

  /// Creates an extra-large icon-only soft-primary button.
  const MihrSoftPrimaryButton.iconXl({
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
    final colors = MihrButtonDefaults.softPrimaryColors(
      bg: context.bgColors,
      fg: context.fgColors,
      brandScale: context.utilityColors.brand,
    );

    return base.merge(colors);
  }

  @override
  MihrButtonShadows shadowsOf(BuildContext context) => MihrButtonShadows.flat;

  @override
  ButtonStyle? themeStyleOf(BuildContext context) =>
      MihrButtonThemeData.of(context)?.primaryStyle;
}
