import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      // Clean primary blue for actions and headers
      primary: Color(0xff2563EB), // Bright blue
      surfaceTint: Color(0xff2563EB),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffDBEAFE),
      onPrimaryContainer: Color(0xff1E40AF),

      // Success green for positive amounts/income
      secondary: Color(0xff10B981), // Emerald green
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffD1FAE5),
      onSecondaryContainer: Color(0xff065F46),

      // Warning/expense color - softer red
      tertiary: Color(0xffEF4444), // Red for expenses
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffFEE2E2),
      onTertiaryContainer: Color(0xff991B1B),

      // Error states
      error: Color(0xffDC2626),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffFEE2E2),
      onErrorContainer: Color(0xff7F1D1D),

      // Clean backgrounds with better hierarchy
      surface: Color(0xffffffff),
      onSurface: Color(0xff111827), // Dark gray for text
      onSurfaceVariant: Color(0xff6B7280), // Medium gray for secondary text
      outline: Color(0xffE5E7EB), // Light gray for borders
      outlineVariant: Color(0xffF3F4F6),
      shadow: Color(0x1A000000), // Softer shadows
      scrim: Color(0x4D000000),
      inverseSurface: Color(0xff1F2937),
      inversePrimary: Color(0xff60A5FA),

      // Card and container colors
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffF9FAFB),
      surfaceContainer: Color(0xffF3F4F6),
      surfaceContainerHigh: Color(0xffE5E7EB),
      surfaceContainerHighest: Color(0xffD1D5DB),
    );
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      // Brighter primary for better visibility
      primary: Color(0xff60A5FA), // Light blue
      surfaceTint: Color(0xff60A5FA),
      onPrimary: Color(0xff1E293B),
      primaryContainer: Color(0xff1E40AF),
      onPrimaryContainer: Color(0xffDBEAFE),

      // Income/positive amounts - bright green
      secondary: Color(0xff34D399), // Bright emerald
      onSecondary: Color(0xff064E3B),
      secondaryContainer: Color(0xff065F46),
      onSecondaryContainer: Color(0xffA7F3D0),

      // Expense amounts - softer red/orange
      tertiary: Color(0xffF87171), // Light red
      onTertiary: Color(0xff7F1D1D),
      tertiaryContainer: Color(0xff991B1B),
      onTertiaryContainer: Color(0xffFECACA),

      // Error states
      error: Color(0xffF87171),
      onError: Color(0xff450A0A),
      errorContainer: Color(0xff991B1B),
      onErrorContainer: Color(0xffFEE2E2),

      // Better dark mode surfaces with proper elevation
      surface: Color(0xff0F172A), // Very dark blue-gray
      onSurface: Color(0xffF1F5F9), // Light gray text
      onSurfaceVariant: Color(0xff94A3B8), // Medium gray for secondary
      outline: Color(0xff334155), // Border color
      outlineVariant: Color(0xff1E293B),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffE2E8F0),
      inversePrimary: Color(0xff2563EB),

      // Dark mode containers with better hierarchy
      surfaceContainerLowest: Color(0xff0F172A),
      surfaceContainerLow: Color(0xff1E293B),
      surfaceContainer: Color(0xff334155),
      surfaceContainerHigh: Color(0xff475569),
      surfaceContainerHighest: Color(0xff64748B),
    );
  }

  // Additional semantic colors for expenses
  static const Color incomeColor = Color(0xff10B981);
  static const Color expenseColor = Color(0xffEF4444);
  static const Color pendingColor = Color(0xffF59E0B);
  static const Color successColor = Color(0xff10B981);

  // Dark mode variants
  static const Color incomeColorDark = Color(0xff34D399);
  static const Color expenseColorDark = Color(0xffF87171);
  static const Color pendingColorDark = Color(0xffFBBF24);
  static const Color successColorDark = Color(0xff34D399);

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,

    // Card styling
    cardTheme: CardTheme(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color:
          colorScheme.brightness == Brightness.light
              ? colorScheme.surface
              : colorScheme.surfaceContainerLow,
    ),

    // Input decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colorScheme.surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.outline),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.primary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: colorScheme.error),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),

    // Elevated button styling
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),

    // FAB styling
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),

    // AppBar styling
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colorScheme.onSurface,
      ),
    ),

    // Dialog styling
    dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
    ),
  );
}
