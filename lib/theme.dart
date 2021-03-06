import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theming/preferences.dart';

// THEME PROVIDERS
final theme = Provider((ref) => _theme);
final darkTheme = Provider((ref) => _darkTheme);
final themeMode = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(preferences: ref.watch(preferences)),
);

// THEMES
final _theme = ThemeData(
  primaryColor: Colors.deepPurple,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: Colors.deepPurple,
      shape: StadiumBorder(),
    ),
  ),
  textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      headline2: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      )),
);

final _customTheme = CustomThemeData(
  imageSize: 150,
);

final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.deepPurple,
  elevatedButtonTheme: _theme.elevatedButtonTheme,
  textTheme: _theme.textTheme.apply(
    displayColor: Colors.white,
    bodyColor: Colors.white,
  ),
);

final _customDarkTheme = CustomThemeData();

// EXTENSIONS AND CLASSES
extension CustomTheme on ThemeData {
  AssetImage imageForName(String name) {
    final path = brightness == Brightness.dark ? 'assets/dark' : 'assets/';
    return AssetImage('$path/$name');
  }

  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customTheme;
}

class CustomThemeData {
  final double imageSize;

  CustomThemeData({
    this.imageSize = 100,
  });
}

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Preferences preferences;

  ThemeModeNotifier({required this.preferences}) : super(preferences.themeMode);

  void toggle() {
    if (state == ThemeMode.dark) {
      preferences.persistThemeMode(ThemeMode.light);
      state = ThemeMode.light;
    } else {
      preferences.persistThemeMode(ThemeMode.dark);
      state = ThemeMode.dark;
    }
  }
}
