/*
https://github.com/bettercoding-dev/flutter-themes/tree/persist_theme
https://bettercoding.dev/flutter/tutorial-themes-riverpod/#theme_switching_changing_the_theme_within_the_app

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final Provider<SharedPreferences> sharedPreferences;

Future<void> initGlobalProviders() async {
  final sharedPreferencesInstance = await SharedPreferences.getInstance();
  sharedPreferences = Provider((_) => sharedPreferencesInstance);
}
*/