import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ListenService {
  final SpeechToText _speechToText = SpeechToText();
  void Function(String)? onStatus;
  void Function(SpeechRecognitionResult)? onResult;

  ListenService({this.onStatus, this.onResult});

  void startListening() async {
    await _speechToText.cancel();
    await _speechToText.listen(
      listenFor: const Duration(seconds: 6),
      onResult: onResult,
      localeId: "pt_BR",
    ); // A função listen espera receber uma callback para quando tiver o resultado da fala do plugin
  }

  Future<bool> init() async {
    await _speechToText.cancel();
    final enableToSpeech = await _speechToText.initialize(onStatus: onStatus);
    return enableToSpeech;
  }

  void stopListening() async {
    await _speechToText.stop();

    print("Parou de ouvir");
  }
}
