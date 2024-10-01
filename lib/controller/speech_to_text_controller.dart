import 'package:click_teste2/services/listen/listen.service.dart';
import 'package:flutter/material.dart';

class SpeechToTextController extends ChangeNotifier {
  final ListenService _listenService;

  String status = "notListening";
  bool enableToSpeech = false;
  String recognizedText = "";

  SpeechToTextController() : _listenService = ListenService() {
    _listenService.onStatus = (String status) {
      _updateStatus(status);
    };
    _listenService.onResult = _onSpeechResult;
  }

  Future<void> initListener() async {
    final enableToSpeech = await _listenService.init();

    if (!enableToSpeech) {
      _updateStatus('error');
    }

    notifyListeners();
  }

  String getStatus() {
    return status;
  }

  String getText() {
    return recognizedText;
  }

  void _updateStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }

  void _onSpeechResult(result) async {
    changeText(result.recognizedWords);
  }

  void changeText(String newValue) {
    recognizedText = newValue;
    notifyListeners();
  }

  void resetText() {
    recognizedText = '';
    notifyListeners();
  }
}
