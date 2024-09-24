import 'package:click_teste2/services/api/call_boot.dart';
import 'package:click_teste2/services/listen/listen.service.dart';
import 'package:click_teste2/services/speak/speak.service.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

import '../../types/api_response.dart';
// import 'package:flutter_tts/flutter_tts.dart';

class HomeController extends ChangeNotifier {
  static HomeController? _controller;

  String text = '';
  bool isListening = false;
  List<MessageType> messageList = [];
  bool enableToSpeech = false;

  late ListenService _serviceListen;
  final _serviceSpeak = SpeakService();

  void _onSpeechResult(result) async {
    print(result);
    changeText(result.recognizedWords);
  }

  Future<ApiResponse> callApi(String text) async {
    ApiResponse data = await callBot(text);

    _serviceSpeak.speak(data.response);

    return data;
  }
  // Funcao para parar o ouvinte

  HomeController._();

  factory HomeController() {
    _controller ??= HomeController._();
    return _controller!;
  }

  initListner() {
    _serviceListen = ListenService(
      onResult: _onSpeechResult,
      onStatus: (status) {
        isListening = status == "listening";
        notifyListeners();
      },
    );
    _serviceListen.init();
  }

  speak(text) => _serviceSpeak.speak(text);

  startListening() => _serviceListen.startListening();
  stopListening() => _serviceListen.stopListening();

  addItem(MessageType item) {
    messageList.add(item);
    notifyListeners();
  }

  resetText() {
    text = '';
    notifyListeners();
  }

  changeText(String newValue) {
    text = newValue;
    notifyListeners();
  }
}
