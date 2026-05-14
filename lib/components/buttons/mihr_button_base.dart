import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mihr_ui/components/buttons/mihr_button_container.dart';
import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';
import 'package:mihr_ui/components/buttons/mihr_button_theme.dart';
import 'package:mihr_ui/core/theme/spacing/mihr_spacing.dart';
import 'package:mihr_ui/core/theme/typography/mihr_typography.dart';

/// Exposes resolved button colors to descendant widgets.
///
/// Inserted automatically by [MihrButtonBase] above the button
/// content. Works alongside [IconTheme] (for [Icon] widgets) and
/// [DefaultTextStyle] (for [Text] widgets) to propagate colors to
/// any child type — including [CircularProgressIndicator],
/// `SvgPicture`, or custom painters.
///
/// ```dart
/// MihrPrimaryButton(
///   onPressed: _save,
///   child: Builder(builder: (context) {
///     final btn = MihrButtonData.of(context);
///     return SizedBox(
///       width: 20, height: 20,
///       child: CircularProgressIndicator(
///         strokeWidth: 2,
///         valueColor: AlwaysStoppedAnimation(btn.foregroundColor),
///       ),
///     );
///   }),
/// )
/// ```
class MihrButtonData extends InheritedWidget {
  /// Creates a button data scope.
  const MihrButtonData({
    required this.foregroundColor,
    required this.iconColor,
    required this.backgroundColor,
    required super.child,
    super.key,
  });

  /// Label / text color resolved for the current state.
  final Color foregroundColor;

  /// Icon color resolved for the current state.
  final Color iconColor;

  /// Background fill color resolved for the current state.
  final Color backgroundColor;

  /// Returns the nearest [MihrButtonData], or `null`.
  static MihrButtonData? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MihrButtonData>();

  /// Returns the nearest [MihrButtonData].
  static MihrButtonData of(BuildContext context) => maybeOf(context)!;

  @override
  bool updateShouldNotify(MihrButtonData oldWidget) =>
      foregroundColor != oldWidget.foregroundColor ||
      iconColor != oldWidget.iconColor ||
      backgroundColor != oldWidget.backgroundColor;
}

/// Abstract base for all Mihr button widgets.
///
/// Provides a shared rendering stack, style resolution, and state
/// management. Concrete subclasses supply visual defaults via
/// [defaultStyleOf] and theme overrides via [themeStyleOf].
///
/// ## Rendering stack
///
/// ```text
/// Tooltip? > Semantics > _InputPadding > ConstrainedBox >
///   MihrButtonContainer(bg, shape, shadows) > InkWell(states) >
///     Padding(H) > Center > MihrButtonData >
///       IconTheme + DefaultTextStyle > _ButtonContent
/// ```
///
/// ## Style resolution
///
/// ```text
/// widget.style / styleBuilder  >  themeStyleOf  >  defaultStyleOf
/// ```
abstract class MihrButtonBase extends StatefulWidget {
  /// Creates a Mihr button with the given callbacks and content.
  const MihrButtonBase({
    required this.onPressed,
    required this.child,
    super.key,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.styleBuilder,
    this.focusNode,
    this.autofocus = false,
    this.statesController,
    this.leadingIcon,
    this.trailingIcon,
    this.tooltip,
  }) : assert(
          style == null || styleBuilder == null,
          'Cannot set both style and styleBuilder on a Mihr button.',
        );

  /// Called when the button is tapped. Pass `null` to disable.
  final VoidCallback? onPressed;

  /// Called when the button is long-pressed.
  final VoidCallback? onLongPress;

  /// Called when the hover state changes.
  final ValueChanged<bool>? onHover;

  /// Called when the focus state changes.
  final ValueChanged<bool>? onFocusChange;

  /// Overrides the resolved [ButtonStyle] for this button instance.
  ///
  /// Mutually exclusive with [styleBuilder].
  final ButtonStyle? style;

  /// Receives the fully merged default+theme style and returns a
  /// modified copy.
  ///
  /// ```dart
  /// MihrPrimaryButton(
  ///   onPressed: () {},
  ///   styleBuilder: (resolved) => resolved.copyWith(
  ///     padding: const WidgetStatePropertyAll(EdgeInsets.all(24)),
  ///   ),
  ///   child: const Text('Wide'),
  /// )
  /// ```
  ///
  /// Mutually exclusive with [style].
  final ButtonStyle Function(ButtonStyle resolved)? styleBuilder;

  /// Controls keyboard focus.
  final FocusNode? focusNode;

  /// Whether the button should be focused on first build.
  final bool autofocus;

  /// Tracks interactive states (hover, focus, pressed, disabled).
  final WidgetStatesController? statesController;

  /// Icon placed before the label.
  final Widget? leadingIcon;

  /// Icon placed after the label.
  final Widget? trailingIcon;

  /// Optional tooltip displayed on long-press or hover.
  final String? tooltip;

  /// The button label, typically a [Text] widget.
  ///
  /// For icon-only (square) buttons this is the icon itself.
  final Widget child;

  /// Builds the default [ButtonStyle] for this button type and size.
  ButtonStyle defaultStyleOf(BuildContext context);

  /// Retrieves the theme-level [ButtonStyle] override, if registered.
  ButtonStyle? themeStyleOf(BuildContext context);

  /// Returns the shadow configuration for this button variant.
  ///
  /// Override in ghost/link variants to return
  /// [MihrButtonShadows.flat].
  MihrButtonShadows shadowsOf(BuildContext context) {
    final btnTheme = MihrButtonThemeData.of(context);
    return btnTheme?.shadows ?? MihrButtonShadows.standard;
  }

  @override
  State<MihrButtonBase> createState() => _MihrButtonBaseState();
}

class _MihrButtonBaseState extends State<MihrButtonBase> {
  WidgetStatesController? _internalController;

  WidgetStatesController get _controller =>
      widget.statesController ?? _internalController!;

  bool get _isDisabled =>
      widget.onPressed == null && widget.onLongPress == null;

  @override
  void initState() {
    super.initState();
    if (widget.statesController == null) {
      _internalController = WidgetStatesController();
    }
    _controller
      ..addListener(_handleStateChange)
      ..update(WidgetState.disabled, _isDisabled);
  }

  @override
  void didUpdateWidget(covariant MihrButtonBase oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.statesController != oldWidget.statesController) {
      oldWidget.statesController?.removeListener(_handleStateChange);
      if (oldWidget.statesController == null) {
        _internalController?.dispose();
        _internalController = null;
      }
      if (widget.statesController == null) {
        _internalController = WidgetStatesController();
      }
      _controller.addListener(_handleStateChange);
    }

    _controller.update(WidgetState.disabled, _isDisabled);
  }

  @override
  void dispose() {
    _controller.removeListener(_handleStateChange);
    _internalController?.dispose();
    super.dispose();
  }

  void _handleStateChange() {
    if (mounted) setState(() {});
  }

  T? _resolve<T>(
    WidgetStateProperty<T>? Function(ButtonStyle?) getter,
    Set<WidgetState> states,
    ButtonStyle? widgetStyle,
    ButtonStyle? themeStyle,
    ButtonStyle defaultStyle,
  ) {
    return (getter(widgetStyle) ?? getter(themeStyle) ?? getter(defaultStyle))
        ?.resolve(states);
  }

  @override
  Widget build(BuildContext context) {
    final states = _controller.value;

    final defaultStyle = widget.defaultStyleOf(context);
    final themeStyle = widget.themeStyleOf(context);

    // -- styleBuilder / style resolution --
    final ButtonStyle? widgetStyle;
    if (widget.styleBuilder != null) {
      final merged = defaultStyle.merge(themeStyle ?? const ButtonStyle());
      widgetStyle = widget.styleBuilder!(merged);
    } else {
      widgetStyle = widget.style;
    }

    T? rs<T>(WidgetStateProperty<T>? Function(ButtonStyle?) g) =>
        _resolve(g, states, widgetStyle, themeStyle, defaultStyle);

    final bgColor = rs((s) => s?.backgroundColor) ?? Colors.transparent;
    final fgColor = rs((s) => s?.foregroundColor) ?? Colors.black;
    final iconColor = rs((s) => s?.iconColor) ?? fgColor;
    final side = rs((s) => s?.side) ?? BorderSide.none;
    final padding = rs((s) => s?.padding) ?? EdgeInsets.zero;
    final resolvedTextStyle = rs((s) => s?.textStyle);
    final typoTheme = MihrTypography.maybeOf(context);
    final textStyle = typoTheme != null
        ? (resolvedTextStyle ?? const TextStyle())
            .copyWith(fontFamily: typoTheme.fontFamily)
        : resolvedTextStyle;
    final mouseCursor = rs((s) => s?.mouseCursor) ?? SystemMouseCursors.click;
    final resolvedIconSize = rs((s) => s?.iconSize) ?? 20.0;

    final shape = rs((s) => s?.shape) ?? const RoundedRectangleBorder();

    final fixedSize = rs((s) => s?.fixedSize);
    final minSize = rs((s) => s?.minimumSize) ?? Size.zero;
    final maxSize = rs((s) => s?.maximumSize) ?? Size.infinite;

    final tapTargetSize = widgetStyle?.tapTargetSize ??
        themeStyle?.tapTargetSize ??
        defaultStyle.tapTargetSize ??
        MaterialTapTargetSize.shrinkWrap;

    final animDuration = widgetStyle?.animationDuration ??
        themeStyle?.animationDuration ??
        defaultStyle.animationDuration ??
        const Duration(milliseconds: 100);

    // -- constraints --

    var constraints = BoxConstraints(
      minWidth: minSize.width,
      minHeight: minSize.height,
      maxWidth: maxSize.width,
      maxHeight: maxSize.height,
    );

    if (fixedSize != null) {
      constraints = constraints.copyWith(
        minWidth: fixedSize.width.isFinite ? fixedSize.width : null,
        maxWidth: fixedSize.width.isFinite ? fixedSize.width : null,
        minHeight: fixedSize.height.isFinite ? fixedSize.height : null,
        maxHeight: fixedSize.height.isFinite ? fixedSize.height : null,
      );
    }

    final effectiveMinSize = switch (tapTargetSize) {
      MaterialTapTargetSize.padded => Size(
          math.max(constraints.minWidth, 48),
          math.max(constraints.minHeight, 48),
        ),
      MaterialTapTargetSize.shrinkWrap => Size(
          constraints.minWidth,
          constraints.minHeight,
        ),
    };

    // -- shadows --

    final shadows = widget.shadowsOf(context);
    final effectiveShape = shape.copyWith(side: side);

    // -- content --

    final isSquare = fixedSize != null && fixedSize.width == fixedSize.height;

    Widget content = _ButtonContent(
      leadingIcon: widget.leadingIcon,
      trailingIcon: widget.trailingIcon,
      iconSize: resolvedIconSize,
      isSquare: isSquare,
      child: widget.child,
    );

    content = MihrButtonData(
      foregroundColor: fgColor,
      iconColor: iconColor,
      backgroundColor: bgColor,
      child: IconTheme.merge(
        data: IconThemeData(color: iconColor, size: resolvedIconSize),
        child: DefaultTextStyle.merge(
          style: (textStyle ?? const TextStyle()).copyWith(color: fgColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          child: content,
        ),
      ),
    );

    content = Padding(
      padding: padding,
      child: Center(
        widthFactor: 1,
        heightFactor: 1,
        child: content,
      ),
    );

    // -- ink well (uses effectiveShape so splash clips match border) --

    Widget result = InkWell(
      onTap: _isDisabled ? null : widget.onPressed,
      onLongPress: _isDisabled ? null : widget.onLongPress,
      onHover: widget.onHover,
      onFocusChange: widget.onFocusChange,
      canRequestFocus: !_isDisabled,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      statesController: _controller,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      mouseCursor: mouseCursor,
      customBorder: effectiveShape,
      child: content,
    );

    // -- button container (bg + shape + shadows) --

    result = MihrButtonContainer(
      color: bgColor,
      shape: shape,
      side: side,
      shadows: shadows,
      animationDuration: animDuration,
      child: result,
    );

    // -- size constraints --

    result = ConstrainedBox(constraints: constraints, child: result);

    // -- tap target padding --

    result = _InputPadding(minSize: effectiveMinSize, child: result);

    // -- semantics --

    result = Semantics(button: true, enabled: !_isDisabled, child: result);

    if (widget.tooltip != null) {
      result = Tooltip(message: widget.tooltip, child: result);
    }

    return result;
  }
}

/// Lays out the button content with Mihr UI optical balance.
class _ButtonContent extends StatelessWidget {
  const _ButtonContent({
    required this.iconSize,
    required this.child,
    required this.isSquare,
    this.leadingIcon,
    this.trailingIcon,
  });

  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final double iconSize;
  final bool isSquare;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final wrappedChild = isSquare
        ? child
        : Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: MihrSpacing.xs,
            ),
            child: child,
          );

    if (leadingIcon == null && trailingIcon == null) {
      return wrappedChild;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leadingIcon != null) _iconFrame(leadingIcon!),
        Flexible(
          child: Center(
            widthFactor: 1,
            heightFactor: 1,
            child: wrappedChild,
          ),
        ),
        if (trailingIcon != null) _iconFrame(trailingIcon!),
      ],
    );
  }

  Widget _iconFrame(Widget icon) {
    final frame = iconSize + 4;
    return SizedBox(
      width: frame,
      height: frame,
      child: SizedBox(
        width: iconSize,
        height: iconSize,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: icon,
        ),
      ),
    );
  }
}

/// Ensures minimum tap-target size without affecting visual size.
class _InputPadding extends SingleChildRenderObjectWidget {
  const _InputPadding({required this.minSize, super.child});

  final Size minSize;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderInputPadding(minSize);

  @override
  void updateRenderObject(
    BuildContext context,
    covariant _RenderInputPadding renderObject,
  ) {
    renderObject.minSize = minSize;
  }
}

class _RenderInputPadding extends RenderShiftedBox {
  _RenderInputPadding(this._minSize, [RenderBox? child]) : super(child);

  Size get minSize => _minSize;
  Size _minSize;
  set minSize(Size value) {
    if (_minSize == value) return;
    _minSize = value;
    markNeedsLayout();
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    if (child != null) {
      return math.max(child!.getMinIntrinsicWidth(height), minSize.width);
    }
    return 0;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    if (child != null) {
      return math.max(child!.getMinIntrinsicHeight(width), minSize.height);
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    if (child != null) {
      return math.max(child!.getMaxIntrinsicWidth(height), minSize.width);
    }
    return 0;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    if (child != null) {
      return math.max(child!.getMaxIntrinsicHeight(width), minSize.height);
    }
    return 0;
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) =>
      _computeLayout(constraints, ChildLayoutHelper.dryLayoutChild);

  @override
  void performLayout() {
    size = _computeLayout(constraints, ChildLayoutHelper.layoutChild);
    if (child != null) {
      (child!.parentData! as BoxParentData).offset =
          Alignment.center.alongOffset(size - child!.size as Offset);
    }
  }

  Size _computeLayout(
    BoxConstraints constraints,
    ChildLayouter layoutChild,
  ) {
    if (child != null) {
      final childSize = layoutChild(child!, constraints);
      final height = math.max(childSize.height, minSize.height);
      final width = math.max(childSize.width, minSize.width);
      return constraints.constrain(Size(width, height));
    }
    return Size.zero;
  }

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    if (super.hitTest(result, position: position)) {
      return true;
    }
    if (child == null) return false;
    final center = child!.size.center(Offset.zero);
    return result.addWithRawTransform(
      transform: MatrixUtils.forceToPoint(center),
      position: center,
      hitTest: (result, position) {
        assert(position == center, 'Hit test position must match center');
        return child!.hitTest(result, position: center);
      },
    );
  }
}
