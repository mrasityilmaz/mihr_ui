/// Standard button size variants with layout metrics.
///
/// Each variant defines height, horizontal padding, label font size,
/// icon size, and the corresponding link-button height.
///
/// ```dart
/// MihrPrimaryButton(size: MihrButtonSize.xxs, onPressed: _go, child: Text('Go'))
/// // uses MihrButtonSize.xxs → 24px height, 12px font, 12px icon
/// ```
enum MihrButtonSize {
  /// Extra-extra-small — 24px height, 12px font, 12px icon.
  xxs(
    height: 24,
    paddingH: 6,
    fontSize: 12,
    iconSize: 12,
    linkHeight: 16,
  ),

  /// Extra-small — 32px height, 12px font, 14px icon.
  xs(
    height: 32,
    paddingH: 8,
    fontSize: 12,
    iconSize: 14,
    linkHeight: 18,
  ),

  /// Small — 36px height, 14px font, 16px icon.
  sm(
    height: 36,
    paddingH: 10,
    fontSize: 14,
    iconSize: 16,
    linkHeight: 20,
  ),

  /// Medium (default) — 40px height, 14px font, 20px icon.
  md(
    height: 40,
    paddingH: 12,
    fontSize: 14,
    iconSize: 20,
    linkHeight: 20,
  ),

  /// Large — 44px height, 16px font, 20px icon.
  lg(
    height: 44,
    paddingH: 14,
    fontSize: 16,
    iconSize: 20,
    linkHeight: 24,
  ),

  /// Extra-large — 48px height, 16px font, 24px icon.
  xl(
    height: 48,
    paddingH: 16,
    fontSize: 16,
    iconSize: 24,
    linkHeight: 24,
  ),

  /// Extra-extra-large — 56px height, 18px font, 24px icon.
  xxl(
    height: 56,
    paddingH: 20,
    fontSize: 18,
    iconSize: 24,
    linkHeight: 28,
  );

  const MihrButtonSize({
    required this.height,
    required this.paddingH,
    required this.fontSize,
    required this.iconSize,
    required this.linkHeight,
  });

  /// Total button height constraint.
  final double height;

  /// Horizontal content padding.
  final double paddingH;

  /// Label font size in logical pixels.
  final double fontSize;

  /// Icon frame size.
  final double iconSize;

  /// Height when used inside a link-style button.
  final double linkHeight;
}
