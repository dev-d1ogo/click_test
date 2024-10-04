import 'package:click_teste2/controller/controller.dart';
import 'package:click_teste2/pages/chat/widgets/animations.dart';
import 'package:click_teste2/pages/chat/widgets/audio_control.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});
  static const routeName = '/audio';

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final controller = Controller();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TIL",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    controller.isListening
                        ? const ActiveMic()
                        : controller.isSpeaking
                            ? SpeakAnimation()
                            : Text("Segure para iniciar"),
                    const SizedBox(
                      height: 32,
                    ),
                  ],
                ),
              ),
              AudioControl(
                isPaused: controller.isPaused,
                onPause: controller.onPause,
                onPlay: controller.onPlay,
                status: controller.status,
                onStart: controller.startListening,
                onCancel: controller.cancelListening,
              )
            ],
          );
        },
      ),
    );
  }
}

class PressToTalkButton extends StatelessWidget {
  final VoidCallback startListening;
  const PressToTalkButton({
    super.key,
    required this.startListening,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(
              0), // Ajuste de padding para um botão circular
          backgroundColor: Colors.white54, // Cor de fundo do botão
        ),
        onPressed: () {
          startListening();
        },
        child: const Icon(Icons.phone));
  }
}
