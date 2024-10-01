import 'package:click_teste2/controller/audio_base_controller.dart';
import 'package:click_teste2/services/api/call_boot.dart';
import 'package:click_teste2/services/listen/listen.service.dart';
import 'package:click_teste2/services/speak/speak.service.dart';
import 'package:click_teste2/types/api_response.dart';

class AudioPageController extends BaseController {
  static AudioPageController? _controller;

  late ListenService _serviceListen;
  final _serviceSpeak = SpeakService();

  late final String actualStatus;

  AudioPageController._();

  factory AudioPageController() {
    _controller ??= AudioPageController._();
    return _controller!;
  }

  void _onSpeechResult(result) async {
    changeText(result.recognizedWords);
  }

  Future<ApiResponse> callApi(String text) async {
    ApiResponse data = await callBot(text);
    _serviceSpeak.speak(data.response);
    return data;
  }

  void initListner() {
    _serviceListen = ListenService(
      onResult: _onSpeechResult,
      onStatus: (status) {
        isListening = status == "listening";
        actualStatus = status;
        notifyListeners();
      },
    );
  }

  void speak(String text) => _serviceSpeak.speak(text);

  void startListening() {
    _serviceListen.startListening();
  }

  void stopListening() => _serviceListen.stopListening();

  void initListeningWithLongPress() {
    initListner();
  }

  void onPlay() {
    togglePausedStatus();
    startListening();
  }

  void onPause() {
    togglePausedStatus();
    stopListening();
  }

  void togglePausedStatus() {
    isPaused = !isPaused;
    notifyListeners();
  }
}
