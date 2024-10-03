import 'package:click_teste2/controller/controller.dart';
import 'package:click_teste2/pages/chat/widgets/audio_control.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
                        ? PressToTalkButton(
                            startListening: controller.startListening,
                          )
                        : Lottie.network(
                            'https://lottie.host/53009fb2-9a7f-4354-89c0-c67e7e954253/F8eIVotCJi.json',
                            height: 150,
                            width: 150,
                            animate: true),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "Toque ou pressione para começar a falar",
                      style: TextStyle(),
                    )
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
