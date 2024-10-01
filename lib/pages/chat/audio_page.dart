import 'package:click_teste2/controller/speech_to_text_controller.dart';
import 'package:click_teste2/pages/chat/widgets/audio_control.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({super.key});
  static const routeName = '/audio';

  @override
  State<AudioPage> createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late SpeechToTextController controller;

  @override
  Widget build(BuildContext context) {
    // context.watch<SpeechToTextController>(); => Segunda maneira de acessar o contexto

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //  v
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TIL",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(12),
        child: Consumer<SpeechToTextController>(
          builder: (context, controller, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(controller.status == "listening"
                    ? "Ta ouvindo"
                    : "Nao ta ouvindo"),
                AudioControl(controller: controller)
              ],
            );
          },
        ),
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
