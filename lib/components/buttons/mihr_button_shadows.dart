import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' show Material;
import 'package:flutter/painting.dart';

/// Shadow configuration for Mihr buttons.
///
/// Supports both outer and inner shadows, enabling the Mihr UI
/// signature 3-layer shadow look that Flutter's [Material] widget
/// cannot render.
///
/// ## Presets
///
/// ```dart
/// MihrButtonShadows.standard  // outer xs + inner ring + skeuomorphic
/// MihrButtonShadows.flat      // no shadows at all
/// MihrButtonShadows.subtle    // light outer shadow only
/// ```
///
/// ## Custom
///
/// ```dart
/// MihrButtonShadows(
///   outer: [BoxShadow(offset: Offset(0, 1), blurRadius: 2, ...)],
///   inner: [BoxShadow(offset: Offset(0, -2), blurRadius: 0, ...)],
/// )
/// ```
@immutable
class MihrButtonShadows {
  /// Creates a shadow configuration with the given layers.
  const MihrButtonShadows({
    this.outer = const [],
    this.inner = const [],
    this.focusOuter = const [],
  });

  /// Drop shadows rendered below the button surface.
  final List<BoxShadow> outer;

  /// Inner shadows rendered inside the button surface
  /// (inset effect like CSS `box-shadow: inset`).
  final List<BoxShadow> inner;

  /// Additional outer shadows applied when the button is focused.
  /// Typically a focus ring.
  final List<BoxShadow> focusOuter;

  /// Standard Mihr UI shadow: xs outer shadow + ring inner shadow.
  ///
  /// Produces a subtle depth effect with an inset darkening at the
  /// bottom edge, giving buttons a slightly 3D / skeuomorphic feel.
  static const standard = MihrButtonShadows(
    outer: [
      BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: Color(0x0D101828)),
    ],
    inner: [
      BoxShadow(offset: Offset(0, -2), color: Color(0x0D101828)),
      BoxShadow(spreadRadius: 1, color: Color(0x2E0A0D12)),
    ],
    focusOuter: [BoxShadow(spreadRadius: 4, color: Color(0x3D7F56D9))],
  );

  /// No shadows at all — completely flat buttons.
  static const flat = MihrButtonShadows();

  /// Light outer shadow only — no inner shadow.
  static const subtle = MihrButtonShadows(
    outer: [
      BoxShadow(offset: Offset(0, 1), blurRadius: 2, color: Color(0x0D101828)),
    ],
  );

  /// Whether this configuration has any visible shadows.
  bool get isEmpty => outer.isEmpty && inner.isEmpty && focusOuter.isEmpty;

  /// Returns a copy with merged focus shadows.
  MihrButtonShadows withFocusRing(List<BoxShadow> ring) =>
      MihrButtonShadows(outer: outer, inner: inner, focusOuter: ring);
}
