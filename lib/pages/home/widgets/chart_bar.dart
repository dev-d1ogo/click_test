import 'package:click_teste2/api/call_boot.dart';
import 'package:click_teste2/pages/home/controller.dart';
import 'package:click_teste2/types/api_response.dart';
import 'package:click_teste2/types/message_type.dart';
import 'package:flutter/material.dart';

class ChatBar extends StatefulWidget {
  final HomeController controller;

  const ChatBar({super.key, required this.controller});

  @override
  State<ChatBar> createState() => _ChatBarState();
}

class _ChatBarState extends State<ChatBar> {
  final TextEditingController _inputController = TextEditingController();
  String response = "";

  void setResponse(String message) {
    setState(() {
      response = message;
    });
  }

  @override
  void initState() {
    super.initState();
    // Adicione um listener para atualizar o TextField quando o texto transcrito mudar
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
                // onChanged: (value) =>
                //     {print(value), widget.controller.text = value},
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
            _SendButton(
              widget: widget,
              inputController: _inputController,
              onMessageAdded: widget.controller.addItem,
            )
          ],
        ),
      ),
    );
  }
}

class _SendButton extends StatelessWidget {
  final TextEditingController inputController;
  final Function(MessageType) onMessageAdded;

  const _SendButton(
      {super.key,
      required this.widget,
      required this.inputController,
      required this.onMessageAdded});

  final ChatBar widget;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        MessageType userMessage = MessageType(
            message: widget.controller.text, type: MessageTypeEnum.message);
        onMessageAdded(userMessage);

        final message = widget.controller.text;

        widget.controller.resetText();
        inputController.clear();

        final data = await widget.controller.callApi(message);

        print("A data chegou aqui ${data.response}");
        final responseMessage = data.response;

        MessageType botMessage = MessageType(
            message: responseMessage, type: MessageTypeEnum.response);

        onMessageAdded(botMessage);
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
      onPressed: widget.controller.isListening
          ? widget.controller.stopListening
          : widget.controller.startListening,
      icon: !widget.controller.isListening
          ? const Icon(Icons.mic)
          : const Icon(Icons.mic_off),
      style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white),
    );
  }
}
