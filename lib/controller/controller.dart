import 'package:click_teste2/services/api/call_boot.dart';
import 'package:click_teste2/services/listen/listen.service.dart';
import 'package:click_teste2/services/speak/speak.service.dart';
import 'package:click_teste2/types/api_response.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

enum PageStates {
  initial,
  done,
  listening,
  listeningLongPress,
  speaking,
  loading,
  idle
}

class Controller extends ChangeNotifier {
  static Controller? _controller;
  PageStates state = PageStates.initial;
  String text = '';
  bool isListening = false;
  bool isRecording = true;
  List<String> allRecognizedWords = [];
  bool isSpeaking = false;
  bool isLoading = false;
  bool enableToSpeech = false;
  bool isPaused = false;
  String _status = "initial";

  get status => _status;

  get isIdle =>
      ["initial", "done"].contains(status) && !isSpeaking && !isLoading;

  List<MessageType> messageList = [];

  late ListenService _serviceListen;
  late SpeakService _serviceSpeak;

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

    _serviceSpeak = SpeakService(
        onSpeechComplete: _onSpeechComplete, onSpeechStart: _onSpeechStart);
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

    state = PageStates.listening;

    notifyListeners();
  }

  void onPause() {
    togglePausedStatus();
    stopListening();
    state = PageStates.idle;
    notifyListeners();
  }

  void togglePausedStatus() {
    isPaused = !isPaused;
    notifyListeners();
  }

  void toggleLoadingStatus(bool newStatus) {
    isLoading = newStatus;
    notifyListeners();
  }

  Future<ApiResponse> callApi(String text) async {
    isLoading = true;
    ApiResponse data = await callBot(text);
    isLoading = false;
    state = PageStates.loading;
    _serviceSpeak.speak(data.response);
    return data;
  }

  onStatus(status) async {
    isListening = status == "listening";
    switch (status) {
      case 'listening':
        state = PageStates.listening;
        break;
      case 'done':
        state = PageStates.done;
        break;
      case 'notListening':
        state = PageStates.idle;
        break;
      default:
        state = PageStates.idle;
    }

    _status = status;

    // if (isRecording && status == "notListening") {
    //   debugPrint("status: should continue");
    //   await _serviceListen.stopListening();
    //   await _serviceListen.startListening(onStatus);
    // }
    notifyListeners();
  }

  onStatusLoop(status) async {
    isListening = status == "listening";
    _status = status;

    // if (isRecording && status == "notListening") {
    //   debugPrint("status: should continue");
    //   await _serviceListen.stopListening();
    //   await _serviceListen.startListening(onStatusLoop);
    // }
    notifyListeners();
  }

  speak(String text) {
    isSpeaking = true;
    state = PageStates.speaking;
    _serviceSpeak.speak(text);
    notifyListeners();
  }

  stopSpeak() {
    isSpeaking = false;
    _serviceSpeak.stop();
    state = PageStates.idle;
    notifyListeners();
  }

  void startListening() async {
    isPaused = false;
    state = PageStates.listening;
    print(status);

    if (status == "listening") {
      return;
    }

    enableToSpeech = await _serviceListen.startListening(onStatus);
    notifyListeners();
  }

  Future<void> stopListening() async {
    _status = 'done';
    state = PageStates.idle;
    await _serviceListen.stopListening();
    notifyListeners();
  }

  void cancelListening() {
    state = PageStates.idle;
    _serviceListen.cancelListening();
    notifyListeners();
  }

  void _onSpeechComplete() {
    state = PageStates.idle;
    isSpeaking = false;
    notifyListeners();
  }

  void _onSpeechStart() {
    state = PageStates.speaking;
    isSpeaking = true;

    notifyListeners();
  }

  void resetStatus() {
    state = PageStates.initial;
    _status = "initial";
    notifyListeners();
  }

  void changeText(String newValue) {
    text = newValue;
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

  void changeStatus(String newStatus) {
    _status = newStatus;
    notifyListeners();
  }

  void setLoading() {}
  void sendMessage() async {
    isLoading = true;
    MessageType userMessage =
        MessageType(message: text += "?", type: MessageTypeEnum.message);

    addItem(userMessage);

    final message = text;

    print(message);
    resetText();

    final data = await callApi(message);

    print("A data chegou aqui ${data.response}");

    isLoading = false;

    MessageType botMessage =
        MessageType(message: data.response, type: MessageTypeEnum.response);

    addItem(botMessage);
  }
}
