import 'package:flutter/material.dart';

class AudioControl extends StatefulWidget {
  const AudioControl(
      {super.key,
      required this.isPaused,
      required this.onPlay,
      required this.onPause});

  final bool isPaused;
  final VoidCallback onPlay;
  final VoidCallback onPause;

  @override
  State<AudioControl> createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  @override
  Widget build(BuildContext context) {
    print("Esta pausado: ${widget.isPaused}");

    // Retorne um widget apropriado com base no estado da sua aplicação
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.isPaused
              ? _PauseButton(pause: widget.onPause)
              : _PlayButton(
                  resume: widget.onPlay,
                ),
          _CancelButton(),
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
