import 'package:click_teste2/controller/audio_base_controller.dart';
import 'package:click_teste2/services/api/call_boot.dart';
import 'package:click_teste2/services/listen/listen.service.dart';
import 'package:click_teste2/services/speak/speak.service.dart';
import 'package:click_teste2/types/api_response.dart';
import 'package:click_teste2/types/message_type.dart';

class HomeController extends BaseController {
  static HomeController? _controller;

  List<MessageType> messageList = [];

  late ListenService _serviceListen;
  final _serviceSpeak = SpeakService();

  HomeController._();

  factory HomeController() {
    _controller ??= HomeController._();
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
        notifyListeners();
      },
    );
    _serviceListen.init();
  }

  speak(String text) => _serviceSpeak.speak(text);

  void startListening() {
    _serviceListen.startListening();
    isListening = true;
  }

  void stopListening() => _serviceListen.stopListening();

  void initListeningWithLongPress() {
    initListner();
  }

  void addItem(MessageType item) {
    messageList.add(item);
    notifyListeners();
  }
}
