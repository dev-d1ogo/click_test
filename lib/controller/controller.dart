import 'package:click_teste2/services/api/call_boot.dart';
import 'package:click_teste2/services/listen/listen.service.dart';
import 'package:click_teste2/services/speak/speak.service.dart';
import 'package:click_teste2/types/api_response.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class Controller extends ChangeNotifier {
  static Controller? _controller;
  String text = '';
  bool isListening = false;
  bool isSpeaking = false;
  bool isLoading = false;
  bool enableToSpeech = false;
  bool isPaused = false;
  String _status = "initial";

  get status => _status;

  List<MessageType> messageList = [];

  late ListenService _serviceListen;
  final _serviceSpeak = SpeakService();

  Controller._() {
    enableToSpeech = true;
    _serviceListen = ListenService(
      onError: (error) {
        enableToSpeech = false;
      },
      onResult: _onSpeechResult,
      onStatus: (status) {
        isListening = status == "listening";
        notifyListeners();
      },
    );
  }

  factory Controller() {
    _controller ??= Controller._();
    return _controller!;
  }

  void _onSpeechResult(result) async {
    changeText(result.recognizedWords);
  }

  void onPlay() {
    togglePausedStatus();
    startListening();

    notifyListeners();
  }

  void onPause() {
    togglePausedStatus();
    stopListening();

    notifyListeners();
  }

  void togglePausedStatus() {
    isPaused = !isPaused;
    notifyListeners();
  }

  Future<ApiResponse> callApi(String text) async {
    _status = "processing";
    ApiResponse data = await callBot(text);
    _status = "speaking";
    _serviceSpeak.speak(data.response);
    return data;
  }

  onStatus(status) {
    isListening = status == "listening";
    _status = status;
    notifyListeners();
  }

  speak(String text) {
    isSpeaking = true;
    _serviceSpeak.speak(text);
    notifyListeners();
  }

  stopSpeak() {
    isSpeaking = false;
    notifyListeners();
  }

  void startListening() async {
    isPaused = false;

    enableToSpeech = await _serviceListen.startListening(onStatus);
    notifyListeners();
  }

  void stopListening() {
    _serviceListen.stopListening();
    notifyListeners();
  }

  void cancelListening() {
    _serviceListen.cancelListening();
    notifyListeners();
  }
  // void initListeningWithLongPress() {
  //   initListener();
  // }

  void changeText(String newValue) {
    text += newValue;
    notifyListeners();
  }

  void resetText() {
    text = '';
    notifyListeners();
  }

  void addItem(MessageType item) {
    messageList.add(item);
    notifyListeners();
  }
}
