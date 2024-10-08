import 'package:flutter_tts/flutter_tts.dart';

class SpeakService {
  final FlutterTts flutterTts = FlutterTts();
  final Function onSpeechComplete;
  final Function onSpeechStart;

  SpeakService({required this.onSpeechComplete, required this.onSpeechStart}) {
    _init();
  }

  speak(String text) async {
    onSpeechStart();
    await flutterTts.speak(text);
  }

  Future<void> _init() async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(0.8);
    await flutterTts.setVolume(1);

    flutterTts.setCompletionHandler(() {
      onSpeechComplete();
    });
  }

  stop() async {
    await flutterTts.stop();
  }
}
