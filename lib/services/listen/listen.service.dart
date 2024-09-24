import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ListenService {
  final SpeechToText _speechToText = SpeechToText();
  void Function(String)? onStatus;
  void Function(SpeechRecognitionResult)? onResult;

  ListenService({this.onStatus, this.onResult});

  void startListening() async {
    await _speechToText.listen(
      listenFor: const Duration(seconds: 6),
      onResult: onResult,
      localeId: "pt_BR",
    ); // A função listen espera receber uma callback para quando tiver o resultado da fala do plugin

    print("Começou a  ouvir ${_speechToText.isListening}");
  }

  void init() async {
    await _speechToText.initialize(
        onStatus: onStatus); //Retorna um boolean quando finalizar
  }

  void stopListening() async {
    await _speechToText.stop();

    print("Parou de ouvir");
  }
}
