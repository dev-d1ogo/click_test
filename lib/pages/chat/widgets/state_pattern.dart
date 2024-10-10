import 'package:click_teste2/pages/chat/widgets/animations.dart';
import 'package:flutter/material.dart';

abstract class State {
  Widget buildWidget();
}

class IdleState extends State {
  @override
  Widget buildWidget() => const Text("Segure para iniciar");
}

class LoadingState extends State {
  @override
  Widget buildWidget() => const Loading();
}

class ListeningState extends State {
  @override
  Widget buildWidget() => const ActiveMic();
}

class SpeakingState extends State {
  @override
  Widget buildWidget() => const SpeakAnimation();
}
