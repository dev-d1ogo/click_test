import 'package:click_teste2/controller/controller.dart';
import 'package:click_teste2/pages/chat/audio_page.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class ChatBar extends StatefulWidget {
  final Controller controller;

  const ChatBar({super.key, required this.controller});

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  final TextEditingController _inputController = TextEditingController();
  String response = "";
  bool hasText = false;

  void toggleStatus() {
    setState(() {
      hasText = !hasText;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _inputController.text = widget.controller.text;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                textAlign: TextAlign.start,
                controller: _inputController,
                minLines: 1,
                maxLines: null,
                onChanged: (value) {
                  widget.controller.changeText(_inputController.text);
                },
                autofocus: false,
                decoration: const InputDecoration(
                  hintText: "Digite sua dúvida",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  filled: true,
                  fillColor: Colors.transparent,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            _StartButton(widget: widget),
            _inputController.text.isNotEmpty && widget.controller.text != ""
                ? _SendButton(
                    widget: widget,
                    onMessageAdded: widget.controller.addItem,
                    toggleStatus: toggleStatus,
                  )
                : _AudioButton(
                    resetListen: widget.controller.stopListening,
                    resetStatus: widget.controller.resetStatus,
                  )
          ],
        ),
      ),
    );
  }
}

class _AudioButton extends StatelessWidget {
  final void Function() resetListen;
  final void Function() resetStatus;

  const _AudioButton(
      {super.key, required this.resetListen, required this.resetStatus});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        resetStatus();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AudioPage()));
      },
      icon: const Icon(Icons.headphones),
      style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white),
    );
  }
}

class _SendButton extends StatelessWidget {
  final Function(MessageType) onMessageAdded;
  final Function() toggleStatus;

  final controller = Controller();

  _SendButton(
      {super.key,
      required this.widget,
      required this.onMessageAdded,
      required this.toggleStatus});

  final ChatBar widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        controller.sendMessage();
      },
      icon: const Icon(Icons.send),
      style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white),
    );
  }
}

class _StartButton extends StatelessWidget {
  const _StartButton({
    super.key,
    required this.widget,
  });

  final ChatBar widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        final call = widget.controller.isListening
            ? widget.controller.stopListening
            : widget.controller.startListening;
        call();
      },
      icon: !widget.controller.isListening
          ? const Icon(Icons.mic)
          : const Icon(Icons.mic_off),
      style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white),
    );
  }
}
