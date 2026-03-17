import 'package:flutter/material.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Component-specific color tokens as a [ThemeExtension].
///
/// These tokens are used by individual UI components and don't fit
/// neatly into the generic text/bg/fg/border categories.
/// Includes: avatar, button icons, featured icons, focus rings,
/// sliders, toggles, tooltips, and text editor icons.
///
/// Access via context:
/// ```dart
/// final comp = Theme.of(context).extension<ComponentColors>()!;
/// Container(color: comp.avatarBg);
/// ```
class ComponentColors extends ThemeExtension<ComponentColors> {
  /// Creates a [ComponentColors] with all component-specific tokens.
  const ComponentColors({
    required this.avatarBg,
    required this.avatarContrastBorder,
    required this.avatarProfilePhotoBorder,
    required this.avatarStylesBgNeutral,
    required this.buttonPrimaryIcon,
    required this.buttonPrimaryIconHover,
    required this.buttonDestructivePrimaryIcon,
    required this.buttonDestructivePrimaryIconHover,
    required this.featuredIconLightFgBrand,
    required this.featuredIconLightFgError,
    required this.featuredIconLightFgGray,
    required this.featuredIconLightFgSuccess,
    required this.featuredIconLightFgWarning,
    required this.focusRing,
    required this.focusRingError,
    required this.footerButtonFg,
    required this.footerButtonFgHover,
    required this.iconFgBrand,
    required this.iconFgBrandOnBrand,
    required this.screenMockupBorder,
    required this.sliderHandleBg,
    required this.sliderHandleBorder,
    required this.toggleBorder,
    required this.toggleButtonFgDisabled,
    required this.toggleSlimBorderPressedHover,
    required this.toggleSlimBorderPressed,
    required this.tooltipSupportingText,
    required this.textEditorIconFg,
    required this.textEditorIconFgActive,
  });

  /// Light mode component colors.
  factory ComponentColors.light({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.gray,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return ComponentColors(
      avatarBg: gray.shade100,
      avatarContrastBorder: const Color(0x14000000), // rgba(0,0,0,0.08)
      avatarProfilePhotoBorder: MihrColors.white,
      avatarStylesBgNeutral: const Color(0xFFE0E0E0),
      buttonPrimaryIcon: brand.shade300,
      buttonPrimaryIconHover: brand.shade200,
      buttonDestructivePrimaryIcon: error.shade300,
      buttonDestructivePrimaryIconHover: error.shade200,
      featuredIconLightFgBrand: brand.shade600,
      featuredIconLightFgError: error.shade600,
      featuredIconLightFgGray: gray.shade500,
      featuredIconLightFgSuccess: success.shade600,
      featuredIconLightFgWarning: warning.shade600,
      focusRing: brand.shade500,
      focusRingError: error.shade500,
      footerButtonFg: brand.shade200,
      footerButtonFgHover: MihrColors.white,
      iconFgBrand: brand.shade600,
      iconFgBrandOnBrand: brand.shade200,
      screenMockupBorder: gray.shade900,
      sliderHandleBg: MihrColors.white,
      sliderHandleBorder: brand.shade600,
      toggleBorder: gray.shade300,
      toggleButtonFgDisabled: gray.shade50,
      toggleSlimBorderPressedHover: brand.shade700,
      toggleSlimBorderPressed: brand.shade600,
      tooltipSupportingText: gray.shade300,
      textEditorIconFg: gray.shade400,
      textEditorIconFgActive: gray.shade500,
    );
  }

  /// Dark mode component colors.
  factory ComponentColors.dark({
    ColorScale brand = MihrColors.brand,
    ColorScale gray = MihrColors.grayDark,
    ColorScale error = MihrColors.error,
    ColorScale warning = MihrColors.warning,
    ColorScale success = MihrColors.success,
  }) {
    return ComponentColors(
      avatarBg: gray.shade800,
      avatarContrastBorder: const Color(0x1FFFFFFF), // rgba(255,255,255,0.12)
      avatarProfilePhotoBorder: gray.shade950,
      avatarStylesBgNeutral: const Color(0xFFE0E0E0),
      buttonPrimaryIcon: brand.shade300,
      buttonPrimaryIconHover: brand.shade200,
      buttonDestructivePrimaryIcon: error.shade300,
      buttonDestructivePrimaryIconHover: error.shade200,
      featuredIconLightFgBrand: brand.shade200,
      featuredIconLightFgError: error.shade200,
      featuredIconLightFgGray: gray.shade200,
      featuredIconLightFgSuccess: success.shade200,
      featuredIconLightFgWarning: warning.shade200,
      focusRing: brand.shade500,
      focusRingError: error.shade500,
      footerButtonFg: gray.shade300,
      footerButtonFgHover: gray.shade100,
      iconFgBrand: gray.shade400,
      iconFgBrandOnBrand: gray.shade400,
      screenMockupBorder: gray.shade700,
      sliderHandleBg: brand.shade500,
      sliderHandleBorder: gray.shade950,
      toggleBorder: MihrColors.transparent,
      toggleButtonFgDisabled: gray.shade600,
      toggleSlimBorderPressedHover: MihrColors.transparent,
      toggleSlimBorderPressed: MihrColors.transparent,
      tooltipSupportingText: gray.shade300,
      textEditorIconFg: gray.shade400,
      textEditorIconFgActive: MihrColors.white,
    );
  }

  /// Avatar default background fill.
  final Color avatarBg;

  /// Avatar subtle contrast border overlay.
  final Color avatarContrastBorder;

  /// Avatar profile photo outer border.
  final Color avatarProfilePhotoBorder;

  /// Avatar neutral style background.
  final Color avatarStylesBgNeutral;

  /// Primary button trailing icon color.
  final Color buttonPrimaryIcon;

  /// Primary button trailing icon hover color.
  final Color buttonPrimaryIconHover;

  /// Destructive button trailing icon color.
  final Color buttonDestructivePrimaryIcon;

  /// Destructive button trailing icon hover color.
  final Color buttonDestructivePrimaryIconHover;

  /// Featured icon foreground — brand variant.
  final Color featuredIconLightFgBrand;

  /// Featured icon foreground — error variant.
  final Color featuredIconLightFgError;

  /// Featured icon foreground — gray variant.
  final Color featuredIconLightFgGray;

  /// Featured icon foreground — success variant.
  final Color featuredIconLightFgSuccess;

  /// Featured icon foreground — warning variant.
  final Color featuredIconLightFgWarning;

  /// Default focus ring color (brand).
  final Color focusRing;

  /// Error focus ring color.
  final Color focusRingError;

  /// Footer button foreground color.
  final Color footerButtonFg;

  /// Footer button foreground hover color.
  final Color footerButtonFgHover;

  /// Brand icon foreground on neutral backgrounds.
  final Color iconFgBrand;

  /// Brand icon foreground on brand backgrounds.
  final Color iconFgBrandOnBrand;

  /// Screen mockup component border.
  final Color screenMockupBorder;

  /// Slider handle background fill.
  final Color sliderHandleBg;

  /// Slider handle border stroke.
  final Color sliderHandleBorder;

  /// Toggle switch border color.
  final Color toggleBorder;

  /// Toggle button foreground when disabled.
  final Color toggleButtonFgDisabled;

  /// Slim toggle border pressed+hover state.
  final Color toggleSlimBorderPressedHover;

  /// Slim toggle border pressed state.
  final Color toggleSlimBorderPressed;

  /// Tooltip supporting/secondary text color.
  final Color tooltipSupportingText;

  /// Text editor toolbar icon foreground.
  final Color textEditorIconFg;

  /// Text editor toolbar icon foreground when active.
  final Color textEditorIconFgActive;

  /// Creates a copy with the given fields replaced.
  @override
  ComponentColors copyWith({
    Color? avatarBg,
    Color? avatarContrastBorder,
    Color? avatarProfilePhotoBorder,
    Color? avatarStylesBgNeutral,
    Color? buttonPrimaryIcon,
    Color? buttonPrimaryIconHover,
    Color? buttonDestructivePrimaryIcon,
    Color? buttonDestructivePrimaryIconHover,
    Color? featuredIconLightFgBrand,
    Color? featuredIconLightFgError,
    Color? featuredIconLightFgGray,
    Color? featuredIconLightFgSuccess,
    Color? featuredIconLightFgWarning,
    Color? focusRing,
    Color? focusRingError,
    Color? footerButtonFg,
    Color? footerButtonFgHover,
    Color? iconFgBrand,
    Color? iconFgBrandOnBrand,
    Color? screenMockupBorder,
    Color? sliderHandleBg,
    Color? sliderHandleBorder,
    Color? toggleBorder,
    Color? toggleButtonFgDisabled,
    Color? toggleSlimBorderPressedHover,
    Color? toggleSlimBorderPressed,
    Color? tooltipSupportingText,
    Color? textEditorIconFg,
    Color? textEditorIconFgActive,
  }) {
    return ComponentColors(
      avatarBg: avatarBg ?? this.avatarBg,
      avatarContrastBorder: avatarContrastBorder ?? this.avatarContrastBorder,
      avatarProfilePhotoBorder:
          avatarProfilePhotoBorder ?? this.avatarProfilePhotoBorder,
      avatarStylesBgNeutral:
          avatarStylesBgNeutral ?? this.avatarStylesBgNeutral,
      buttonPrimaryIcon: buttonPrimaryIcon ?? this.buttonPrimaryIcon,
      buttonPrimaryIconHover:
          buttonPrimaryIconHover ?? this.buttonPrimaryIconHover,
      buttonDestructivePrimaryIcon:
          buttonDestructivePrimaryIcon ?? this.buttonDestructivePrimaryIcon,
      buttonDestructivePrimaryIconHover:
          buttonDestructivePrimaryIconHover ??
          this.buttonDestructivePrimaryIconHover,
      featuredIconLightFgBrand:
          featuredIconLightFgBrand ?? this.featuredIconLightFgBrand,
      featuredIconLightFgError:
          featuredIconLightFgError ?? this.featuredIconLightFgError,
      featuredIconLightFgGray:
          featuredIconLightFgGray ?? this.featuredIconLightFgGray,
      featuredIconLightFgSuccess:
          featuredIconLightFgSuccess ?? this.featuredIconLightFgSuccess,
      featuredIconLightFgWarning:
          featuredIconLightFgWarning ?? this.featuredIconLightFgWarning,
      focusRing: focusRing ?? this.focusRing,
      focusRingError: focusRingError ?? this.focusRingError,
      footerButtonFg: footerButtonFg ?? this.footerButtonFg,
      footerButtonFgHover: footerButtonFgHover ?? this.footerButtonFgHover,
      iconFgBrand: iconFgBrand ?? this.iconFgBrand,
      iconFgBrandOnBrand: iconFgBrandOnBrand ?? this.iconFgBrandOnBrand,
      screenMockupBorder: screenMockupBorder ?? this.screenMockupBorder,
      sliderHandleBg: sliderHandleBg ?? this.sliderHandleBg,
      sliderHandleBorder: sliderHandleBorder ?? this.sliderHandleBorder,
      toggleBorder: toggleBorder ?? this.toggleBorder,
      toggleButtonFgDisabled:
          toggleButtonFgDisabled ?? this.toggleButtonFgDisabled,
      toggleSlimBorderPressedHover:
          toggleSlimBorderPressedHover ?? this.toggleSlimBorderPressedHover,
      toggleSlimBorderPressed:
          toggleSlimBorderPressed ?? this.toggleSlimBorderPressed,
      tooltipSupportingText:
          tooltipSupportingText ?? this.tooltipSupportingText,
      textEditorIconFg: textEditorIconFg ?? this.textEditorIconFg,
      textEditorIconFgActive:
          textEditorIconFgActive ?? this.textEditorIconFgActive,
    );
  }

  /// Linearly interpolates between two [ComponentColors] instances.
  @override
  ComponentColors lerp(ComponentColors? other, double t) {
    if (other is! ComponentColors) return this;
    return ComponentColors(
      avatarBg: Color.lerp(avatarBg, other.avatarBg, t)!,
      avatarContrastBorder: Color.lerp(
        avatarContrastBorder,
        other.avatarContrastBorder,
        t,
      )!,
      avatarProfilePhotoBorder: Color.lerp(
        avatarProfilePhotoBorder,
        other.avatarProfilePhotoBorder,
        t,
      )!,
      avatarStylesBgNeutral: Color.lerp(
        avatarStylesBgNeutral,
        other.avatarStylesBgNeutral,
        t,
      )!,
      buttonPrimaryIcon: Color.lerp(
        buttonPrimaryIcon,
        other.buttonPrimaryIcon,
        t,
      )!,
      buttonPrimaryIconHover: Color.lerp(
        buttonPrimaryIconHover,
        other.buttonPrimaryIconHover,
        t,
      )!,
      buttonDestructivePrimaryIcon: Color.lerp(
        buttonDestructivePrimaryIcon,
        other.buttonDestructivePrimaryIcon,
        t,
      )!,
      buttonDestructivePrimaryIconHover: Color.lerp(
        buttonDestructivePrimaryIconHover,
        other.buttonDestructivePrimaryIconHover,
        t,
      )!,
      featuredIconLightFgBrand: Color.lerp(
        featuredIconLightFgBrand,
        other.featuredIconLightFgBrand,
        t,
      )!,
      featuredIconLightFgError: Color.lerp(
        featuredIconLightFgError,
        other.featuredIconLightFgError,
        t,
      )!,
      featuredIconLightFgGray: Color.lerp(
        featuredIconLightFgGray,
        other.featuredIconLightFgGray,
        t,
      )!,
      featuredIconLightFgSuccess: Color.lerp(
        featuredIconLightFgSuccess,
        other.featuredIconLightFgSuccess,
        t,
      )!,
      featuredIconLightFgWarning: Color.lerp(
        featuredIconLightFgWarning,
        other.featuredIconLightFgWarning,
        t,
      )!,
      focusRing: Color.lerp(focusRing, other.focusRing, t)!,
      focusRingError: Color.lerp(focusRingError, other.focusRingError, t)!,
      footerButtonFg: Color.lerp(footerButtonFg, other.footerButtonFg, t)!,
      footerButtonFgHover: Color.lerp(
        footerButtonFgHover,
        other.footerButtonFgHover,
        t,
      )!,
      iconFgBrand: Color.lerp(iconFgBrand, other.iconFgBrand, t)!,
      iconFgBrandOnBrand: Color.lerp(
        iconFgBrandOnBrand,
        other.iconFgBrandOnBrand,
        t,
      )!,
      screenMockupBorder: Color.lerp(
        screenMockupBorder,
        other.screenMockupBorder,
        t,
      )!,
      sliderHandleBg: Color.lerp(sliderHandleBg, other.sliderHandleBg, t)!,
      sliderHandleBorder: Color.lerp(
        sliderHandleBorder,
        other.sliderHandleBorder,
        t,
      )!,
      toggleBorder: Color.lerp(toggleBorder, other.toggleBorder, t)!,
      toggleButtonFgDisabled: Color.lerp(
        toggleButtonFgDisabled,
        other.toggleButtonFgDisabled,
        t,
      )!,
      toggleSlimBorderPressedHover: Color.lerp(
        toggleSlimBorderPressedHover,
        other.toggleSlimBorderPressedHover,
        t,
      )!,
      toggleSlimBorderPressed: Color.lerp(
        toggleSlimBorderPressed,
        other.toggleSlimBorderPressed,
        t,
      )!,
      tooltipSupportingText: Color.lerp(
        tooltipSupportingText,
        other.tooltipSupportingText,
        t,
      )!,
      textEditorIconFg: Color.lerp(
        textEditorIconFg,
        other.textEditorIconFg,
        t,
      )!,
      textEditorIconFgActive: Color.lerp(
        textEditorIconFgActive,
        other.textEditorIconFgActive,
        t,
      )!,
    );
  }
}
