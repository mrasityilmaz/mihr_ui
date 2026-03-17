import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

import 'package:mihr_ui/components/buttons/mihr_button_shadows.dart';

/// Custom button surface that supports both outer and inner shadows.
///
/// Uses [Material] for the background color, shape, and clip — giving
/// [InkWell] a proper ancestor. Outer shadows are painted via a
/// [DecoratedBox] underneath, and inner shadows via [CustomPaint]
/// on top of the content.
class MihrButtonContainer extends StatelessWidget {
  /// Creates a button container with the given surface and shadow config.
  const MihrButtonContainer({
    required this.color, required this.shape, required this.shadows, required this.isFocused, required this.animationDuration, required this.child, super.key,
    this.side = BorderSide.none,
  });

  /// Background fill color.
  final Color color;

  /// Outer shape (border radius, superellipse, etc.).
  final OutlinedBorder shape;

  /// Border side drawn on top of the shape.
  final BorderSide side;

  /// Shadow configuration (outer + inner + focus ring).
  final MihrButtonShadows shadows;

  /// Whether the button is currently focused (shows focus ring).
  final bool isFocused;

  /// Duration for color/shape transitions.
  final Duration animationDuration;

  /// The button content (InkWell + padding + label).
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final outerShadows = [...shadows.outer, if (isFocused) ...shadows.focusOuter];

    final hasInnerShadows = shadows.inner.isNotEmpty;
    final effectiveShape = shape.copyWith(side: side);

    var result = child;

    if (hasInnerShadows) {
      result = CustomPaint(
        foregroundPainter: _InnerShadowPainter(shape: effectiveShape, shadows: shadows.inner),
        child: result,
      );
    }

    result = Material(
      type: MaterialType.button,
      color: color,
      shape: effectiveShape,
      clipBehavior: Clip.antiAlias,
      animationDuration: animationDuration,
      child: result,
    );

    if (outerShadows.isNotEmpty) {
      result = DecoratedBox(
        decoration: ShapeDecoration(shape: effectiveShape, shadows: outerShadows),
        child: result,
      );
    }

    return result;
  }
}

/// Paints inset (inner) shadows inside the button shape.
///
/// Each shadow in [shadows] is rendered as a blurred, offset,
/// clipped fill that only appears inside the shape boundary —
/// mimicking CSS `box-shadow: inset`.
class _InnerShadowPainter extends CustomPainter {
  _InnerShadowPainter({required this.shape, required this.shadows});

  final ShapeBorder shape;
  final List<BoxShadow> shadows;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final outerPath = shape.getOuterPath(rect);

    for (final shadow in shadows) {
      _paintInnerShadow(canvas, outerPath, rect, shadow);
    }
  }

  void _paintInnerShadow(Canvas canvas, Path clipPath, Rect rect, BoxShadow shadow) {
    canvas
      ..save()
      ..clipPath(clipPath);

    final inset = shadow.spreadRadius;
    final cutoutRect = rect.shift(shadow.offset).deflate(inset);
    final cutoutShape = _shrinkShape(inset);
    final cutout = cutoutShape.getOuterPath(cutoutRect);

    // Use saveLayer + BlendMode.dstOut instead of Path.combine,
    // which is unreliable on Flutter web renderers.
    final layerBounds = rect.inflate(shadow.blurRadius + 100);
    canvas
      ..saveLayer(layerBounds, Paint())
      ..drawRect(
        layerBounds,
        Paint()
          ..color = shadow.color
          ..maskFilter = shadow.blurRadius > 0 ? MaskFilter.blur(ui.BlurStyle.normal, shadow.blurSigma) : null,
      )
      ..drawPath(cutout, Paint()..blendMode = BlendMode.dstOut)
      ..restore()
      ..restore();
  }

  /// Returns a copy of [shape] with border radius reduced by [inset].
  ///
  /// Guarantees `innerRadius + inset == outerRadius` so that the
  /// inset border has uniform thickness around corners.
  ShapeBorder _shrinkShape(double inset) {
    if (inset <= 0) return shape;

    if (shape is RoundedRectangleBorder) {
      final rrb = shape as RoundedRectangleBorder;
      final resolved = rrb.borderRadius.resolve(TextDirection.ltr);
      final adjusted = BorderRadius.only(
        topLeft: _shrinkRadius(resolved.topLeft, inset),
        topRight: _shrinkRadius(resolved.topRight, inset),
        bottomLeft: _shrinkRadius(resolved.bottomLeft, inset),
        bottomRight: _shrinkRadius(resolved.bottomRight, inset),
      );
      return RoundedRectangleBorder(borderRadius: adjusted);
    }

    return shape;
  }

  static Radius _shrinkRadius(Radius r, double inset) =>
      Radius.elliptical(math.max(0, r.x - inset), math.max(0, r.y - inset));

  @override
  bool shouldRepaint(_InnerShadowPainter oldDelegate) => shape != oldDelegate.shape || shadows != oldDelegate.shadows;
}
