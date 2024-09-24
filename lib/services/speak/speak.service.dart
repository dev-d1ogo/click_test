import 'package:flutter_tts/flutter_tts.dart';

class SpeakService {
  final FlutterTts flutterTts = FlutterTts();

  speak(String text) async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(0.8);
    await flutterTts.setVolume(1);
    await flutterTts.speak(text);
  }
}
