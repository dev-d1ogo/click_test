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
  bool isLongPressTalk = false;

  @override
  void initState() {
    super.initState();
  }

  Widget _buildStateWidget() {
    if (controller.isLoading) {
      return const Loading();
    } else if (controller.isListening && !isLongPressTalk) {
      return const ActiveMic();
    } else if (controller.isSpeaking) {
      return const SpeakAnimation();
    } else if (isLongPressTalk) {
      return ListenAnimation();
    } else {
      return PressToTalkButton(startListening: controller.startListening);
      ;
    }
  }

  toggleLongPressState() {
    setState(() {
      isLongPressTalk = !isLongPressTalk;
    });
  }

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
              Text(controller.text),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onLongPress: controller.isIdle
                          ? () {
                              toggleLongPressState();
                              controller.startListening();
                            }
                          : null,
                      onLongPressEnd: (details) {
                        controller.stopListening();
                        toggleLongPressState();
                      },
                      child: _buildStateWidget(),
                    ),
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
                sendMessage: controller.sendMessage,
                recognizedText: controller.text,
                onCancelSpeak: controller.stopSpeak,
                isSpeaking: controller.isSpeaking,
              ),
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
    return GestureDetector(
      onTap: startListening,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // O efeito de sombra maior
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple[200]!
                  .withOpacity(0.4), // Cor mais clara para o efeito externo
            ),
          ),
          // O círculo interno
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.purple[800]!
                  .withOpacity(0.5), // Cor mais escura para o efeito interno
            ),
          ),
          // Ícone ou conteúdo dentro do círculo
          const Icon(
            Icons.mic, // O ícone do microfone
            color: Colors.white,
            size: 50,
          ),
        ],
      ),
    );
  }
}
