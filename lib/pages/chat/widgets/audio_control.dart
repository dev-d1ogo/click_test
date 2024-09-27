import 'package:click_teste2/pages/chat/audio_controller.dart';
import 'package:flutter/material.dart';

class AudioControl extends StatefulWidget {
  const AudioControl({super.key});

  @override
  State<AudioControl> createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  final controller = AudioPageController();

  @override
  Widget build(BuildContext context) {
    print("Esta pausado: ${controller.isPaused}");

    // Retorne um widget apropriado com base no estado da sua aplicação
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          controller.isPaused
              ? _PauseButton(pause: controller.togglePausedStatus)
              : _PlayButton(
                  resume: controller.togglePausedStatus,
                ),
          const _CancelButton(widget: AudioControl()),
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

// As classes _CancelButton e _PlayButton devem ser definidas também
// Assegure-se de que essas classes também retornem um Widget válido

class _CancelButton extends StatelessWidget {
  final AudioControl widget;
  const _CancelButton({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Implementar lógica de cancelar
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
        // Implementar lógica de reprodução
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
