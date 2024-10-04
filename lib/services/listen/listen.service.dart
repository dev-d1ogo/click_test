import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ListenService {
  final SpeechToText _speechToText = SpeechToText();
  void Function(String)? onStatus;
  void Function(void)? onError;
  void Function(SpeechRecognitionResult)? onResult;

  ListenService({this.onStatus, this.onResult, this.onError});

  Future<bool> startListening(void Function(String)? onStatus) async {
    await _speechToText.cancel();

    final enableToSpeech =
        await _speechToText.initialize(onStatus: onStatus, onError: onError);

    await _speechToText.listen(
      listenFor: const Duration(seconds: 6),
      onResult: onResult,
      localeId: "pt_BR",
    );

    return enableToSpeech;
  }

  void cancelListening() async {
    await _speechToText.cancel();
  }

  // Future<bool> init() async {
  //   final enableToSpeech = await _speechToText.initialize(onStatus: onStatus);
  //   return enableToSpeech;
  // }

  void stopListening() async {
    await _speechToText.stop();
  }
}
