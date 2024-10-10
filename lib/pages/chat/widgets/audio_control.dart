import 'package:click_teste2/controller/controller.dart';
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
    required this.recognizedText,
    required this.onCancelSpeak,
    required this.isSpeaking,
  });

  final String recognizedText;
  final bool isPaused;
  final bool isSpeaking;
  String status;
  final VoidCallback onPlay;
  final VoidCallback onCancelSpeak;
  final VoidCallback onPause;
  final VoidCallback onStart;
  final VoidCallback onCancel;
  final VoidCallback sendMessage;

  @override
  State<AudioControl> createState() => _AudioControlState();
}

class _AudioControlState extends State<AudioControl> {
  String previousStatus = '';

  void toggleStatusToInitialStatus() {
    widget.status = "initial";
  }

  @override
  Widget build(BuildContext context) {
    bool isAvaibleToSendMessage = widget.status == "done" &&
        previousStatus != "done" &&
        widget.recognizedText != "";

    if (isAvaibleToSendMessage) {
      widget.sendMessage();
      previousStatus = "done";
    } else if (widget.status != "done") {
      previousStatus = '';
    }

    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          (widget.status == 'initial' || widget.status == "done") &&
                  !widget.isPaused &&
                  !widget.isSpeaking
              ? _InitialButton(start: widget.onStart)
              : widget.isSpeaking
                  ? const _CancelSpeakingButton()
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
        iconSize: 32,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}

class _CancelSpeakingButton extends StatelessWidget {
  const _CancelSpeakingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Controller();
    return IconButton(
      onPressed: () async {
        await controller.stopSpeak();
      },
      icon: const Icon(Icons.square),
      style: IconButton.styleFrom(
        iconSize: 32,
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
        Navigator.pop(context);
        onCancel();
      },
      icon: const Icon(Icons.cancel),
      style: IconButton.styleFrom(
        iconSize: 32,
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
        iconSize: 32,
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
        iconSize: 32,
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
    );
  }
}
