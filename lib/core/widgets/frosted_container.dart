import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mihr_ui/core/theme/radius/mihr_radius.dart';
import 'package:mihr_ui/core/theme/shadows/mihr_backdrop_blurs.dart';

/// A container with a frosted-glass (backdrop blur) effect.
///
/// Combines [BackdropFilter] + semi-transparent overlay + clipping
/// into a single reusable widget. Automatically switches overlay
/// color between light and dark mode.
///
/// ## Usage
///
/// ```dart
/// FrostedContainer(
///   blur: MihrBackdropBlurs.md,
///   borderRadius: BorderRadius.circular(12),
///   child: Padding(
///     padding: EdgeInsets.all(16),
///     child: Text('Frosted content'),
///   ),
/// );
/// ```
///
/// ## As a navigation bar
///
/// ```dart
/// FrostedContainer(
///   blur: MihrBackdropBlurs.lg,
///   borderRadius: BorderRadius.zero,
///   child: SafeArea(
///     child: Row(children: [/* nav items */]),
///   ),
/// );
/// ```
class FrostedContainer extends StatelessWidget {
  /// Creates a frosted-glass container with the given [blur] and [child].
  const FrostedContainer({
    required this.blur,
    required this.child,
    super.key,
    this.borderRadius = MihrRadius.borderXl,
    this.border,
    this.decoration,
    this.overlayColor,
    this.padding,
  });

  /// The backdrop blur preset to apply.
  final BackdropBlurStyle blur;

  /// The child widget rendered on top of the frosted background.
  final Widget child;

  /// Border radius for clipping. Defaults to 12px.
  final BorderRadius borderRadius;

  /// Optional border for the container.
  final BoxBorder? border;

  /// Additional decoration (applied on top of the blur overlay).
  /// Do NOT set [BoxDecoration.color] here — use [overlayColor] instead.
  final BoxDecoration? decoration;

  /// Override the overlay color. When `null`, auto-selects based on brightness.
  final Color? overlayColor;

  /// Padding inside the container.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final effectiveOverlay = overlayColor ?? blur.overlay(brightness);

    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur.sigma, sigmaY: blur.sigma),
        child: Container(
          padding: padding,
          decoration: (decoration ?? const BoxDecoration()).copyWith(
            color: effectiveOverlay,
            borderRadius: borderRadius,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
