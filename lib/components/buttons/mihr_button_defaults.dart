import 'package:flutter/material.dart';
import 'package:mihr_ui/components/buttons/mihr_button_sizes.dart';
import 'package:mihr_ui/core/theme/colors/background_colors.dart';
import 'package:mihr_ui/core/theme/colors/border_colors.dart';
import 'package:mihr_ui/core/theme/colors/foreground_colors.dart';
import 'package:mihr_ui/core/theme/colors/utility_scale.dart';
import 'package:mihr_ui/core/theme/radius/mihr_radius.dart';

/// Single source of truth for button styles.
///
/// Contains two categories:
///
/// **Structural** — [baseStyle] provides shape, size, padding, splash,
/// animation, and cursor. No colors. This feeds both Mihr buttons and
/// Material button themes.
///
/// **Color** — [primaryColors], [secondaryColors], etc. provide
/// backgroundColor, foregroundColor, side, and elevation using semantic
/// tokens. Mihr buttons merge `baseStyle + colorStyle`. Material buttons
/// use only `baseStyle` and get colors from [ColorScheme].
class MihrButtonDefaults {
  MihrButtonDefaults._();

  // -----------------------------------------------------------------------
  // STRUCTURAL (shared by Mihr + Material buttons)
  // -----------------------------------------------------------------------

  /// Structural-only [ButtonStyle] for a regular (non-link) button.
  ///
  /// Contains shape, size constraints, padding, text style, icon size,
  /// splash factory, animation duration, and cursor. Does NOT contain
  /// backgroundColor, foregroundColor, side, or elevation.
  static ButtonStyle baseStyle({
    required MihrButtonSizeData sizeData,
    OutlinedBorder? shape,
    bool isSquare = false,
  }) {
    final effectiveShape =
        shape ??
        const RoundedRectangleBorder(borderRadius: MihrRadius.borderMd);

    if (isSquare) {
      return ButtonStyle(
        minimumSize: WidgetStatePropertyAll(
          Size(sizeData.height, sizeData.height),
        ),
        fixedSize: WidgetStatePropertyAll(
          Size(sizeData.height, sizeData.height),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        textStyle: WidgetStatePropertyAll(sizeData.textStyle),
        iconSize: WidgetStatePropertyAll(sizeData.iconSize),
        shape: WidgetStatePropertyAll(effectiveShape),
        overlayColor: const WidgetStatePropertyAll(Colors.transparent),
        splashFactory: NoSplash.splashFactory,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        animationDuration: const Duration(milliseconds: 100),
        mouseCursor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.disabled)
              ? SystemMouseCursors.basic
              : SystemMouseCursors.click,
        ),
      );
    }

    return ButtonStyle(
      padding: WidgetStatePropertyAll(
        EdgeInsets.symmetric(
          vertical: sizeData.paddingV,
          horizontal: sizeData.paddingH,
        ),
      ),
      minimumSize: WidgetStatePropertyAll(Size(0, sizeData.height)),
      maximumSize: WidgetStatePropertyAll(
        Size(double.infinity, sizeData.height),
      ),
      textStyle: WidgetStatePropertyAll(sizeData.textStyle),
      iconSize: WidgetStatePropertyAll(sizeData.iconSize),
      shape: WidgetStatePropertyAll(effectiveShape),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      animationDuration: const Duration(milliseconds: 100),
      mouseCursor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled)
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
      ),
    );
  }

  /// Structural style for link-style buttons (no padding, underline
  /// on hover).
  static ButtonStyle linkBaseStyle({
    required MihrButtonSizeData sizeData,
    required Color hoverDecorationColor,
    OutlinedBorder? shape,
  }) {
    final effectiveShape =
        shape ??
        const RoundedRectangleBorder(borderRadius: MihrRadius.borderXs);

    return ButtonStyle(
      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
      minimumSize: WidgetStatePropertyAll(Size(0, sizeData.height)),
      maximumSize: WidgetStatePropertyAll(
        Size(double.infinity, sizeData.height),
      ),
      textStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed)) {
          return sizeData.textStyle.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: hoverDecorationColor,
          );
        }
        return sizeData.textStyle;
      }),
      iconSize: WidgetStatePropertyAll(sizeData.iconSize),
      shape: WidgetStatePropertyAll(effectiveShape),
      elevation: const WidgetStatePropertyAll(0),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      splashFactory: NoSplash.splashFactory,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      animationDuration: const Duration(milliseconds: 100),
      mouseCursor: WidgetStateProperty.resolveWith(
        (s) => s.contains(WidgetState.disabled)
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
      ),
    );
  }

  // -----------------------------------------------------------------------
  // VARIANT COLORS (Mihr buttons only)
  // -----------------------------------------------------------------------

  /// Primary button colors — solid brand fill.
  static ButtonStyle primaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return bg.disabled;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return bg.brandSolidHover;
      }
      return bg.brandSolid;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return fg.disabled;
      return fg.white;
    }),
    elevation: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return 0.0;
      return 1.0;
    }),
    shadowColor: const WidgetStatePropertyAll(Color(0x0D101828)),
  );

  /// Soft primary — tinted brand bg with brand text, no border.
  ///
  /// Blends the brand accent into the surface at low opacity so
  /// the tint is always visible and subtle, regardless of palette
  /// lightness or brightness mode.
  static ButtonStyle softPrimaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
    required UtilityScale brandScale,
  }) {
    final accent = brandScale.shade500;
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) return bg.disabled;
        if (s.contains(WidgetState.hovered) ||
            s.contains(WidgetState.pressed)) {
          return Color.lerp(bg.primary, accent, 0.18)!;
        }
        return Color.lerp(bg.primary, accent, 0.10)!;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) return fg.disabled;
        if (s.contains(WidgetState.hovered) ||
            s.contains(WidgetState.pressed)) {
          return fg.brandSecondaryHover;
        }
        return fg.brandPrimary;
      }),
    );
  }

  /// Secondary button colors — outlined with gray border.
  static ButtonStyle secondaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
    required BorderColors border,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return bg.primary;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return bg.primaryHover;
      }
      return bg.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return fg.disabled;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return fg.secondaryHover;
      }
      return fg.secondary;
    }),
    side: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) {
        return BorderSide(color: border.disabledSubtle);
      }
      return BorderSide(color: border.primary);
    }),
    elevation: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return 0.0;
      return 1.0;
    }),
    shadowColor: const WidgetStatePropertyAll(Color(0x0D101828)),
  );

  /// Tertiary button colors — ghost, transparent background.
  static ButtonStyle tertiaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return bg.primaryHover;
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return fg.disabled;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return fg.secondaryHover;
      }
      return fg.secondary;
    }),
  );

  /// Link button colors — brand-colored text, no background.
  static ButtonStyle linkBrandColors({required ForegroundColors fg}) =>
      ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((s) {
          if (s.contains(WidgetState.disabled)) return fg.disabled;
          if (s.contains(WidgetState.hovered) ||
              s.contains(WidgetState.pressed)) {
            return fg.brandSecondaryHover;
          }
          return fg.brandPrimary;
        }),
      );

  /// Link button colors — gray text variant.
  static ButtonStyle linkGrayColors({required ForegroundColors fg}) =>
      ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((s) {
          if (s.contains(WidgetState.disabled)) return fg.disabled;
          if (s.contains(WidgetState.hovered) ||
              s.contains(WidgetState.pressed)) {
            return fg.secondaryHover;
          }
          return fg.secondary;
        }),
      );

  // -- Destructive variants --

  /// Destructive primary — solid error fill.
  static ButtonStyle destructivePrimaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return bg.disabled;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return bg.errorSolidHover;
      }
      return bg.errorSolid;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return fg.disabled;
      return fg.white;
    }),
    elevation: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return 0.0;
      return 1.0;
    }),
    shadowColor: const WidgetStatePropertyAll(Color(0x0D101828)),
  );

  /// Destructive secondary — outlined with error border.
  static ButtonStyle destructiveSecondaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
    required BorderColors border,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return bg.primary;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return bg.errorPrimary;
      }
      return bg.primary;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return fg.disabled;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return fg.errorSecondary;
      }
      return fg.errorPrimary;
    }),
    side: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) {
        return BorderSide(color: border.disabledSubtle);
      }
      return BorderSide(color: border.error);
    }),
    elevation: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return 0.0;
      return 1.0;
    }),
    shadowColor: const WidgetStatePropertyAll(Color(0x0D101828)),
  );

  /// Destructive soft primary — tinted error bg with error text.
  ///
  /// Same alpha-blend strategy as [softPrimaryColors].
  static ButtonStyle destructiveSoftPrimaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
    required UtilityScale errorScale,
  }) {
    final accent = errorScale.shade500;
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) return bg.disabled;
        if (s.contains(WidgetState.hovered) ||
            s.contains(WidgetState.pressed)) {
          return Color.lerp(bg.primary, accent, 0.18)!;
        }
        return Color.lerp(bg.primary, accent, 0.10)!;
      }),
      foregroundColor: WidgetStateProperty.resolveWith((s) {
        if (s.contains(WidgetState.disabled)) return fg.disabled;
        if (s.contains(WidgetState.hovered) ||
            s.contains(WidgetState.pressed)) {
          return fg.errorSecondary;
        }
        return fg.errorPrimary;
      }),
    );
  }

  /// Destructive tertiary — ghost with error text.
  static ButtonStyle destructiveTertiaryColors({
    required BackgroundColors bg,
    required ForegroundColors fg,
  }) => ButtonStyle(
    backgroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return bg.errorPrimary;
      }
      return Colors.transparent;
    }),
    foregroundColor: WidgetStateProperty.resolveWith((s) {
      if (s.contains(WidgetState.disabled)) return fg.disabled;
      if (s.contains(WidgetState.hovered) || s.contains(WidgetState.pressed)) {
        return fg.errorSecondary;
      }
      return fg.errorPrimary;
    }),
  );

  /// Destructive link — text-only with error color.
  static ButtonStyle destructiveLinkColors({required ForegroundColors fg}) =>
      ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
        foregroundColor: WidgetStateProperty.resolveWith((s) {
          if (s.contains(WidgetState.disabled)) return fg.disabled;
          if (s.contains(WidgetState.hovered) ||
              s.contains(WidgetState.pressed)) {
            return fg.errorSecondary;
          }
          return fg.errorPrimary;
        }),
      );
}
