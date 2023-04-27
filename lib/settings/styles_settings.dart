import 'package:flutter/material.dart';

class MyThemes {
  static final lightTheme = ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      fontFamily: "PopPins",
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF1F1A1D)),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF933E82)),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFD21D35)),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFD21D35)),
            borderRadius: BorderRadius.circular(20)),
        hintStyle: const TextStyle(color: Color(0xFF1F1A1D)),
        labelStyle: const TextStyle(
          color: Color(0xFF1F1A1D),
        ),
      ),
      textTheme: TextTheme(displayLarge: TextStyle(color: Colors.amber)));

  static final darkTheme = ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
      fontFamily: "PopPins",
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFEAE0E3)),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFFACE8)),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFFB4AB)),
            borderRadius: BorderRadius.circular(20)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFFFB4AB)),
            borderRadius: BorderRadius.circular(20)),
        hintStyle: const TextStyle(color: Color(0xFFEAE0E3)),
        labelStyle: const TextStyle(
          color: Color(0xFFEAE0E3),
        ),
      ),
      textTheme: TextTheme(displayLarge: TextStyle(color: Colors.amber)));
}

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF933E82),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFD7F0),
  onPrimaryContainer: Color(0xFF3A0032),
  secondary: Color(0xFF6F5767),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFF9DAEC),
  onSecondaryContainer: Color(0xFF281623),
  tertiary: Color(0xFF815341),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFDBCE),
  onTertiaryContainer: Color(0xFF321205),
  error: Color(0xFFD21D35),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1F1A1D),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1F1A1D),
  surfaceVariant: Color(0xFFEFDEE6),
  onSurfaceVariant: Color(0xFF4F444A),
  outline: Color(0xFF80737B),
  onInverseSurface: Color(0xFFF8EEF1),
  inverseSurface: Color(0xFF342F32),
  inversePrimary: Color(0xFFFFACE8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF933E82),
  outlineVariant: Color(0xFFD2C2CA),
  scrim: Color(0xFF000000),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFACE8),
  onPrimary: Color(0xFF5B0750),
  primaryContainer: Color(0xFF772569),
  onPrimaryContainer: Color(0xFFFFD7F0),
  secondary: Color(0xFFDCBED0),
  onSecondary: Color(0xFF3E2A38),
  secondaryContainer: Color(0xFF56404F),
  onSecondaryContainer: Color(0xFFF9DAEC),
  tertiary: Color(0xFFF5B9A2),
  onTertiary: Color(0xFF4B2617),
  tertiaryContainer: Color(0xFF663C2B),
  onTertiaryContainer: Color(0xFFFFDBCE),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1F1A1D),
  onBackground: Color(0xFFEAE0E3),
  surface: Color(0xFF1F1A1D),
  onSurface: Color(0xFFEAE0E3),
  surfaceVariant: Color(0xFF4F444A),
  onSurfaceVariant: Color(0xFFD2C2CA),
  outline: Color(0xFF9B8D94),
  onInverseSurface: Color(0xFF1F1A1D),
  inverseSurface: Color(0xFFEAE0E3),
  inversePrimary: Color(0xFF933E82),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFACE8),
  outlineVariant: Color(0xFF4F444A),
  scrim: Color(0xFF000000),
);
