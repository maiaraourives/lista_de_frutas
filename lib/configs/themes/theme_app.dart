import 'package:flutter/material.dart';

class ThemeApp {
  static final ligthTheme = ThemeData(
    primaryColor: const Color(0xFFE7A500),
    splashColor: const Color(0xFFE7A500),
    scaffoldBackgroundColor: Colors.white,
    primaryColorLight: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE7A500),
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
        size: 24,
      ),
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Colors.grey[300],
      onPrimary: Colors.grey[200],
      onSecondary: Colors.grey[50],
      primaryContainer: Colors.grey[600],
      secondary: const Color(0xFFE7A500),
      brightness: Brightness.light,
      surface: Colors.white,
      onSurface: Colors.grey,
      error: Colors.yellow[800],
      errorContainer: Colors.red,
      background: Colors.white,
    ),
    dividerTheme: DividerThemeData(
      thickness: 2,
      color: Colors.grey[400],
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: TextStyle(
        color: Colors.grey[600],
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Colors.grey[600],
      selectionColor: const Color(0xFFE7A500),
      selectionHandleColor: const Color(0xFFE7A500),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: textFieldBorder,
      errorBorder: textFieldBorder,
      enabledBorder: textFieldBorder,
      focusedBorder: textFieldBorder,
      disabledBorder: textFieldBorder,
      focusedErrorBorder: textFieldBorder,
      fillColor: Colors.grey.shade300,
      errorStyle: const TextStyle(
        color: Colors.red,
        fontSize: 14,
      ),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w800,
        color: Colors.grey[600],
        fontSize: 16,
      ),
      hintStyle: TextStyle(
        color: Colors.grey[600],
        fontSize: 16,
      ),
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        color: Colors.grey[600],
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        color: Colors.grey[600],
        fontWeight: FontWeight.w800,
      ),
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: Color(0xFF323232),
    ),
  );

  static OutlineInputBorder textFieldBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: Color.fromRGBO(230, 230, 230, 1)),
    borderRadius: BorderRadius.circular(10),
  );

  static OutlineInputBorder textFieldBorderSecondary = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: Color.fromRGBO(230, 230, 230, 1)),
    borderRadius: BorderRadius.circular(10),
  );

  static final labelMediumSecondary = TextStyle(
    color: Colors.grey[600],
    fontSize: 16,
  );

  static const errorStyleSecondary = TextStyle(
    color: Colors.red,
    fontSize: 14,
  );
}
