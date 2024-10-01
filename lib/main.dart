import 'package:click_teste2/controller/messages_controller.dart';
import 'package:click_teste2/controller/speech_to_text_controller.dart';
import 'package:click_teste2/pages/chat/audio_page.dart';
import 'package:click_teste2/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => SpeechToTextController(),
          ),
          ChangeNotifierProvider(create: (context) => MessageController()),
        ],
        child: const MyApp(), // Wrap your app
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const HomePage(),
      routes: {
        HomePage.routeName: (context) => const HomePage(),
        AudioPage.routeName: (context) => const AudioPage()
      },
      theme:
          ThemeData.dark().copyWith(primaryColor: Colors.purpleAccent.shade700),
    );
  }
}
