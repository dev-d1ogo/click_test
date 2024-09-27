import 'package:click_teste2/pages/chat/audio_controller.dart';
import 'package:click_teste2/pages/chat/widgets/audio_control.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});
  static const routeName = '/audio';

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  final controller = AudioPageController();

  @override
  void initState() {
    super.initState();
    controller.initListner();

    // Future.delayed(Duration(seconds: 2), () {
    //   controller.startListening();
    // });
  }

  @override
  Widget build(BuildContext context) {
    print(controller.isPaused);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          "TIL",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                controller.isListening
                    ? PressToTalkButton(
                        startListening: controller.startListening,
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        color: Colors.red,
                      ),
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
          const AudioControl()
        ],
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
        padding: EdgeInsets.all(0), // Ajuste de padding para um botão circular
        backgroundColor: Colors.white54, // Cor de fundo do botão
      ),
      onPressed: () {
        startListening();
      },
      child: Container(
        height: 287,
        width: 287,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white54, // Mantendo a cor do círculo
        ),
      ),
    );
  }
}
