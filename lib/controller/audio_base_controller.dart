import 'package:flutter/material.dart';

abstract class BaseController extends ChangeNotifier {
  String text = '';
  bool isListening = false;
  bool isLoading = false;
  bool enableToSpeech = false;
  bool isPaused = false;

  void changeText(String newValue) {
    text = newValue;
    notifyListeners();
  }

  void resetText() {
    text = '';
    notifyListeners();
  }
}
