import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_app/theme.dart';

import 'main_page.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initGlobalProviders();

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) => MaterialApp(
        theme: ref.watch(theme),
        darkTheme: ref.watch(darkTheme),
        themeMode: ref.watch(themeMode).state,
        home: const MainPage(),
      ),
    );
  }
}
