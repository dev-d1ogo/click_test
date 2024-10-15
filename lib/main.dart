import 'package:click_teste2/pages/chat/audio_page.dart';
import 'package:click_teste2/pages/home/home_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );

final RouteObserver routeObserver = RouteObserver();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const HomePage(),
      navigatorObservers: [routeObserver],
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        AudioPage.routeName: (context) => const AudioPage()
      },
      theme:
          ThemeData.dark().copyWith(primaryColor: Colors.purpleAccent.shade700),
    );
  }
}
