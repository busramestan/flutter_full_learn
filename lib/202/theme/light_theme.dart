import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
        appBarTheme:  AppBarTheme(
          color: _lightColor.purpleVanity,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
        ),
        scaffoldBackgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: _lightColor.purpleVanity),
        buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.light(onPrimary: Colors.purple, onSecondary: _lightColor.purpleVanity)),
        colorScheme: const ColorScheme.light(),
        checkboxTheme: CheckboxThemeData(
            side: BorderSide(color: Colors.green), fillColor: MaterialStateProperty.all(Colors.black)),
        textTheme:
            ThemeData.light().textTheme.copyWith(bodyMedium: TextStyle(fontSize: 17, color: _lightColor._mainColor)));
  }
}

class _LightColor {
  final Color _mainColor = Colors.black87;
  final Color _textColor = const Color.fromARGB(255, 216, 142, 142);
  final Color purpleVanity = const Color.fromARGB(255, 164, 55, 207);
}
