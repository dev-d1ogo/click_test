import 'package:click_teste2/pages/home/controller.dart';
import 'package:flutter/material.dart';

class AudioPageController extends ChangeNotifier {
  static AudioPageController? _controller;
  static HomeController? homeController;

  AudioPageController._();

  factory AudioPageController() {
    _controller ??= AudioPageController._();
    return _controller!;
  }
}
