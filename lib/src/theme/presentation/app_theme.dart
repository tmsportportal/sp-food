import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  const AppTheme._();

  static get lightTheme {
    final textTheme =
        GoogleFonts.geologicaTextTheme(ThemeData.light().textTheme);

    return ThemeData(
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: const Color(0xFFF4FBFF),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFBCCEFF),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: textTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF0088FF),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F1A42),
          foregroundColor: const Color(0xFFFFFFFF),
          textStyle: textTheme.bodyMedium?.copyWith(fontSize: 17.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: textTheme.bodyMedium?.copyWith(fontSize: 17.0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            ),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedLabelStyle: textTheme.bodySmall,
        unselectedLabelStyle: textTheme.bodySmall,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        labelStyle:
            textTheme.bodySmall?.copyWith(fontSize: 13.0, color: Colors.grey),
        // filled: true,
        fillColor: const Color(0xFFFFFFFF),
        prefixIconColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused)
              ? const Color(0xFF0088FF)
              : Colors.grey,
        ),
        suffixIconColor: MaterialStateColor.resolveWith(
          (states) => states.contains(MaterialState.focused)
              ? const Color(0xFF0088FF)
              : Colors.grey,
        ),
        prefixStyle: const TextStyle(
          fontSize: 13.0,
          color: Colors.grey,
        ),
        hintStyle: const TextStyle(
          fontSize: 13.0,
          color: Colors.grey,
        ),
        border: const OutlineInputBorder(),
      ),
      cardColor: const Color(0xFF5989DA),
      colorScheme: const ColorScheme.light(
        brightness: Brightness.light,
        primary: Color(0xFF0088FF),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFFDDE2FF),
        onPrimaryContainer: Color(0xFF0F1A42),
        secondary: Color(0xFF5B5B71),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFB7DFFF),
        onSecondaryContainer: Color(0xFF1D192B),
        tertiary: Color(0xFFEEEBEE),
        onTertiary: Color(0xFF491E4B),
        tertiaryContainer: Color(0xFFD8DEFF),
        onTertiaryContainer: Color(0xFF31111D),
        error: Color(0xFFB3261E),
        onError: Color(0xFFFFFFFF),
        errorContainer: Color(0xFFF9DEDC),
        onErrorContainer: Color(0xFF410E0B),
        // background: Color(0xFFE3E9F2),
        background: Color(0xFFF4FBFF),

        onBackground: Color(0xFF1C1B1F),
        // color of an appbar, card etc
        surface: Color(0xFFF2F6FD),
        onSurface: Color(0xFF1C1B1F),
        surfaceVariant: Color(0xFFCCD7FC),
        onSurfaceVariant: Color(0xFF45464F),
        outline: Color(0xFF89A4FF),
        outlineVariant: Color(0xFFCAC4D0),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: Color(0xFF313033),
        onInverseSurface: Color(0xFFF4EFF4),
        inversePrimary: Color(0xFFBCCCFF),
        // The surfaceTint color is set to the same color as the primary.
        surfaceTint: Color(0xFF0088FF),
      ),
    );
  }

  static get darkTheme {
    final textTheme =
        GoogleFonts.geologicaTextTheme(ThemeData.dark().textTheme);

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF2E2E31),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 1.0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xFFBCCEFF),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      textTheme: textTheme,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF0088FF),
        foregroundColor: Color(0xFFFFFFFF),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: textTheme.bodySmall,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          borderSide: BorderSide(width: 3),
        ),
        prefixIconColor: const Color(0xFF0088FF),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0F1A42),
          foregroundColor: const Color(0xFFFFFFFF),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
        ),
      ),
      cardColor: const Color(0xFF2D2D2F),
      colorScheme: const ColorScheme.dark(
        brightness: Brightness.dark,
        primary: Color(0xFF0088FF),
        onPrimary: Color(0xFF1E2472),
        primaryContainer: Color(0xFF373F8B),
        onPrimaryContainer: Color(0xFFDEDDFF),
        secondary: Color(0xFFC4C2DC),
        onSecondary: Color(0xFF2D3041),
        secondaryContainer: Color(0xFF1E2472),
        onSecondaryContainer: Color(0xFFDEDEF8),
        tertiary: Color(0xFFEFB8C8),
        onTertiary: Color(0xFF492532),
        tertiaryContainer: Color(0xFF633B48),
        onTertiaryContainer: Color(0xFFFFD8E4),
        error: Color(0xFFF2B8B5),
        onError: Color(0xFF601410),
        errorContainer: Color(0xFF8C1D18),
        onErrorContainer: Color(0xFFF9DEDC),
        background: Color(0xFF1C1B1F),
        onBackground: Color(0xFFE6E1E5),
        surface: Color(0xFF383535),
        onSurface: Color(0xFFE6E1E5),
        surfaceVariant: Color(0xFF49454F),
        onSurfaceVariant: Color(0xFFCAC4D0),
        outline: Color(0xFF938F99),
        outlineVariant: Color(0xFF49454F),
        shadow: Color(0xFF000000),
        scrim: Color(0xFF000000),
        inverseSurface: Color(0xFFE6E1E5),
        onInverseSurface: Color(0xFF313033),
        inversePrimary: Color(0xFF6750A4),
        // The surfaceTint color is set to the same color as the primary.
        surfaceTint: Color(0xFFD0BCFF),
      ),
    );
  }
}
