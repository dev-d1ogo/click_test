import 'package:click_teste2/services/api/call_boot.dart';
import 'package:click_teste2/services/speak/speak.service.dart';
import 'package:click_teste2/types/api_response.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class MessageController extends ChangeNotifier {
  List<MessageType> messageList = [];
  String _text = '';

  final _serviceSpeak = SpeakService();
  String get text => _text;

  void setText(String text) {
    _text = text;
    notifyListeners();
  }

  void addItem(MessageType item) {
    messageList.add(item);
    notifyListeners();
  }

  Future<ApiResponse> callApi(String text) async {
    ApiResponse data = await callBot(text);
    _serviceSpeak.speak(data.response);
    return data;
  }

  speak(String text) => _serviceSpeak.speak(text);
}
