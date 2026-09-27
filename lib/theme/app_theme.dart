import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Colors that change between the light and dark themes.
class AppPalette {
  final Brightness brightness;
  final Color bgDark;
  final Color bgCard;
  final Color bgCardLight;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color primaryLight;
  final Color accent;
  final Color accentYellow;

  const AppPalette({
    required this.brightness,
    required this.bgDark,
    required this.bgCard,
    required this.bgCardLight,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.primaryLight,
    required this.accent,
    required this.accentYellow,
  });

  static const dark = AppPalette(
    brightness: Brightness.dark,
    bgDark: Color(0xFF0F0F1A),
    bgCard: Color(0xFF1A1A2E),
    bgCardLight: Color(0xFF252540),
    textPrimary: Color(0xFFFFFFFF),
    textSecondary: Color(0xFFB0B0CC),
    textMuted: Color(0xFF6B6B8A),
    primaryLight: Color(0xFF9C94FF),
    accent: Color(0xFF00D4AA),
    accentYellow: Color(0xFFFFD166),
  );

  /// High-contrast variant for bright environments (e.g. training outdoors):
  /// accents are darkened so they stay readable as text on white.
  static const light = AppPalette(
    brightness: Brightness.light,
    bgDark: Color(0xFFF3F4F9),
    bgCard: Color(0xFFFFFFFF),
    bgCardLight: Color(0xFFE4E5F0),
    textPrimary: Color(0xFF15152B),
    textSecondary: Color(0xFF45455F),
    textMuted: Color(0xFF6E6E8A),
    primaryLight: Color(0xFF5048D8),
    accent: Color(0xFF00957A),
    accentYellow: Color(0xFFB07314),
  );
}

class AppColors {
  static AppPalette _palette = AppPalette.dark;

  static AppPalette get palette => _palette;
  static Brightness get brightness => _palette.brightness;

  /// Switches every theme-dependent color. Callers must rebuild the widget
  /// tree afterwards (see LiftWaveApp).
  static void usePalette(AppPalette palette) => _palette = palette;

  // Primary
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryDark = Color(0xFF4A42D6);
  static Color get primaryLight => _palette.primaryLight;

  // Accent
  static Color get accent => _palette.accent;
  static const Color accentOrange = Color(0xFFFF6B35);
  static Color get accentYellow => _palette.accentYellow;

  // Background
  static Color get bgDark => _palette.bgDark;
  static Color get bgCard => _palette.bgCard;
  static Color get bgCardLight => _palette.bgCardLight;

  // Text
  static Color get textPrimary => _palette.textPrimary;
  static Color get textSecondary => _palette.textSecondary;
  static Color get textMuted => _palette.textMuted;

  // Status
  static Color get success => _palette.accent;
  static const Color routineCompleted = Color(0xFF5E9B75);
  static Color get warning => _palette.accentYellow;
  static const Color error = Color(0xFFFF6B6B);

  // Muscle groups
  static const Color chest = Color(0xFFFF6B35);
  static const Color back = Color(0xFF6C63FF);
  static const Color legs = Color(0xFF00D4AA);
  static const Color shoulders = Color(0xFFFFD166);
  static const Color arms = Color(0xFFFF6B6B);
  static const Color core = Color(0xFF4ECDC4);
  static const Color crossfit = Color(0xFFE63946);
}

class AppTheme {
  /// Theme for the palette currently selected in [AppColors].
  static ThemeData get current {
    final isDark = AppColors.brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: AppColors.brightness,
      scaffoldBackgroundColor: AppColors.bgDark,
      colorScheme: isDark
          ? ColorScheme.dark(
              primary: AppColors.primary,
              secondary: AppColors.accent,
              surface: AppColors.bgCard,
              onSurface: AppColors.textPrimary,
              error: AppColors.error,
            )
          : ColorScheme.light(
              primary: AppColors.primary,
              secondary: AppColors.accent,
              surface: AppColors.bgCard,
              onSurface: AppColors.textPrimary,
              error: AppColors.error,
            ),
      textTheme: GoogleFonts.interTextTheme(
        TextTheme(
          displayLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 32,
            fontWeight: FontWeight.w800,
            letterSpacing: -1,
          ),
          displayMedium: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
          ),
          headlineLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
          headlineMedium: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          headlineSmall: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          titleLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          titleMedium: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: TextStyle(
            color: AppColors.textMuted,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgDark,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.bgCard,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.bgCard,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.bgCard,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.bgCardLight, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
        ),
        hintStyle: TextStyle(color: AppColors.textMuted),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: AppColors.bgCard,
        selectedColor: AppColors.primary.withValues(alpha: 0.2),
        labelStyle: TextStyle(color: AppColors.textSecondary, fontSize: 13),
        side: BorderSide(color: AppColors.bgCardLight),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.bgCardLight,
        thickness: 1,
      ),
    );
  }
}
