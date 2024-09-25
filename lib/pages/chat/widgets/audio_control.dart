import 'package:flutter/material.dart';

class AudioControl extends StatelessWidget {
  final dynamic state;

  const AudioControl({super.key, this.state});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _PauseButton(widget: AudioControl()),
          _CancelButton(widget: AudioControl())
        ],
      ),
    );
  }
}

class _PauseButton extends StatelessWidget {
  const _PauseButton({super.key, required this.widget});

  final AudioControl widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {},
        icon: const Icon(Icons.pause),
        style: IconButton.styleFrom(
            iconSize: 42,
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white));
  }
}

class _CancelButton extends StatelessWidget {
  const _CancelButton({super.key, required this.widget});

  final AudioControl widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {},
      icon: const Icon(Icons.cancel),
      style: IconButton.styleFrom(
          iconSize: 42,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white),
    );
  }
}
