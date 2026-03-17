/// Responsive breakpoints and grid configuration for the Mihr UI
/// design system.
///
/// Breakpoints define the widths at which layout adapts. Grid config
/// defines column counts and gutter sizes per breakpoint.
///
/// ## Checking breakpoints
///
/// ```dart
/// final width = MediaQuery.sizeOf(context).width;
///
/// if (MihrBreakpoints.isDesktop(width)) {
///   // 12-column layout, 32px gutters
/// } else if (MihrBreakpoints.isTablet(width)) {
///   // 8-column layout, 32px gutters
/// } else {
///   // 6-column layout, 16px gutters
/// }
/// ```
///
/// ## With LayoutBuilder
///
/// ```dart
/// LayoutBuilder(
///   builder: (context, constraints) {
///     final grid = MihrBreakpoints.gridFor(constraints.maxWidth);
///     return GridView.count(
///       crossAxisCount: grid.columns,
///       crossAxisSpacing: grid.gutter,
///       mainAxisSpacing: grid.gutter,
///       children: items,
///     );
///   },
/// )
/// ```
class MihrBreakpoints {
  MihrBreakpoints._();

  // ---------------------------------------------------------------------------
  // BREAKPOINT VALUES
  // ---------------------------------------------------------------------------

  /// 375px — Mobile baseline (iPhone SE / small phones).
  static const double mobile = 375;

  /// 768px — Tablet breakpoint.
  static const double tablet = 768;

  /// 1280px — Desktop breakpoint.
  static const double desktop = 1280;

  // ---------------------------------------------------------------------------
  // BREAKPOINT CHECKS
  // ---------------------------------------------------------------------------

  /// Returns `true` when [width] is at least [desktop] (1280px).
  static bool isDesktop(double width) => width >= desktop;

  /// Returns `true` when [width] is at least [tablet] (768px)
  /// but below [desktop].
  static bool isTablet(double width) =>
      width >= tablet && width < desktop;

  /// Returns `true` when [width] is below [tablet] (768px).
  static bool isMobile(double width) => width < tablet;

  // ---------------------------------------------------------------------------
  // GRID CONFIGURATION
  // ---------------------------------------------------------------------------

  /// Desktop grid: 12 columns, 32px gutter.
  static const GridConfig gridDesktop = GridConfig(
    columns: 12,
    gutter: 32,
  );

  /// Tablet grid: 8 columns, 32px gutter.
  static const GridConfig gridTablet = GridConfig(
    columns: 8,
    gutter: 32,
  );

  /// Mobile grid: 6 columns, 16px gutter.
  static const GridConfig gridMobile = GridConfig(
    columns: 6,
    gutter: 16,
  );

  /// Returns the appropriate [GridConfig] for the given [width].
  static GridConfig gridFor(double width) {
    if (isDesktop(width)) return gridDesktop;
    if (isTablet(width)) return gridTablet;
    return gridMobile;
  }
}

/// Immutable grid configuration holding column count and gutter size.
class GridConfig {
  /// Creates a [GridConfig] with the given column count and gutter size.
  const GridConfig({
    required this.columns,
    required this.gutter,
  });
  /// Number of columns in the grid.
  final int columns;

  /// Gap between columns in logical pixels.
  final double gutter;
}
