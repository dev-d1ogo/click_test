import 'package:flutter/material.dart';

class AudioControl extends StatefulWidget {
  const AudioControl(
      {super.key,
      required this.isPaused,
      required this.onPlay,
      required this.onPause,
      required this.status,
      required this.onStart,
      required this.onCancel});

  final bool isPaused;
  final String status;
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onStart;
  final VoidCallback onCancel;

  @override
  State<AudioControl> createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          widget.status == 'initial' || widget.status == "done"
              ? _InitialButton(start: widget.onStart)
              : !widget.isPaused
                  ? _PauseButton(pause: widget.onPause)
                  : _PlayButton(
                      resume: widget.onPlay,
                    ),
          Text(widget.status),
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

class _InitialButton extends StatelessWidget {
  final VoidCallback start;
  const _InitialButton({super.key, required this.start});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        start();
      },
      icon: const Icon(Icons.mic),
      style: IconButton.styleFrom(
        iconSize: 42,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
