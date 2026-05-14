/// Mihr UI -- A complete Flutter design system.
///
/// Provides semantic color tokens, typography, spacing, shadows, radius,
/// and production-ready components with automatic light/dark mode support
/// and WCAG-compliant palette generation.
///
/// ## Quick Start
///
/// ```dart
/// import 'package:mihr_ui/mihr_ui.dart';
///
/// MaterialApp(
///   theme: MihrTheme.light(),
///   darkTheme: MihrTheme.dark(),
///   home: const MyApp(),
/// );
/// ```
library;

// Components
export 'components/buttons/buttons.dart';
// Colors -- primitives
export 'core/theme/colors/accent_colors.dart';
export 'core/theme/colors/alpha_colors.dart';
export 'core/theme/colors/background_colors.dart';
export 'core/theme/colors/border_colors.dart';
export 'core/theme/colors/color_scale.dart';
export 'core/theme/colors/color_scale_generator.dart';
export 'core/theme/colors/component_colors.dart';
export 'core/theme/colors/foreground_colors.dart';
export 'core/theme/colors/gray_variants.dart';
export 'core/theme/colors/mihr_colors.dart';
export 'core/theme/colors/mihr_gradients.dart';
export 'core/theme/colors/text_colors.dart';
export 'core/theme/colors/utility_colors.dart';
export 'core/theme/colors/utility_scale.dart';
// Theme
export 'core/theme/mihr_theme.dart';
export 'core/theme/mihr_theme_config.dart';
// Radius
export 'core/theme/radius/mihr_radius.dart';
// Shadows
export 'core/theme/shadows/mihr_backdrop_blurs.dart';
// Spacing
export 'core/theme/spacing/mihr_breakpoints.dart';
export 'core/theme/spacing/mihr_spacing.dart';
export 'core/theme/spacing/mihr_widths.dart';
// Typography
export 'core/theme/typography/mihr_typography.dart';
// Widgets
export 'core/widgets/frosted_container.dart';
