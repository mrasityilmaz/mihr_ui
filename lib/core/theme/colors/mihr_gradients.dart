import 'dart:math' as math;

import 'package:flutter/painting.dart';
import 'package:mihr_ui/core/theme/colors/color_scale.dart';
import 'package:mihr_ui/core/theme/colors/mihr_colors.dart';

/// Pre-defined gradient constants for the Mihr UI design system.
///
/// Three categories:
/// - [GrayGradients] — Neutral depth gradients for backgrounds/surfaces.
/// - [BrandGradients] — Brand-tinted gradients using the active brand palette.
/// - [DecoGradients] — 91 decorative gradients for marketing/illustration.
///
/// Usage:
/// ```dart
/// Container(
///   decoration: BoxDecoration(gradient: GrayGradients.dark600to500),
/// );
/// ```

// ---------------------------------------------------------------------------
// HELPER — Converts CSS angle (0° = to top) to Flutter alignment pair.
// CSS: 0° = bottom→top, 90° = left→right, 180° = top→bottom
// ---------------------------------------------------------------------------
(Alignment begin, Alignment end) _angleToAlignment(double cssDegrees) {
  final rad = (cssDegrees - 90) * math.pi / 180;
  final dx = math.cos(rad);
  final dy = math.sin(rad);
  return (Alignment(-dx, -dy), Alignment(dx, dy));
}

LinearGradient _gradient(Color start, Color end, double cssDegrees) {
  final (begin, endAlign) = _angleToAlignment(cssDegrees);
  return LinearGradient(begin: begin, end: endAlign, colors: [start, end]);
}

// ---------------------------------------------------------------------------
// GRAY GRADIENTS
// ---------------------------------------------------------------------------

/// Neutral gray gradients for adding subtle depth and texture.
///
/// Dark variants (600→500, 700→600, etc.) are useful for dark hero sections.
/// Light variants (50→white, 100→25, etc.) add subtle surface differentiation.
class GrayGradients {
  GrayGradients._();

  /// Generates gray gradients from a custom [ColorScale].
  /// Useful when the gray palette has been swapped (e.g. gray-warm).
  static List<LinearGradient> fromScale(ColorScale gray) {
    return [
      _gradient(gray.shade600, gray.shade500, 90),
      _gradient(gray.shade700, gray.shade600, 45),
      _gradient(gray.shade800, gray.shade600, 45),
      _gradient(gray.shade800, gray.shade600, 90),
      _gradient(gray.shade800, gray.shade700, 28.5),
      _gradient(gray.shade900, gray.shade600, 45),
      _gradient(gray.shade900, gray.shade700, 45),
      _gradient(gray.shade50, MihrColors.white, 180),
      _gradient(gray.shade100, MihrColors.white, 180),
      _gradient(gray.shade100, gray.shade25, 180),
      _gradient(gray.shade100, gray.shade50, 180),
      _gradient(gray.shade200, gray.shade50, 180),
      _gradient(gray.shade200, gray.shade25, 180),
      _gradient(gray.shade200, gray.shade100, 180),
    ];
  }

  /// Gray 600→500, 90° — subtle dark surface depth.
  static final LinearGradient dark600to500 = _gradient(
    MihrColors.gray.shade600,
    MihrColors.gray.shade500,
    90,
  );

  /// Gray 700→600, 45° — diagonal dark surface.
  static final LinearGradient dark700to600 = _gradient(
    MihrColors.gray.shade700,
    MihrColors.gray.shade600,
    45,
  );

  /// Gray 800→600, 45° — strong diagonal dark surface.
  static final LinearGradient dark800to600_45 = _gradient(
    MihrColors.gray.shade800,
    MihrColors.gray.shade600,
    45,
  );

  /// Gray 800→600, 90° — strong horizontal dark surface.
  static final LinearGradient dark800to600_90 = _gradient(
    MihrColors.gray.shade800,
    MihrColors.gray.shade600,
    90,
  );

  /// Gray 800→700, 28.5° — shallow-angle dark surface.
  static final LinearGradient dark800to700 = _gradient(
    MihrColors.gray.shade800,
    MihrColors.gray.shade700,
    28.5,
  );

  /// Gray 900→600, 45° — deep diagonal dark hero.
  static final LinearGradient dark900to600 = _gradient(
    MihrColors.gray.shade900,
    MihrColors.gray.shade600,
    45,
  );

  /// Gray 900→700, 45° — deep dark hero background.
  static final LinearGradient dark900to700 = _gradient(
    MihrColors.gray.shade900,
    MihrColors.gray.shade700,
    45,
  );

  /// Gray 50→white, 180° — subtle top-down surface tint.
  static final LinearGradient light50toWhite = _gradient(
    MihrColors.gray.shade50,
    MihrColors.white,
    180,
  );

  /// Gray 100→white, 180° — light top-down surface.
  static final LinearGradient light100toWhite = _gradient(
    MihrColors.gray.shade100,
    MihrColors.white,
    180,
  );

  /// Gray 100→25, 180° — very subtle surface differentiation.
  static final LinearGradient light100to25 = _gradient(
    MihrColors.gray.shade100,
    MihrColors.gray.shade25,
    180,
  );

  /// Gray 100→50, 180° — minimal surface gradient.
  static final LinearGradient light100to50 = _gradient(
    MihrColors.gray.shade100,
    MihrColors.gray.shade50,
    180,
  );

  /// Gray 200→50, 180° — medium light surface gradient.
  static final LinearGradient light200to50 = _gradient(
    MihrColors.gray.shade200,
    MihrColors.gray.shade50,
    180,
  );

  /// Gray 200→25, 180° — medium to near-white surface.
  static final LinearGradient light200to25 = _gradient(
    MihrColors.gray.shade200,
    MihrColors.gray.shade25,
    180,
  );

  /// Gray 200→100, 180° — gentle surface contrast.
  static final LinearGradient light200to100 = _gradient(
    MihrColors.gray.shade200,
    MihrColors.gray.shade100,
    180,
  );
}

// ---------------------------------------------------------------------------
// BRAND GRADIENTS
// ---------------------------------------------------------------------------

/// Brand-tinted gradients that follow the same pattern as gray gradients.
///
/// These use the active brand palette, so they automatically update
/// when the brand color changes.
class BrandGradients {
  BrandGradients._();

  /// Generates brand gradients from a custom [ColorScale].
  static List<LinearGradient> fromScale(ColorScale brand) {
    return [
      _gradient(brand.shade600, brand.shade500, 90),
      _gradient(brand.shade700, brand.shade600, 45),
      _gradient(brand.shade800, brand.shade600, 45),
      _gradient(brand.shade800, brand.shade600, 90),
      _gradient(brand.shade800, brand.shade700, 28.5),
      _gradient(brand.shade900, brand.shade600, 45),
      _gradient(brand.shade900, brand.shade700, 45),
    ];
  }

  /// Brand 600→500, 90° — subtle brand depth.
  static final LinearGradient dark600to500 = _gradient(
    MihrColors.brand.shade600,
    MihrColors.brand.shade500,
    90,
  );

  /// Brand 700→600, 45° — diagonal brand surface.
  static final LinearGradient dark700to600 = _gradient(
    MihrColors.brand.shade700,
    MihrColors.brand.shade600,
    45,
  );

  /// Brand 800→600, 45° — strong diagonal brand surface.
  static final LinearGradient dark800to600_45 = _gradient(
    MihrColors.brand.shade800,
    MihrColors.brand.shade600,
    45,
  );

  /// Brand 800→600, 90° — strong horizontal brand surface.
  static final LinearGradient dark800to600_90 = _gradient(
    MihrColors.brand.shade800,
    MihrColors.brand.shade600,
    90,
  );

  /// Brand 800→700, 28.5° — shallow-angle brand surface.
  static final LinearGradient dark800to700 = _gradient(
    MihrColors.brand.shade800,
    MihrColors.brand.shade700,
    28.5,
  );

  /// Brand 900→600, 45° — deep diagonal brand hero.
  static final LinearGradient dark900to600 = _gradient(
    MihrColors.brand.shade900,
    MihrColors.brand.shade600,
    45,
  );

  /// Brand 900→700, 45° — deep brand hero background.
  static final LinearGradient dark900to700 = _gradient(
    MihrColors.brand.shade900,
    MihrColors.brand.shade700,
    45,
  );
}

// ---------------------------------------------------------------------------
// LINEAR GRADIENTS (DECORATIVE)
// ---------------------------------------------------------------------------

/// 91 decorative linear gradients for marketing sections, illustrations,
/// hero backgrounds, and other creative elements.
///
/// Each gradient is defined with fixed hex colors and a CSS angle.
/// Numbered 01–91 matching the design reference.
class DecoGradients {
  DecoGradients._();

  /// Decorative gradient #01 — sky blue to peach.
  static final LinearGradient g01 = _gradient(
    const Color(0xFFA5C9E8),
    const Color(0xFFF8C5AC),
    180,
  );

  /// Decorative gradient #02 — blush to slate blue.
  static final LinearGradient g02 = _gradient(
    const Color(0xFFF8C2BB),
    const Color(0xFFA1BCD1),
    180,
  );

  /// Decorative gradient #03 — pink to peach cream.
  static final LinearGradient g03 = _gradient(
    const Color(0xFFFFD1FF),
    const Color(0xFFFADDC4),
    180,
  );

  /// Decorative gradient #04 — peach to tangerine.
  static final LinearGradient g04 = _gradient(
    const Color(0xFFFADDC4),
    const Color(0xFFFFAA6E),
    225,
  );

  /// Decorative gradient #05 — apricot to cream.
  static final LinearGradient g05 = _gradient(
    const Color(0xFFFCBE9F),
    const Color(0xFFFFECD2),
    270,
  );

  /// Decorative gradient #06 — lilac to lemon.
  static final LinearGradient g06 = _gradient(
    const Color(0xFFFECFFF),
    const Color(0xFFFFF88C),
    180,
  );

  /// Decorative gradient #07 — cream to blush.
  static final LinearGradient g07 = _gradient(
    const Color(0xFFFFFDE4),
    const Color(0xFFFFEAF6),
    45,
  );

  /// Decorative gradient #08 — lavender to pink.
  static final LinearGradient g08 = _gradient(
    const Color(0xFFE8DEE9),
    const Color(0xFFFDCAF1),
    180,
  );

  /// Decorative gradient #09 — periwinkle to rose.
  static final LinearGradient g09 = _gradient(
    const Color(0xFFA8CCFE),
    const Color(0xFFFEEAF8),
    45,
  );

  /// Decorative gradient #10 — mauve to terracotta.
  static final LinearGradient g10 = _gradient(
    const Color(0xFFCFC7F6),
    const Color(0xFFE8B6A7),
    0,
  );

  /// Decorative gradient #11 — olive to orchid.
  static final LinearGradient g11 = _gradient(
    const Color(0xFFCCCB80),
    const Color(0xFFD576EB),
    135,
  );

  /// Decorative gradient #12 — violet to salmon.
  static final LinearGradient g12 = _gradient(
    const Color(0xFF7B6AE0),
    const Color(0xFFF9BBB0),
    45,
  );

  /// Decorative gradient #13 — lavender to sky blue.
  static final LinearGradient g13 = _gradient(
    const Color(0xFFE0C3FC),
    const Color(0xFF8EC5FC),
    135,
  );

  /// Decorative gradient #14 — rose to mint.
  static final LinearGradient g14 = _gradient(
    const Color(0xFFFED6E3),
    const Color(0xFFA8EDEA),
    0,
  );

  /// Decorative gradient #15 — yellow to steel blue.
  static final LinearGradient g15 = _gradient(
    const Color(0xFFF9F77A),
    const Color(0xFFC3CFE2),
    135,
  );

  /// Decorative gradient #16 — taupe to ivory.
  static final LinearGradient g16 = _gradient(
    const Color(0xFFDFD1C5),
    const Color(0xFFFFF6EB),
    45,
  );

  /// Decorative gradient #17 — buttercup to blush.
  static final LinearGradient g17 = _gradient(
    const Color(0xFFFFF6B7),
    const Color(0xFFF6B5BA),
    135,
  );

  /// Decorative gradient #18 — lime cream to gold.
  static final LinearGradient g18 = _gradient(
    const Color(0xFFF7FEC7),
    const Color(0xFFFFED46),
    45,
  );

  /// Decorative gradient #19 — coral to mauve.
  static final LinearGradient g19 = _gradient(
    const Color(0xFFFEAFA8),
    const Color(0xFFF5E7EF),
    0,
  );

  /// Decorative gradient #20 — silver to cyan.
  static final LinearGradient g20 = _gradient(
    const Color(0xFFBFCDD9),
    const Color(0xFF9DEFFA),
    45,
  );

  /// Decorative gradient #21 — peach cream to sky.
  static final LinearGradient g21 = _gradient(
    const Color(0xFFFFF1EB),
    const Color(0xFFACE0F9),
    0,
  );

  /// Decorative gradient #22 — sage to mint.
  static final LinearGradient g22 = _gradient(
    const Color(0xFFC1CFC4),
    const Color(0xFFD8ECCD),
    0,
  );

  /// Decorative gradient #23 — cornflower to ice blue.
  static final LinearGradient g23 = _gradient(
    const Color(0xFFA9CAFD),
    const Color(0xFFC2E9FB),
    45,
  );

  /// Decorative gradient #24 — powder blue to frost.
  static final LinearGradient g24 = _gradient(
    const Color(0xFFAACBEE),
    const Color(0xFFE7F0FD),
    0,
  );

  /// Decorative gradient #25 — mint to sky blue.
  static final LinearGradient g25 = _gradient(
    const Color(0xFF84FAB0),
    const Color(0xFF8FD3F4),
    0,
  );

  /// Decorative gradient #26 — azure to lime green.
  static final LinearGradient g26 = _gradient(
    const Color(0xFF53A0FF),
    const Color(0xFF9FFF85),
    45,
  );

  /// Decorative gradient #27 — seafoam to lavender.
  static final LinearGradient g27 = _gradient(
    const Color(0xFF74EBC5),
    const Color(0xFF9FACE8),
    270,
  );

  /// Decorative gradient #28 — olive sage to ice.
  static final LinearGradient g28 = _gradient(
    const Color(0xFFA4B79A),
    const Color(0xFFC5ECF5),
    45,
  );

  /// Decorative gradient #29 — periwinkle to mint.
  static final LinearGradient g29 = _gradient(
    const Color(0xFF889DE3),
    const Color(0xFFB1F4CF),
    45,
  );

  /// Decorative gradient #30 — teal to salmon.
  static final LinearGradient g30 = _gradient(
    const Color(0xFF7CDADA),
    const Color(0xFFF6B7AA),
    45,
  );

  /// Decorative gradient #31 — neon mint to hot pink.
  static final LinearGradient g31 = _gradient(
    const Color(0xFF81FFB8),
    const Color(0xFFFFA0F7),
    45,
  );

  /// Decorative gradient #32 — spring green to gold.
  static final LinearGradient g32 = _gradient(
    const Color(0xFF9EFBC4),
    const Color(0xFFF8F58E),
    0,
  );

  /// Decorative gradient #33 — emerald to yellow.
  static final LinearGradient g33 = _gradient(
    const Color(0xFF43EF8E),
    const Color(0xFFFFEB3A),
    45,
  );

  /// Decorative gradient #34 — lime to sky blue.
  static final LinearGradient g34 = _gradient(
    const Color(0xFF0FFF00),
    const Color(0xFF58CFF8),
    135,
  );

  /// Decorative gradient #35 — ice blue to buttercream.
  static final LinearGradient g35 = _gradient(
    const Color(0xFFD1FDFF),
    const Color(0xFFFDDDB2),
    0,
  );

  /// Decorative gradient #36 — orchid to silver.
  static final LinearGradient g36 = _gradient(
    const Color(0xFFE8C0FD),
    const Color(0xFFD8DEDB),
    0,
  );

  /// Decorative gradient #37 — pink to periwinkle.
  static final LinearGradient g37 = _gradient(
    const Color(0xFFFFA4F6),
    const Color(0xFFB7D0FF),
    45,
  );

  /// Decorative gradient #38 — purple to ice.
  static final LinearGradient g38 = _gradient(
    const Color(0xFFCD6CF2),
    const Color(0xFFF1F3FF),
    0,
  );

  /// Decorative gradient #39 — pink to cyan.
  static final LinearGradient g39 = _gradient(
    const Color(0xFFF8C8F3),
    const Color(0xFF3ADDFA),
    315,
  );

  /// Decorative gradient #40 — lavender to sky.
  static final LinearGradient g40 = _gradient(
    const Color(0xFFE8DEE9),
    const Color(0xFF8DC2E8),
    0,
  );

  /// Decorative gradient #41 — cool gray to steel.
  static final LinearGradient g41 = _gradient(
    const Color(0xFFA4A9B6),
    const Color(0xFFBACBE0),
    0,
  );

  /// Decorative gradient #42 — teal gray to magenta.
  static final LinearGradient g42 = _gradient(
    const Color(0xFF9BB8B8),
    const Color(0xFFEA8AEA),
    45,
  );

  /// Decorative gradient #43 — bright purple to plum.
  static final LinearGradient g43 = _gradient(
    const Color(0xFFE280FF),
    const Color(0xFF9F44D3),
    135,
  );

  /// Decorative gradient #44 — lilac to indigo.
  static final LinearGradient g44 = _gradient(
    const Color(0xFFCE9FFC),
    const Color(0xFF7367F0),
    135,
  );

  /// Decorative gradient #45 — indigo to magenta.
  static final LinearGradient g45 = _gradient(
    const Color(0xFF726DF2),
    const Color(0xFFE151E5),
    135,
  );

  /// Decorative gradient #46 — lavender to slate.
  static final LinearGradient g46 = _gradient(
    const Color(0xFFA38DED),
    const Color(0xFF8991C7),
    0,
  );

  /// Decorative gradient #47 — rose to periwinkle.
  static final LinearGradient g47 = _gradient(
    const Color(0xFFF6C8D4),
    const Color(0xFF9795F0),
    0,
  );

  /// Decorative gradient #48 — muted lavender to steel.
  static final LinearGradient g48 = _gradient(
    const Color(0xFFA7A6CB),
    const Color(0xFF8989BA),
    0,
  );

  /// Decorative gradient #49 — orchid to turquoise.
  static final LinearGradient g49 = _gradient(
    const Color(0xFFD0AFD9),
    const Color(0xFF87D9E1),
    0,
  );

  /// Decorative gradient #50 — aqua to pink.
  static final LinearGradient g50 = _gradient(
    const Color(0xFF81FFEF),
    const Color(0xFFF087B4),
    135,
  );

  /// Decorative gradient #51 — lilac to slate purple.
  static final LinearGradient g51 = _gradient(
    const Color(0xFFDCB0ED),
    const Color(0xFF9999CC),
    135,
  );

  /// Decorative gradient #52 — cream to purple.
  static final LinearGradient g52 = _gradient(
    const Color(0xFFFFF5C3),
    const Color(0xFF9452A5),
    135,
  );

  /// Decorative gradient #53 — gold to violet.
  static final LinearGradient g53 = _gradient(
    const Color(0xFFF1CA74),
    const Color(0xFFA64DB6),
    135,
  );

  /// Decorative gradient #54 — royal blue to coral.
  static final LinearGradient g54 = _gradient(
    const Color(0xFF4D6AD0),
    const Color(0xFFFF907E),
    45,
  );

  /// Decorative gradient #55 — gold to cobalt.
  static final LinearGradient g55 = _gradient(
    const Color(0xFFFFCF71),
    const Color(0xFF2376DD),
    135,
  );

  /// Decorative gradient #56 — emerald to deep purple.
  static final LinearGradient g56 = _gradient(
    const Color(0xFF6BD07A),
    const Color(0xFF5312D6),
    135,
  );

  /// Decorative gradient #57 — sky blue to dusty rose.
  static final LinearGradient g57 = _gradient(
    const Color(0xFF6FD9FE),
    const Color(0xFFDF8985),
    180,
  );

  /// Decorative gradient #58 — hot pink to purple.
  static final LinearGradient g58 = _gradient(
    const Color(0xFFFA71CD),
    const Color(0xFFC471F5),
    0,
  );

  /// Decorative gradient #59 — cyan to deep purple.
  static final LinearGradient g59 = _gradient(
    const Color(0xFF43CBFF),
    const Color(0xFF9708CC),
    135,
  );

  /// Decorative gradient #60 — electric blue to violet.
  static final LinearGradient g60 = _gradient(
    const Color(0xFF7579FF),
    const Color(0xFF8224FF),
    180,
  );

  /// Decorative gradient #61 — purple to cyan.
  static final LinearGradient g61 = _gradient(
    const Color(0xFFAD00FE),
    const Color(0xFF00E0EE),
    45,
  );

  /// Decorative gradient #62 — aqua to cornflower.
  static final LinearGradient g62 = _gradient(
    const Color(0xFF86F7FE),
    const Color(0xFF66A8FF),
    135,
  );

  /// Decorative gradient #63 — blue to mint green.
  static final LinearGradient g63 = _gradient(
    const Color(0xFF0096FD),
    const Color(0xFF2AF598),
    0,
  );

  /// Decorative gradient #64 — amber to lemon.
  static final LinearGradient g64 = _gradient(
    const Color(0xFFFFB800),
    const Color(0xFFFFF500),
    45,
  );

  /// Decorative gradient #65 — salmon to chartreuse.
  static final LinearGradient g65 = _gradient(
    const Color(0xFFFFABA8),
    const Color(0xFFFCFF00),
    135,
  );

  /// Decorative gradient #66 — orange to gold.
  static final LinearGradient g66 = _gradient(
    const Color(0xFFFF7A00),
    const Color(0xFFFFD439),
    45,
  );

  /// Decorative gradient #67 — peach to rose.
  static final LinearGradient g67 = _gradient(
    const Color(0xFFFFD3A5),
    const Color(0xFFFD6585),
    135,
  );

  /// Decorative gradient #68 — gold to magenta.
  static final LinearGradient g68 = _gradient(
    const Color(0xFFF9D423),
    const Color(0xFFE14FAD),
    180,
  );

  /// Decorative gradient #69 — fuchsia to amber.
  static final LinearGradient g69 = _gradient(
    const Color(0xFFF74FAC),
    const Color(0xFFFCB24F),
    135,
  );

  /// Decorative gradient #70 — tangerine to red.
  static final LinearGradient g70 = _gradient(
    const Color(0xFFF49062),
    const Color(0xFFFD371F),
    135,
  );

  /// Decorative gradient #71 — coral to purple.
  static final LinearGradient g71 = _gradient(
    const Color(0xFFFF6C6C),
    const Color(0xFFDD78FF),
    45,
  );

  /// Decorative gradient #72 — rose to plum.
  static final LinearGradient g72 = _gradient(
    const Color(0xFFF077B4),
    const Color(0xFF923AA2),
    135,
  );

  /// Decorative gradient #73 — orchid to hot pink.
  static final LinearGradient g73 = _gradient(
    const Color(0xFFC589CF),
    const Color(0xFFEE609C),
    180,
  );

  /// Decorative gradient #74 — ice blue to magenta.
  static final LinearGradient g74 = _gradient(
    const Color(0xFFC7EAFD),
    const Color(0xFFE8198B),
    0,
  );

  /// Decorative gradient #75 — pink to watermelon.
  static final LinearGradient g75 = _gradient(
    const Color(0xFFF093FB),
    const Color(0xFFF5576C),
    135,
  );

  /// Decorative gradient #76 — aqua to lavender.
  static final LinearGradient g76 = _gradient(
    const Color(0xFF6CEEEC),
    const Color(0xFFD093CD),
    135,
  );

  /// Decorative gradient #77 — pink to indigo.
  static final LinearGradient g77 = _gradient(
    const Color(0xFFEE9AE5),
    const Color(0xFF5961F9),
    135,
  );

  /// Decorative gradient #78 — deep purple to blue.
  static final LinearGradient g78 = _gradient(
    const Color(0xFF6A11CB),
    const Color(0xFF2575FC),
    270,
  );

  /// Decorative gradient #79 — navy to azure.
  static final LinearGradient g79 = _gradient(
    const Color(0xFF0017E4),
    const Color(0xFF3793FF),
    45,
  );

  /// Decorative gradient #80 — cobalt to royal blue.
  static final LinearGradient g80 = _gradient(
    const Color(0xFF000BFB),
    const Color(0xFF005BEA),
    0,
  );

  /// Decorative gradient #81 — cornflower to cyan.
  static final LinearGradient g81 = _gradient(
    const Color(0xFF4B73FF),
    const Color(0xFF7CF7FF),
    45,
  );

  /// Decorative gradient #82 — mint to violet.
  static final LinearGradient g82 = _gradient(
    const Color(0xFF5EFCE8),
    const Color(0xFF736EFE),
    135,
  );

  /// Decorative gradient #83 — purple to blush.
  static final LinearGradient g83 = _gradient(
    const Color(0xFF7028E4),
    const Color(0xFFE5B2CA),
    0,
  );

  /// Decorative gradient #84 — indigo to slate.
  static final LinearGradient g84 = _gradient(
    const Color(0xFF7B73F5),
    const Color(0xFF6C77AB),
    90,
  );

  /// Decorative gradient #85 — electric purple to rose.
  static final LinearGradient g85 = _gradient(
    const Color(0xFF6018FF),
    const Color(0xFFE1467C),
    135,
  );

  /// Decorative gradient #86 — orchid to periwinkle.
  static final LinearGradient g86 = _gradient(
    const Color(0xFFD079EE),
    const Color(0xFF8A88FB),
    45,
  );

  /// Decorative gradient #87 — lavender to deep purple.
  static final LinearGradient g87 = _gradient(
    const Color(0xFFC09FFF),
    const Color(0xFF981ED2),
    135,
  );

  /// Decorative gradient #88 — purple to steel blue.
  static final LinearGradient g88 = _gradient(
    const Color(0xFF9823EA),
    const Color(0xFF5F728D),
    0,
  );

  /// Decorative gradient #89 — vivid purple to deep violet.
  static final LinearGradient g89 = _gradient(
    const Color(0xFFB50FFF),
    const Color(0xFF6A1ED2),
    135,
  );

  /// Decorative gradient #90 — dark purple to magenta.
  static final LinearGradient g90 = _gradient(
    const Color(0xFF4300B1),
    const Color(0xFFA531DC),
    45,
  );

  /// Decorative gradient #91 — plum to periwinkle.
  static final LinearGradient g91 = _gradient(
    const Color(0xFF7048A2),
    const Color(0xFF6867EA),
    215,
  );

  /// All 91 decorative gradients in order.
  static final List<LinearGradient> all = [
    g01,
    g02,
    g03,
    g04,
    g05,
    g06,
    g07,
    g08,
    g09,
    g10,
    g11,
    g12,
    g13,
    g14,
    g15,
    g16,
    g17,
    g18,
    g19,
    g20,
    g21,
    g22,
    g23,
    g24,
    g25,
    g26,
    g27,
    g28,
    g29,
    g30,
    g31,
    g32,
    g33,
    g34,
    g35,
    g36,
    g37,
    g38,
    g39,
    g40,
    g41,
    g42,
    g43,
    g44,
    g45,
    g46,
    g47,
    g48,
    g49,
    g50,
    g51,
    g52,
    g53,
    g54,
    g55,
    g56,
    g57,
    g58,
    g59,
    g60,
    g61,
    g62,
    g63,
    g64,
    g65,
    g66,
    g67,
    g68,
    g69,
    g70,
    g71,
    g72,
    g73,
    g74,
    g75,
    g76,
    g77,
    g78,
    g79,
    g80,
    g81,
    g82,
    g83,
    g84,
    g85,
    g86,
    g87,
    g88,
    g89,
    g90,
    g91,
  ];
}
