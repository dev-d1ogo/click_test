import 'package:click_teste2/controller/speech_to_text_controller.dart';
import 'package:flutter/material.dart';

class AudioControl extends StatelessWidget {
  final SpeechToTextController controller;

  const AudioControl({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.isPaused && controller.status_state == "notListening"
              ? _PauseButton(pause: controller.pause)
              : _PlayButton(
                  resume: controller.resume,
                ),
          Text(controller.status_state),
          const _CancelButton(),
        ],
      ),
    );
  }
}

class _PauseButton extends StatelessWidget {
  final VoidCallback pause;
  const _PauseButton({super.key, required this.pause});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        pause(); // Chama a função de pausa passada
      },
      icon: const Icon(Icons.pause),
      style: IconButton.styleFrom(
        iconSize: 42,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(Icons.cancel),
      style: IconButton.styleFrom(
        iconSize: 42,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  final VoidCallback resume;
  const _PlayButton({super.key, required this.resume});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        resume();
      },
      icon: const Icon(Icons.play_arrow),
      style: IconButton.styleFrom(
        iconSize: 42,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
