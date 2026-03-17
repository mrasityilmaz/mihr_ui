/// Mihr UI button component library.
///
/// Provides 6 button types following the Mihr UI hierarchy:
///
/// - [MihrPrimaryButton] — solid brand fill, highest weight
/// - [MihrSoftPrimaryButton] — tinted brand fill, no border
/// - [MihrSecondaryButton] — outlined with gray border
/// - [MihrTertiaryButton] — ghost / transparent
/// - [MihrLinkButton] — inline text link (brand or gray)
/// - [MihrDestructiveButton] — error variants (primary/soft/secondary/tertiary/link)
///
/// All styling flows through [MihrButtonThemeData] (single
/// [ThemeExtension]) and [MihrButtonDefaults] (shared style source).
library;

import 'package:flutter/material.dart' show ThemeExtension;
import 'package:mihr_ui/components/buttons/buttons.dart' show MihrButtonDefaults, MihrButtonThemeData, MihrDestructiveButton, MihrLinkButton, MihrPrimaryButton, MihrSecondaryButton, MihrSoftPrimaryButton, MihrTertiaryButton;
import 'package:mihr_ui/mihr_ui.dart' show MihrButtonDefaults, MihrButtonThemeData, MihrDestructiveButton, MihrLinkButton, MihrPrimaryButton, MihrSecondaryButton, MihrSoftPrimaryButton, MihrTertiaryButton;

export 'mihr_button_base.dart';
export 'mihr_button_container.dart';
export 'mihr_button_defaults.dart';
export 'mihr_button_shadows.dart';
export 'mihr_button_sizes.dart';
export 'mihr_button_theme.dart';
export 'mihr_destructive_button.dart';
export 'mihr_link_button.dart';
export 'mihr_primary_button.dart';
export 'mihr_secondary_button.dart';
export 'mihr_soft_primary_button.dart';
export 'mihr_tertiary_button.dart';
