import 'package:click_teste2/api/call_boot.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../../types/api_response.dart';
// import 'package:flutter_tts/flutter_tts.dart';

class HomeController extends ChangeNotifier {
  static HomeController? _controller;
  final SpeechToText _speechToText = SpeechToText();
  final FlutterTts flutterTts = FlutterTts();

  String text = '';
  bool isListening = false;
  List<MessageType> messageList = [];

  bool enableToSpeech = false;

  void initSpeech() async {
    enableToSpeech = await _speechToText.initialize(
      onStatus: (status) {
        isListening = status == "listening";
        print(status);
        notifyListeners();

        if (status == "done") {
          callApi(text);
        }
      },
    ); //Retorna um boolean quando finalizar
  }

  speak(String text) async {
    await flutterTts.setLanguage("pt-BR");
    await flutterTts.setPitch(0.8);
    await flutterTts.setVolume(1);
    await flutterTts.speak(text);
  }
  // Funcao para começar a ouvir

  void startListening() async {
    await _speechToText.listen(
        listenFor: const Duration(seconds: 6),
        onResult: _onSpeechResult,
        localeId:
            "pt_BR"); // A função listen espera receber uma callback para quando tiver o resultado da fala do plugin

    print("Começou a  ouvir ${_speechToText.isListening}");
  }

  // Vai setar o estado da aplicação para o resultado obtido atraves da fala

  void _onSpeechResult(result) async {
    changeText(result.recognizedWords);
  }

  Future<ApiResponse> callApi(String text) async {
    ApiResponse data = await callBot(text);

    speak(data.response);

    return data;
  }
  // Funcao para parar o ouvinte

  void stopListening() async {
    await _speechToText.stop();

    print("Parou de ouvir");
  }
  // Singleton Pattern

  HomeController._();

  factory HomeController() {
    _controller ??= HomeController._();
    return _controller!;
  }

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
