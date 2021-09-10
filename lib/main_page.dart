import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/theme.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bettercoding.dev – theming'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Text(
              'Welcome!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(height: 16),
            Text(
              'This is a tutorial about theming.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline2,
            ),
            const Spacer(),
            Image(
              image: Theme.of(context).imageForName('logo.png'),
              height: Theme.of(context).custom.imageSize,
            ),
            const Spacer(),
            Consumer(
              builder: (context, ref, _) {
                return ElevatedButton(
                  child: const Text('Click me!'),
                  onPressed: () {
                    final state = ref.read(themeMode).state;
                    ref.read(themeMode).state = state == ThemeMode.light
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
