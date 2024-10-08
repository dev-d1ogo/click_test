import 'package:flutter/material.dart';

class AudioControl extends StatefulWidget {
  AudioControl({
    super.key,
    required this.isPaused,
    required this.onPlay,
    required this.onPause,
    required this.status,
    required this.onStart,
    required this.onCancel,
    required this.sendMessage,
  });

  final bool isPaused;
  String status; // Use String aqui
  final VoidCallback onPlay;
  final VoidCallback onPause;
  final VoidCallback onStart;
  final VoidCallback onCancel;
  final VoidCallback sendMessage;

  @override
  State<AudioControl> createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  String previousStatus = '';

  @override
  Widget build(BuildContext context) {
    if (widget.status == "done" && previousStatus != "done") {
      print(widget.status);
      widget.sendMessage();
      previousStatus = "done"; // Atualiza o status anterior
    } else if (widget.status != "done") {
      previousStatus = ''; // Reseta quando o status não é "done"
    }

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.status == 'initial' || widget.status == "done") &&
                  !widget.isPaused
              ? _InitialButton(start: widget.onStart)
              : !widget.isPaused
                  ? _PauseButton(pause: widget.onPause)
                  : _PlayButton(resume: widget.onPlay),
          Text(widget.status),
          _CancelButton(onCancel: widget.onCancel),
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
        pause();
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
  final VoidCallback onCancel;
  const _CancelButton({super.key, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onCancel();
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
  const _PlayButton({required this.resume});

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

class _InitialButton extends StatelessWidget {
  final VoidCallback start;
  const _InitialButton({required this.start});

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
